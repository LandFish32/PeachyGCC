
@{{BLOCK(Xbutton)

@=======================================================================
@
@	Xbutton, 8x16@4, 
@	+ 2 tiles not compressed
@	Total size: 64 = 64
@
@	Time-stamp: 2024-10-26, 18:03:15
@	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
@	( http://www.coranac.com/projects/#grit )
@
@=======================================================================

	.section .rodata
	.align	2
	.global XbuttonTiles		@ 64 unsigned chars
	.hidden XbuttonTiles
XbuttonTiles:
	.word 0x00006660,0x00066666,0x00666666,0x00666666,0x00676766,0x06676760,0x06667660,0x06676760
	.word 0x06676760,0x06666600,0x06666600,0x06666600,0x06666600,0x00666000,0x00000000,0x00000000

@}}BLOCK(Xbutton)
