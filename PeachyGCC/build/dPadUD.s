
@{{BLOCK(dPadUD)

@=======================================================================
@
@	dPadUD, 8x16@4, 
@	+ 2 tiles not compressed
@	Total size: 64 = 64
@
@	Time-stamp: 2024-10-26, 18:03:17
@	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
@	( http://www.coranac.com/projects/#grit )
@
@=======================================================================

	.section .rodata
	.align	2
	.global dPadUDTiles		@ 64 unsigned chars
	.hidden dPadUDTiles
dPadUDTiles:
	.word 0x07777777,0x07666667,0x07667667,0x07677767,0x07677767,0x07666667,0x07666667,0x06666660
	.word 0x00666600,0x00066000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000

@}}BLOCK(dPadUD)
