# icnsdump

This is a command-line tool for OS X that will read in an IconFamily (.icns) file and list all of the element types contained within, along with—whenever possible—their sizes in pixels and their color depths.

This tool was written and tested on Lion, but if you're willing to put in a bit of elbow grease, you should be able to get it to build and run on any version of OS X.

## Example

<pre>% <kbd>icnsdump AppIcon.icns</kbd>
2012-08-09 16:59:16.354 icnsdump[2835:707] 'TOC '
2012-08-09 16:59:16.362 icnsdump[2835:707] - 'ic08'
2012-08-09 16:59:16.382 icnsdump[2835:707] - 'ic10'
2012-08-09 16:59:16.388 icnsdump[2835:707] - 'ic13'
2012-08-09 16:59:16.395 icnsdump[2835:707] - 'ic09'
2012-08-09 16:59:16.402 icnsdump[2835:707] - 'ic12'
2012-08-09 16:59:16.406 icnsdump[2835:707] - 'ic07'
2012-08-09 16:59:16.417 icnsdump[2835:707] - 'icp5'
2012-08-09 16:59:16.419 icnsdump[2835:707] - 'l8mk'
2012-08-09 16:59:16.420 icnsdump[2835:707] - 'ic11'
2012-08-09 16:59:16.438 icnsdump[2835:707] - 'icp4'
2012-08-09 16:59:16.439 icnsdump[2835:707] - 's8mk'
2012-08-09 16:59:16.441 icnsdump[2835:707] - 'ic14'
2012-08-09 16:59:16.442 icnsdump[2835:707] 'ic08'
2012-08-09 16:59:16.445 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.446 icnsdump[2835:707] - 256 by 256 pixels
2012-08-09 16:59:16.447 icnsdump[2835:707] - 72 by 72 DPI
2012-08-09 16:59:16.448 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.449 icnsdump[2835:707] 'ic10'
2012-08-09 16:59:16.451 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.451 icnsdump[2835:707] - 1024 by 1024 pixels
2012-08-09 16:59:16.452 icnsdump[2835:707] - 143.99 by 143.99 DPI
2012-08-09 16:59:16.453 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.454 icnsdump[2835:707] 'ic13'
2012-08-09 16:59:16.455 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.455 icnsdump[2835:707] - 256 by 256 pixels
2012-08-09 16:59:16.456 icnsdump[2835:707] - 143.99 by 143.99 DPI
2012-08-09 16:59:16.456 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.457 icnsdump[2835:707] 'ic09'
2012-08-09 16:59:16.458 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.459 icnsdump[2835:707] - 512 by 512 pixels
2012-08-09 16:59:16.460 icnsdump[2835:707] - 72 by 72 DPI
2012-08-09 16:59:16.460 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.461 icnsdump[2835:707] 'ic12'
2012-08-09 16:59:16.463 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.466 icnsdump[2835:707] - 64 by 64 pixels
2012-08-09 16:59:16.468 icnsdump[2835:707] - 143.99 by 143.99 DPI
2012-08-09 16:59:16.472 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.476 icnsdump[2835:707] 'ic07'
2012-08-09 16:59:16.479 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.479 icnsdump[2835:707] - 128 by 128 pixels
2012-08-09 16:59:16.480 icnsdump[2835:707] - 72 by 72 DPI
2012-08-09 16:59:16.481 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.482 icnsdump[2835:707] 'icp5'
2012-08-09 16:59:16.484 icnsdump[2835:707] 'l8mk'
2012-08-09 16:59:16.485 icnsdump[2835:707] 'ic11'
2012-08-09 16:59:16.487 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.492 icnsdump[2835:707] - 32 by 32 pixels
2012-08-09 16:59:16.494 icnsdump[2835:707] - 143.99 by 143.99 DPI
2012-08-09 16:59:16.495 icnsdump[2835:707] - 8-bit RGB
2012-08-09 16:59:16.496 icnsdump[2835:707] 'icp4'
2012-08-09 16:59:16.497 icnsdump[2835:707] 's8mk'
2012-08-09 16:59:16.498 icnsdump[2835:707] 'ic14'
2012-08-09 16:59:16.499 icnsdump[2835:707] - public.png
2012-08-09 16:59:16.500 icnsdump[2835:707] - 512 by 512 pixels
2012-08-09 16:59:16.501 icnsdump[2835:707] - 143.99 by 143.99 DPI
2012-08-09 16:59:16.502 icnsdump[2835:707] - 8-bit RGB</pre>
