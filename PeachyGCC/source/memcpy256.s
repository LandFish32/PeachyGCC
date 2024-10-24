	.section .iwram,"ax",%progbits

	.balign 4
	.global memcpy256
	.arm
	@void memcpy256(void* dest,void* src,int length);	MAKE SURE YOUR ADDRESSES ARE WORD OR HALFWORD ALIGNED, BECAUSE I'M NOT GOING TO ALIGN IT FOR YOU
	.type memCpy256,%function

memcpy256:

	blockCopy:
		lsr r12,r2,#0x05	@r12=32 byte blocks
		cmp r12,#0x00
		beq wordCopy		@Go to wordCopy if there aren't any blocks to copy
		
		stmdb sp!,{r4-r10}
	blockCopyLoop:
		ldmia r1!,{r3-r10}
		stmia r0!,{r3-r10}
		subs r12,r12,#0x01
		bne blockCopyLoop	@Continue loop if blockCopyLoop-1!=0
	
		ldmia sp!,{r4-r10}
	wordCopy:
		and r12,r2,#0x0c	@r12=Bytes-(Bytes%4)=Words<<2
		cmp r12,#0x00
		beq byteCopy		@Branch if r2<4

	wordCopyLoop:
		ldr r3,[r1],#0x04	@Load contents of source into r3, incrementing r0 by 4
		str r3,[r0],#0x04	@Store contents of r3 into destination, incrementing r1 by 4
		
		subs r12,r12,#0x04
		bne wordCopyLoop	@Continue loop if r2-0x04!=0 (r2 is known to be a multiple of 4)

	byteCopy:
		and r12,r2,#0x03
		cmp r12,#0x00
		beq end

	byteCopyLoop:
		ldrb r3,[r1],#0x01	@Load byte into r3
		strb r3,[r0],#0x01	@Store r3 into destination
		
		subs r12,r12,#0x01
		bne byteCopyLoop
	end:
		bx lr