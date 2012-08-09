//
//  main.m
//  icnsdump
//
//  Created by Peter Hosey on 2012-08-09.
//  Copyright (c) 2012 Peter Hosey. All rights reserved.
//

#include <CoreServices/CoreServices.h>

static void readAndListIconFamilyFileAtPath(NSString *path);
static void listTypesInTOC(const void *ptr, size_t size);

#define POINTER_OFFSET(startptr, offptr) 
struct IconFamilyTOCElement {
	ResType elementType;
	SInt32 elementSize;
};

int main(int argc, char **argv) {
	@autoreleasepool {
		NSEnumerator *argsEnum = [[[NSProcessInfo processInfo] arguments] objectEnumerator];
		(void)[argsEnum nextObject];

		for (NSString *path in argsEnum) {
			readAndListIconFamilyFileAtPath(path);
		}
	}
	return EXIT_SUCCESS;
}

static void readAndListIconFamilyFileAtPath(NSString *path) {
	NSURL *URL = [NSURL fileURLWithPath:path];
	NSError *error = nil;
	NSData *data = [NSData dataWithContentsOfURL:URL options:0 error:&error];
	if (data != nil) {
		const struct IconFamilyResource *familyPtr = [data bytes];
		SInt32 resourceSize = (SInt32)CFSwapInt32BigToHost((uint32_t)familyPtr->resourceSize);
		NSCAssert(resourceSize == [data length], @"IconFamily data from %@ claims it is %i bytes, while the length of the file is %lu", path, resourceSize, [data length]);
		const struct IconFamilyElement *elementPtr = familyPtr->elements;
		while (((ptrdiff_t)&(elementPtr->elementSize) - (ptrdiff_t)familyPtr) < resourceSize) {
//			ptrdiff_t offset = ((ptrdiff_t)elementPtr - (ptrdiff_t)familyPtr);
//			NSLog(@"Offset: %lu", (unsigned long) offset);
			ResType elementType = CFSwapInt32BigToHost((uint32_t)elementPtr->elementType);
			NSLog(@"%@", NSFileTypeForHFSTypeCode(elementType));
			if (elementType == 'TOC ')
				listTypesInTOC(elementPtr->elementData, CFSwapInt32BigToHost(elementPtr->elementSize) - offsetof(IconFamilyElement, elementData));
//			NSLog(@"Next element in: %u", CFSwapInt32BigToHost(elementPtr->elementSize));
			elementPtr = (void*)elementPtr + (ptrdiff_t)CFSwapInt32BigToHost(elementPtr->elementSize);
		}
	}
}

static void listTypesInTOC(const void *ptr, size_t size) {
	NSCAssert(size % sizeof(struct IconFamilyTOCElement) == 0, @"TOC size %lu is not a multiple of %lu", (unsigned long)size, (unsigned long)sizeof(struct IconFamilyTOCElement));
	const struct IconFamilyTOCElement *elements = ptr;
	size_t numElements = size / sizeof(struct IconFamilyTOCElement);
	for (size_t i = 0; i < numElements; ++i) {
		ResType elementType = CFSwapInt32BigToHost((uint32_t)elements[i].elementType);
		NSLog(@"- %@", NSFileTypeForHFSTypeCode(elementType));
	}
}
