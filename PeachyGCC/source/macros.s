.section .ewram
.balign 2
.global macros
@Macro struct for automatic input sequences
@ALL MACRO DIRECTIONS WILL BE FLIPPED BASED ON THE LAST DIRECTION PRESSED. RIGHT=FORWARD

@struct controllerState{
@	u16 buttons;	15=0,14=L,13=R,12=Z,11=up,10=down,9=right,8=left,7=0,6=0,5=0,4=start,3=y,2=x,1=b,0=a
@	u8 dStickX;
@	u8 dStickY;
@	u8 cStickX;
@	u8 cStickY;
@	u8 Ltrig;
@	u8 Rtrig;
@};

@struct macro{
@	u16 length;
@	controllerState macroFrames[];
@};

macros:
	.word macro_EWGF

.balign 2
macro_EWGF:
	.hword 0x0003		@Macro is 3 frames long
	.hword 0x0000		@Padding. I don't know why I can't make it work with one halfword preceding the macro data

	.word 0x80ff0000	@No buttons, full forward on dStick
	.word 0x00008080	@No c-stick or triggers

	.word 0x00800000	@No buttons, full down on stick
	.word 0x00008080
	
	.word 0x49b60001	@A button, down forward on stick
	.word 0x00008080