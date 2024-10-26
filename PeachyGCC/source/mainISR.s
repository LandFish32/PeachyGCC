	#include "tonc_memdef.inc"
	#include "memmap.inc"

	.section .iwram,"ax",%progbits

	.balign 4
	.global ISRmain
	.arm
	@void ISRmain();
	.type ISRmain,%function
	
ISRmain:
	
	mov r0,#REG_BASE		@r0=Control register base address
	ldr r1,[r0,#0x0200]!	@r1=REG_IF|(REG_IE<<16)
	and r1,r1,r1,lsr #0x10	@r1=REG_IF&REG_IE=IRQ
	


	_L1:
	tst r1,#IRQ_SERIAL
	beq _L2
		
	@serial port interrupt
	
		str lr,[sp,#-0x04]!		@Push lr onto stack
		ldr r3,=linkPortISR
		mov lr,pc
		bx r3					@Branch to link port ISR
		ldr lr,[sp],#0x04		@Pop lr from stack

		mov r0,#REG_BASE		@Clear linkPort IRQ
		add r0,r0,#0x0200
		mov r1,#IRQ_SERIAL
		strh r1,[r0,#0x02]
		bx lr

	_L2:

		strh r1,[r0,#0x02]					@Don't do anything special for vBlank or vCount interrupts. Speed is key

		ldr r3,[r0,#-0x0208]							@REG_IFBIOS|=IRQ
		orr r3,r3,r1
		str r3,[r0,#-0x0208]
		bx lr
