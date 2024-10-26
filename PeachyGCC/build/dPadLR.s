
@{{BLOCK(dPadLR)

@=======================================================================
@
@	dPadLR, 16x8@4, 
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
	.global dPadLRTiles		@ 64 unsigned chars
	.hidden dPadLRTiles
dPadLRTiles:
	.word 0x67777777,0x66666667,0x66677667,0x66677767,0x66677667,0x66666667,0x07777777,0x00000000
	.word 0x00000000,0x00000006,0x00000066,0x00000066,0x00000006,0x00000000,0x00000000,0x00000000

@}}BLOCK(dPadLR)
