	#include "inc/tonc_memdef.inc"
	#include "inc/memmap.inc"
	
	.section	.ewram,"ax",%progbits
	
	.balign 2
	
	.global main
	.code 16
	.thumb_func
	.type main,%function

main:
	init:
		ldr r0,=REG_BASE			@r0=IO register base address


		@Reset REG_IME
		ldr r2,=REG_IE				@r2=REG_IE
		
		str r2,[r2,#0x08]			@REG_IME=disabled

		@Set VBlank interrupt in REG_IE, and clear flags in REG_IF
		ldr r4,=(0xffff0000|IRQ_VBLANK|IRQ_SERIAL)			@Set VBlank interrupt enable, clear IRQ flags
		str r4,[r2]

		@Set user interrupt vector in BIOS
		ldr r1,=ISRmain
		ldr r3,=REG_ISR_MAIN		@r3=user interrupt function pointer in bios
		str r1,[r3]
		strh r1,[r0]				@dispcnt=OBJ display||1d mapping
		
		@Set vblank interrupt in dispstat
		mov r1,#DSTAT_VBL_IRQ
		strh r1,[r0,#0x04]
		
		@Initialize SIO port
		ldr r0,=REG_RCNT					@r0=rcnt
		ldr r1,=(R_MODE_GPIO|GPIO_IRQ|GPIO_SO_IO|GPIO_SO)
		str r1,[r0]							@RCNT=GP mode||interrupts enabled (but not yet in REG_IE)
		
		

		@Enable interrupts in REG_IME
		str r4,[r2,#0x08]			@REG_IME=enabled

		swi #0x05		@Wait for vblank
		
		@Initialize OAM
		ldr r0,=ATTR0_HIDE
		ldr r1,=MEM_OAM			@r1=OAM base address
		
		ldr r2,=0x0400				@r2=0x0400=1024

		disableObject:
			str r0,[r1]				@Set object in OAM to disabled
			add r1,r1,#0x08			@Increment r1 to point to next entry
			tst r1,r2				@If r1&&r2!=0, break from loop
			beq disableObject
		

		@Initialize palette. The palette data will not be modified for the rest of the time the program is running
		ldr r1,=palettePal	@Load address of palette to r0
		ldr r0,=MEM_PAL_BG
		ldr r2,=512		@Copy all colors
		
		ldr r3,=memcpy256		@Call memcpy function
		bl _call_via_r3
		
		ldr r1,=palettePal
		ldr r0,=MEM_PAL_OBJ
		ldr r2,=512		@Copy all 256 colors
		
		ldr r3,=memcpy256		@Call memcpy function
		bl _call_via_r3
		
		@Set display mode in dispcnt
		ldr r0,=REG_BASE
		ldr r1,=(DCNT_OBJ_1D|DCNT_OBJ)
		str r1,[r0]

		@Initialize program state
		ldr r0,=currentProcess		@Set current process to controlStateProcessPointer
		ldr r1,=controlStateProcess
		str r1,[r0]

		@Call the control state entry function
		ldr r4,=controlStateEntry
		bl _call_via_r4

	loop:
		swi #0x05		@Wait for vblank
		ldr r4,currentProcess
		bl _call_via_r4 
		b loop
		
	bx lr

.balign 4
currentProcess:
	.word 0x00000000