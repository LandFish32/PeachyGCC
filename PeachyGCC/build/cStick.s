
@{{BLOCK(cStick)

@=======================================================================
@
@	cStick, 16x16@4, 
@	+ 4 tiles not compressed
@	Total size: 128 = 128
@
@	Time-stamp: 2024-10-26, 18:03:16
@	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
@	( http://www.coranac.com/projects/#grit )
@
@=======================================================================

	.section .rodata
	.align	2
	.global cStickTiles		@ 128 unsigned chars
	.hidden cStickTiles
cStickTiles:
	.word 0x88800000,0x88888000,0x88888800,0x88888880,0x99888880,0x99988888,0x89988888,0x89988888
	.word 0x00000088,0x00008888,0x00088888,0x00888888,0x00888889,0x08888889,0x08888888,0x08888888
	.word 0x89988888,0x99988888,0x99888880,0x88888880,0x88888800,0x88888000,0x88800000,0x00000000
	.word 0x08888888,0x08888889,0x00888889,0x00888888,0x00088888,0x00008888,0x00000088,0x00000000

@}}BLOCK(cStick)
