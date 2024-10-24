	#include "inc/tonc_memdef.inc"
	#include "inc/memmap.inc"

	.section .iwram,"ax",%progbits

	.balign 4
	.global processInput	@void processInput(bool newFrame);
	.arm
	.type processInput,%function
processInput:
	stmdb sp!,{r4-r7}		@r4-r5: Controller state buffer
							@r6: GBA keypad state
							@r7: Action pointer
							@r0: Bool that indicates whether 1 per frame actions (turbo, macro) should be used
						
	sub sp,sp,#0x08			@Allocate space on the stack for local variables newFrame and turboEnable	sp=newFrame, sp+0x04=turboEnable
	str r0,[sp]				@Store newFrame parameter at sp, so r0 can be used as scratch reg
	
	@Set controller state buffer to neutral
	ldr r5,=0x8080			@r4 and r5 will be the controllerState buffer
							@Set r5=0x00008080 (no buttons, neutral dStick)
	mov r4,r5,lsl #0x10		@r4=0x80800000 (neutral cStick, neutral triggers)

	@Read GBA keypad
	ldr r1,=REG_KEYINPUT
	ldrh r6,[r1]			@Load current keypad state into r6. Key's state is active low. 0=pressed
	
	
	@Remove select bit from keypad bitfield
	mov r1,r6				@Copy r6 to r1. We are about to remove the SELECT bit from r6	r1LSB=!R,!DWN,!UP,!LFT,!RHT,!ST,!SEL,!B,!A
	bic r6,r6,#0x07			@Clear lower three bits of r5,(!SEL,!B,!A)
	
	and r1,#0x03			@Clear everything in r1 but the lower two bits (!B,!A)
							@Shift r6 1 bit to the right. r5LSB=!L,!R,!DWN,!UP,!LFT,!RHT,!ST,0,0
	orr r6,r1,r6,lsr #0x01	@ORR the two registers. r6=!L,!R,!DWN,!UP,!LFT,!RHT,!ST,!B,!A

	ldr r0,=prevGBAButtonState
	ldrh r2,[r0]		@load prevGBAButtonState into r2
	strh r6,[r0]		@store current button state into prevGBAButtonState
	orr r6,r6,r2,lsl #0x10	@r6 now contains the current and previous keypad status
	
	@Check for ongoing macro		@macroFramesRemaining also works as a boolean that represents if we are in macro mode or not
	ldr r1,=macroFramesRemaining	@Load the address of macroFramesRemaining
	ldrh r3,[r1]					@Load the contents of macroFramesRemaining into r3
	cmp r3,#0x00
	beq normalControlRoutine		@If currentMacroFrame==0, branch to normal control routine
	
	@Check for GBA button just pressed
	eor r2,r6,r6,lsr #0x10			@r2=currKeyState^prevKeyState
	ands r2,r2,r6,lsr #0x10			@r2=(currKeyState^prevKeyState)&&prevKeyState
									@r2!=0 if there was a change in keystate, and the key(s) bit went from 1 to 0 (pressing)
	subne r3,r3,r3
	strneh r3,[r1]					@If gba button was just pressed, set macroFramesRemaining to 0 and branch to normal control routine
	bne normalControlRoutine
									@If this point is reached, there is a macro active.		
	ldr r0,[sp]
	cmp r0,#0x00					@If newFrame=false, don't update the macro this time, and jump to end
	beq end

	macroMode:
		
		ldr r0,currentMacroFrame
		ldmia r0!,{r4-r5}			@Load controllerState data from the macro pointer into the controller state buffer, increment the pointer, and decrement the frame counter
		str r0,currentMacroFrame
		sub r3,r3,#0x01				@Decrement frame counter
		strh r3,[r1]
		
		ldrb r0,lastDirectionPressed	@If the last direction pressed in normal mode was left, the inputs must be flipped here
		
		cmp r0,#0x00
		beq end						@If lastDirectionPressed=0, skip the reversal and branch to end
	
		reverseInput:				@If the last direction pressed was left, reverse stick and dpad inputs

			@Reverse the dStick input
			mov r0,r4,lsr #0x10		@Move the dStick x-axis byte into the lsb of r0
			bic r4,r4,#0xff0000		@Clear the dStick x byte in the control state buffer
			and r0,r0,#0xff			@Clear all but the lsb in r0
			rsb r0,r0,#0xff			@r0=255-r0
			orr r4,r4,r0,lsl #0x10	@Shift r0 back into place so that it is aligned with r4
	
			@Reverse the cStick input
			mov r0,r5				@Move the cStick x-axis byte into the lsb of r0
			bic r5,r5,#0xff			@Clear the cStick x byte in the control state buffer
			and r0,r0,#0xff			@Clear all but the lsb in r0
			rsb r0,r0,#0xff			@r0=255-r0
			orr r5,r5,r0
	
			@Reverse the d-pad input
			mov r0,r4,lsr #0x08
			bic r4,r4,#0x00000300	@Clear the LFT/RHT bits in the controller state buffer
			and r0,r0,#0x03			@Mask out all other bits in the copy
			lsrs r0,r0,#0x01		@Move the RHT bit to take the position of LFT, and move LFT to the carry flag
			orrcs r0,r0,#0x02		@Writes a 1 to the RHT bit if 1 was shifted into carry
			orr r4,r0,lsl #0x08		@Return swapped LFT/RHT to controller state buffer
		b end
		
	normalControlRoutine:
		
		str r3,[sp,#0x04]		@Declare local variable turboEnable at sp+0x04. This will be possibly set and then checked at the end before being freed
		
		scanForModifiers:
			ldr r7,=controlProfile @Load the control profile pointer into r7
			mov r0,#0x09			@Set the loop counter
									@r3 is the subprofile determined by the modifier buttons

			modifierScanLoop:
				rors r6,r6,#0x01	@Rotate r6, moving the lsb to the other side and also copying it to the carry flag
				bcs modLoopEnd		@Jump to end of loop if carry is 1 (button not pressed)
				
				ldrb r1,[r7]		@Load button action to r1
				cmp r1,#0x21
				bhi modLoopEnd		@Branch to end if action is outside range
				cmp r1,#0x20
				bcc modLoopEnd
				
				sub r1,#0x1d			@If action=0x20, set bit 0 of r3	0x20-0x1d=0011b>>1=0001b
				orr r3,r3,r1,lsr #0x01	@If action=0x21, set bit 1 of r3    0x21-0x1d=0100b>>1=0010b
				
				orr r6,r6,#0x80000000	@Set the top bit of r6 so that it will not be checked later in the routine
				
			modLoopEnd:
				add r7,r7,#0x01		@Increment action pointer to the next button's action
				subs r0,r0,#0x01	@Decrement loop counter and break from loop if it reaches zero
				bne modifierScanLoop

			postModLoop:
				ror r6,r6,#0x17		@Return r6 to original position
			
				sub r7,r7,#0x09		@Return profile pointer to base address
				
				add r3,r3,r3,lsl #0x03	@Multiply r3 by 9 to get the correct offset from the profile's base address
				add r7,r7,r3		@Add the offset to r7, making it point to the base of the selected subprofile
		
		applyNormalActions:
			mov r0,#0x09		@Initialize loop counter
			loopTwo:
				rors r6,r6,#0x01	@Rotate r6, lowest button state bit goes into carry and is also wrapped around
				bcs loopTwoEnd		@Jump to end if carry flag is set
				ldrb r1,[r7]		@Load button's action for this subprofile into r1
				
				buttonInputCheck:
				cmp r1,#0x09
				bhi stickInputCheck		@Branch to 'a' if the action code was higher than 0x09

				buttonInput:
					ldr r2,=buttonActionTable
					lsl r1,r1,#0x01			@Shift r1 left by 1 bit to get correct offset for buttonActionTable
					ldrh r2,[r2,r1]
					orr r4,r4,r2			@Combine button press with controller state buffer
					b loopTwoEnd			@Jump to end of loop
				
				stickInputCheck:
				cmp r1,#0x19
				bhi triggerInputCheck		@Branch to triggerInputCheck if the action code was higher than 0x19
				
				stickInput:
					sub r1,r1,#0x0a			@Subtract 0x0a from r1. This makes decoding the action easier		TODO: UNFUCK ALL OF THIS
					ldr r2,=stickInputTable	@Load the base address for stickInputTable into r2
					and r3,r1,#0x03			@Copy lower 2 bits of r1 into r3. The high 2 bits of r1 need to be saved
					ldrb r3,[r2,r3]			@Load stick axis tilt into r3 from the stick input table using r2 and r3 as an offset
	
					bic r1,r1,#0x03			@Remove low 2 bits from r1
					lsl r1,r1,#0x01			@The high 2 bits of r3 determine which stick and axis the byte in r3 should be applied to, so make r1 a multiple of 8
					
					mov r2,#0xff			@Load 0xff into r2. This will be used to mask the correct byte in r4 or r5
					
											@		bit4 | bit3 | dest.
											@--------------------------
											@		0		0	cStickX
											@		0		1	cStickY
											@		1		0	dStickX
											@		1		1	dStickY

					tst r1,#0x10			@Test bit 4 of r1. This bit indicates if the byte will be stored in r4
					
					bicne r4,r4,r2,lsl r1	@Apply mask and orr correct byte to r4 if called for
					orrne r4,r4,r3,lsl r1
					
					biceq r5,r5,r2,lsl r1	@Apply mask (r2) shifted by correct amount to r5
					orreq r5,r5,r3,lsl r1	@Apply byte shifted by correct amount to r5
					
					b loopTwoEnd
				
				triggerInputCheck:
				cmp r1,#0x1d
				bhi turboInputCheck
				
				triggerInput:
					sub r1,r1,#0x1a		@Subtract 0x1a from r1, making it easier to decode the action
					mov r2,#0xff		@Load value 255 (max trigger press) into r2

					tst r1,#0x02		@Test bit 1 of r1. If it is set, we are dealing with an L trigger press
					lsleq r2,r2,#0x08	@Shift r2 if it is an R trigger press

					tst r1,#0x01		@Test bit 0 of r1. If it is set, we are dealing with a half press
					andne r2,r2,r2,lsr #0x01	@Clear out highest set bit of r2, halfing the value
					
					orr r5,r5,r2,lsl #0x10	@orr r2 and r5
			
					bne	loopTwoEnd		@If bit 0=1 (half trigger press), no other values need to be written
				
					mov r2,#0x0d			@0x0d=R press 0x0e=L press
					add r2,r2,r1,lsr #0x01	@Add a one bit offset if r1=2 (L pressed)
					mov r1,#0x01			@Move a single bit to r1
					
					orr r4,r4,r1,lsl r2	@orr r1 with r4 to apply L/R button presses
					b loopTwoEnd
				
				turboInputCheck:
				cmp r1,#0x22		@If the action code is higher than 0x22, jump to label d
				bhi onPressInputCheck
				bne loopTwoEnd		@If the action code is not equal to 0x22, then it must be a no-op, since modifiers were scanned for earlier
				
				turboInput:
					str r1,[sp,#0x04]	@turboOn=true
					b loopTwoEnd

				onPressInputCheck:				
				@Action is either auto-accel or macro, and both can only activate on press
				
				eor r2,r6,r6,lsl #0x10	@r2=button_state_changed
				tst r2,#0x80000000	@Test if the currently tested button state went from 1 to 0. (If we got to this point, we know it's a 0. We only need to check to see if it changed within the last frame)
				beq loopTwoEnd		@Branch to end of loop if button was just being held. This stops unwanted repeated actions
				
				cmp r1,#0x23		@Test if action is equal to 0x23 (toggle auto-accel)
				bne macroInput
				
				@Action is auto-accel
				autoAccelInput:
					ldr r1,=autoAccel
					ldr r2,[r1]
					eor r2,r2,#0x01		@Toggle autoAccel
					strb r2,[r1]
				
					b loopTwoEnd

				macroInput:
					sub r1,r1,#0x24		@Subtract 0x24 from 1 to get the index of the macro in macros[]
					lsl r1,r1,#0x02		@Shift left 2 bits to get the offset of the macro from macros[]
					
					ldr r2,=macros
					ldr r1,[r2,r1]		@r1=macro pointer
					ldrh r2,[r1],#0x04	@r2 contains frame length of macro, r1 contains a pointer to the first frame
					
					ldr r3,=currentMacroFrame
					str r1,[r3]			@Store r1 to currentMacroFrame
					strh r2,[r3,#0x04]	@Store frames to macroFramesRemaining
					@Finish normal control mode, macros will be played back starting next frame

			loopTwoEnd:
				add r7,r7,#0x01		@Increment action pointer for next button
				subs r0,r0,#0x01	@Decrement loop counter and break from loop if it reaches zero
				bne loopTwo
		
		applySpecialActions:
			
			ldr r1,[sp]
			cmp r1,#0x00		@If newFrame==false, skip the once per frame actions
			beq testForAutoAccel
			
			testForTurbo:

				ldr r0,[sp,#0x04]	@If turboEnable==true, toggle pressed buttons before updating prevGCCButtonState
				cmp r0,#0x00
				beq updatePrevGCCbuttons
				
				@Turbo is enabled

				ldrh r2,prevGCCButtonState	@Load the previous GCC buttons pressed into r2
				mov r3,r4,lsl #0x10			@Copy the bytes corresponding to button inputs from r4 to r3
				
				lsr r4,r4,#0x10				@Shift out least significant 2 bytes of r4
				
				eor	r2,r2,r3,lsr #0x10		@Flip all the buttons pressed this frame (r3) from their state last frame (r2)
				and r2,r2,r3,lsr #0x10
				orr r4,r2,r4,lsl #0x10		@orr the modified buttons back into the controller state buffer
				
				
			updatePrevGCCbuttons:
				lsl r0,r4,#0x10
				lsr r0,r0,#0x10
				ldr r1,=prevGCCButtonState
				strh r0,[r1]		@Store button state in to prevGCCButtonState
				

			testForAutoAccel:
			ldr r1,autoAccel
			tst r1,#0x01		@Check last bit of autoAccel
			beq updateLDP		@If no autoAccel, branch to last direction pressed update
			
			applyAutoAccel:
				tst r4,#0x02		@Test the B-button bit of r4
				orreq r4,#0x01		@Set the A-button bit if the B-button bit is not set
			
			updateLDP:

			lsr r0,r4,#0x10				@Load the dStick x-axis byte into r0
			and r0,r0,#0xff				@Mask everything but the first byte
			cmp r0,#0x80				@Test if x-axis value is less or greater than 128

			
			beq end

			movlo r3,#0x01				@Load a 0 in r3 if stick's x-axis value was below 128, and 1 if it was greater. 
			movhi r3,#0x00

			strb r3,lastDirectionPressed	@Update lastDirectionPressed if virtual dStick was not in the center this frame
			
			
		end:
			ldr r1,=controllerState		@Store controllerState buffer into controllerState
			stmia r1,{r4-r5}
			
			add sp,sp,#0x08				@Free memory for local variables
			ldmia sp!,{r4-r7}
	bx lr


.balign 2
buttonActionTable:	@If an action is from 0x00 to 0x09, use this lookup table and action as the offset to easily ORR a certain button press to controller state
	.hword 0x0001	@buttonActionTable[0]=a
	.hword 0x0002	@buttonActionTable[1]=b
	.hword 0x0004	@buttonActionTable[2]=x
	.hword 0x0008	@buttonActionTable[3]=y
	.hword 0x1000	@buttonActionTable[4]=z
	.hword 0x0800	@buttonActionTable[5]=up
	.hword 0x0400	@buttonActionTable[6]=dwn
	.hword 0x0100	@buttonActionTable[7]=lft
	.hword 0x0200	@buttonActionTable[8]=rht
	.hword 0x0010	@buttonActionTable[9]=st

stickInputTable:	@Can be used with action to determine the magnitude and direction (left/up or right/down) of a stick input on 1 axis
	.byte 0x00		@00=full left/down
	.byte 0x40		@01=tilt left/down
	.byte 0xc0		@10=tilt right/up
	.byte 0xff		@11=full right/up
@Control system variables

.balign 4
.global controllerState

@struct controllerState{
@	u16 buttons;	15=0,14=L,13=R,12=Z,11=up,10=down,9=right,8=left,7=0,6=0,5=0,4=start,3=y,2=x,1=b,0=a
@	u8 dStickX;
@	u8 dStickY;
@	u8 cStickX;
@	u8 cStickY;
@	u8 Ltrig;
@	u8 Rtrig;
@};

controllerState:
	.word 0x80800000
	.word 0x00008080
prevGCCButtonState:	@Contains the previous low 2 bytes of controllerState. Used in conjunction with turbo button to alternate certain button presses each frame
	.hword 0x0000
prevGBAButtonState: @Contains the previous 2 bytes read from the keypad. Used to determine if any buttons were just pressed on the GBA. If so, the current macro is aborted
	.hword 0x0000

.balign 4
currentMacroFrame:	@Contains a pointer to the current macroFrame.
	.word 0x00000000
macroFramesRemaining:	@The number of frames remaining for the current macro playback.
	.hword 0x0000

lastDirectionPressed:	@bool lastDirectionPressed;
	.byte 0x00			@0=right

autoAccel:				@bool autoAccel;
	.byte 0x00			@0=off

	.balign 4