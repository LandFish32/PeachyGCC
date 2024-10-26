#include "memmap.inc"
#include "tonc_memdef.inc"

.section .iwram,"ax",%progbits

	.balign 4
	.global linkPortISR
	.arm
	.type linkPortISR,%function
linkPortISR:
	@Load command in bit by bit in GP mode
	@ONE CYCLE=60ns					r0=timerCounter,r1=data,r2=scratch,r3=REG_RCNT,r12=receivedBits
	mov r0,#0x0a					@r0=10 loops
	ldr r3,=REG_RCNT
	SIfirstHIwait:					@Wait in a loop for SI to go high
		ldr r2,[r3]					@Loop=0.54us
		tst r2,#GPIO_SI
		bne receiveData				@Break from loop once SI goes high
		subs r0,r0,#0x01
		bne SIfirstHIwait
		bx lr						@Timeout at 5.4us
		
	receiveData:
		mov r1,#0x00				@Clear the incoming data register
		mov r12,#0x00				@r12=bitsIn
	bitReceiveLoop:
		mov r0,#0x0a				@r0=10 loops
		SIreceiveLOwait:			@Wait for SI to go low
			ldr r2,[r3]				@Loop=0.54us
			tst r2,#GPIO_SI
			beq LOwaitEnd			@Break from loop if SI is low
			subs r0,r0,#0x01
			bne SIreceiveLOwait
			bx lr
		LOwaitEnd:
		mov r0,#0xa					@r0=10 loops
		SIreceiveHIwait:			@Wait for SI to go high
			ldr r2,[r3]				@Loop=0.54us
			tst r2,#GPIO_SI
			bne HIwaitEnd			
			subs r0,r0,#0x01
			bne SIreceiveHIwait
			bx lr
		HIwaitEnd:
			cmp r0,#0x07			@If count>5, then hold time<1.5us, and the bit is 1
			add r12,r12,#0x01
			lsl r1,r1,#0x01
			bcc bitReceiveLoop		@Go back to start of loop if bit==0, otherwise, put a 1 in data and perform a stop bit check
			orr r1,r1,#0x01			@Shift a 1 into the LSB of r1 if hold time<2.5us. 0 otherwise
			tst r12,#0x07
			bne bitReceiveLoop		@Break from loop and go to decodeCommand if stop bit was received


	@Decode the command received using switch cases
	decodeCommand:
		lsr r1,r1,#0x01				@Shift data register left by 1 to remove the stop bit
		
		add r12,r1,#0x00

		stmdb sp!,{r4-r7}			@We finally have some time to push registers to stack, which will obviously be helpful
		
		mov r2,r1,lsr #0x10			@Get byte 2 of r1 into r2

		chkStatCommand:				@Check byte 2 to see if any commands match
		cmp r2,#0x40				@Check if command is a status command
		bne chkRecalibrateCommand

		statusCommand:
			ldrb r0,ID+2			@Update ID response byte 3 with current rumble state and poll mode
			bic r0,r0,#0x0f			@Clear lower 4 bits of r5
			orr r0,r0,r1			@Apply poll mode to r5
			orr r0,r0,r1,lsr #0x0e	@Apply rumble mode to r5
			strb r0,ID+2			@Save updated ID response byte 3 back to memory
			
			ldr r0,=controllerState	@Copy controller state data into r5 and r7
			ldmia r0,{r5,r7}		@The first 4 bytes of the status response are always the same, so I load them directly into r5
									@The last 4 bytes depend on the poll mode, so they will possibly be changed before being put into r6
									@The response for a status command is always 8 bytes, so r7 can be used as a scratch register
			ldr r2,=originFlags
			ldrh r2,[r2]
			orr r5,r5,r2			@Combine the first 4 bytes of controller state with flags to get the correct 2 bytes for status command response

			and r0,r1,#0xff			@Check only the poll mode byte of r1
			mov r1,#0x40			@Data length=64 bits

			chkPollMode0:
			cmp r0,#0x00
			bne chkPollMode1
			pollMode0:				@Poll mode 0 has a full resolution c-stick, but only 4 bits for each trigger and button analog
				mov r6,r7,lsl #0x10
				lsr r6,r6,#0x10			@Copy only the c-stick axis bytes into r6
				lsr r7,r7,#0x14			@r7=00000...R7,R6,R5,R4,R3,R2,R1,R0,L7,L6,L5,L4
				mov r0,r7,lsl #0x04
				and r0,r0,#0xff00		@r0=00000...L7,L6,L5,L4,0000
				orr r0,r0,r7,lsr #0x08
				orr r6,r6,r0,lsl #0x10	@r6=00000000,L[7..4],R[7..4],Cy[7..0],Cx[7..0]
				b sendData

			chkPollMode1:
			cmp r0,#0x01
			bne chkPollMode2
			pollMode1:					@Low resolution c-stick, high resolution trigger and button analogs
				mov r0,r7,lsr #0x10		@Move trigger analogs into r0
				ldr r2,=0x0000f0f0
				and r7,r7,r2			@Clear out least significant bits of c-stick data
				orr r6,r7,r7,lsr #0xc	@Orr the 4 bit c-stick values into r6
				and r6,r6,#0xff
				orr r6,r6,r0,lsl #0x08	@Orr the trigger analog values into r6
				b sendData

			chkPollMode2:
			cmp r0,#0x02
			bne chkPollMode3
			pollMode2:					@Low resolution c-stick and triggers, high resolution button analog
				ldr r2,=0xf0f0f0f0		@Clear out low 4 bits of everything
				and r7,r2,r7			@r7=R0L0Y0X0
				lsr r2,r7,#0x0c			@r2=000R0L0Y
				orr r7,r7,r2			@r7=R0LRYLXY
				bic r7,#0xff00
				bic r7,#0xff000000
				orr r6,r7,r7,lsr #0x08
				b sendData

			chkPollMode3:
			cmp r0,#0x03
			bne chkPollMode4
			pollMode3:					@Poll mode 3 requires bytes in the exact format I have them stored in memory, so this one is easy
				mov r6,r7
				b sendData

			chkPollMode4:
			cmp r0,#0x04
			bne end
			pollMode4:					@Poll mode 4 is identical to poll 3, except the L and R analog is replaced by A and B analog, which are always 0
				mov r6,r7
				bic r6,r6,#0xff000000	@The games that do for some reason use poll mode 4 are unlikely to rely on these bytes being 0
				bic r6,r6,#0x00ff0000	@so clearing them may not be necessary
				b sendData
		
		chkRecalibrateCommand:
		cmp r2,#0x42					@Check for recalibrate or origin command
		cmpne r1,#0x41
		bne chkIDcommand
		recalibrateOriginCMD:
			mov r5,#0x80000000			@r5=neutral d stick, no buttons held
			orr r5,#0x00800000
			lsr r6,r5,#0x10				@r6=neutral c stick, triggers not pressed
			mov r7,#0x00				@r7=cleared
			ldr r1,=originFlags
			ldrh r2,[r1]
			orr r5,r5,r2				@Put the flags into the first 2 bytes of r5
			bic r2,r2,#0x20				@Set "origin sent" flag
			strh r2,[r1]
			mov r1,#0x50				@Response length=80 bits
			b sendData

		chkIDcommand:					@Check if command is ID or reset
		cmp r1,#0x00
		cmpne r1,#0x7f
		bne end
		IDresetCommand:					@ID and reset are functionally the same, so they share a label
			ldr r1,=originFlags
			ldrh r2,[r1]
			orr r2,r2,#0x20				@Clear "origin sent" flag
			strh r2,[r1]
			
			ldr r2,=ID
			ldr r5,[r2]
			orr r5,r5,#0x00100000		@Origin sent to console=false
			str r5,[r2]
			mov r1,#0x18				@Command length=24 bits
			b sendData
		
	sendData:

		ldr r0,=responseBuffer
		stmia r0,{r5-r7}			@r0 will be a pointer to the response buffer, and data will be sent from lowest to highest byte, but highest to lowest bit.

		ldr r7,=(R_MODE_GPIO|GPIO_IRQ|GPIO_SO_OUTPUT)			@r7=SO_low
		orr r6,r7,#GPIO_SO										@r6=SO_high

	sendBitLoop:					@r0=bufferPtr,r1=msg length,r5=data,r2=scratch
		str r7,[r3]					@Set SO to low now, figure out how long to hold later
		tst r1,#0x07
		ldreqb r5,[r0],#0x01		@Load next byte into r5 and increment bufferPtr if r0%8==0
		ldrne r2,[r2]				@This instruction ensures timing is the same no matter if the conditional passed
		tst r5,#0x80				@Test bit 7 of data to determine low hold time
		mov r2,#0x02				@Load a hold timer into r2
		moveq r2,#0x0a				@Set timer to 10 loops if low bit is being sent
		sendBitLowLoop:
			subs r2,r2,#0x01
			bne sendBitLowLoop
		nop
		str r6,[r3]					@Set SO to high now. The time between setting SO low and now is either 17 or 50 cycles (1 or 3us)
		tst r5,#0x80				@Check r5 again, because the countdown cleared flags
		mov r2,#0x0a				@Set hold time to 10 loops if high, and 2 if low
		moveq r2,#0x02

		sendBitHighLoop:
			subs r2,r2,#0x01
			bne sendBitHighLoop

		lsl r5,r5,#0x01				@Shift r5 to next bit
		subs r1,r1,#0x01
		bne sendBitLoop

	sendStopBit:
		nop							@Timing nops
		nop
		str r7,[r3]
		mov r2,#0x04				@-
		stopBitLowLoop:				@|
			subs r2,r2,#0x01		@|-16 cycles~=1us
			bne stopBitLowLoop		@|
		str r6,[r3]					@-
	end:
		ldmia sp!,{r4-r7}
		bx lr

.balign 4
originFlags:
	.hword 0x8020		@ORRed with the first 2 bytes of controller state to get the first 2 bytes of the command response

.balign 4
ID:
	.hword 0x0009	@Information about controller attributes. Contains information about past transfers
	.byte 0x00
	.byte 0x00		@Padding

.balign 4
responseBuffer:
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
