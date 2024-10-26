
@{{BLOCK(Bbutton)

@=======================================================================
@
@	Bbutton, 16x16@4, 
@	+ 4 tiles not compressed
@	Total size: 128 = 128
@
@	Time-stamp: 2024-10-26, 18:03:13
@	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
@	( http://www.coranac.com/projects/#grit )
@
@=======================================================================

	.section .rodata
	.align	2
	.global BbuttonTiles		@ 128 unsigned chars
	.hidden BbuttonTiles
BbuttonTiles:
	.word 0x22222000,0x21112200,0x11111120,0x12221122,0x21121112,0x12221112,0x21121112,0x12221122
	.word 0x00000000,0x00000002,0x00000021,0x00000221,0x00000211,0x00000211,0x00000211,0x00000221
	.word 0x11111120,0x21112200,0x22222000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000
	.word 0x00000021,0x00000002,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000,0x00000000

@}}BLOCK(Bbutton)
