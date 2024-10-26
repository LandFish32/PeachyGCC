	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"controlState.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/source/controlState.c"
	.section	.ewram,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	controlStateEntry
	.syntax unified
	.code	16
	.thumb_func
	.type	controlStateEntry, %function
controlStateEntry:
.LFB202:
	.loc 1 69 71 view -0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 71 2 view .LVU1
	movs	r2, #128
	.loc 1 69 71 is_stmt 0 view .LVU2
	push	{r4, r5, r6, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 6, -8
	.cfi_offset 14, -4
	.loc 1 71 30 view .LVU3
	movs	r4, #128
	.loc 1 71 2 view .LVU4
	lsls	r2, r2, #19
	ldr	r3, [r2]
	.loc 1 71 30 view .LVU5
	lsls	r4, r4, #4
	orrs	r3, r4
	str	r3, [r2]
	.loc 1 73 2 is_stmt 1 view .LVU6
	movs	r2, #133
	ldr	r1, .L5
	ldr	r0, .L5+4
	lsls	r2, r2, #5
	bl	memcpy256
.LVL0:
	.loc 1 74 2 view .LVU7
	movs	r2, r4
	ldr	r1, .L5+8
	ldr	r0, .L5+12
	bl	memcpy256
.LVL1:
	.loc 1 76 2 view .LVU8
	.loc 1 76 30 is_stmt 0 view .LVU9
	ldr	r3, .L5+16
	ldr	r2, .L5+20
	strh	r2, [r3]
	.loc 1 77 2 is_stmt 1 view .LVU10
	.loc 1 77 30 is_stmt 0 view .LVU11
	movs	r2, #24
	.loc 1 78 30 view .LVU12
	movs	r5, #224
	.loc 1 77 30 view .LVU13
	ldr	r3, .L5+24
	rsbs	r2, r2, #0
	strh	r2, [r3]
	.loc 1 78 2 is_stmt 1 view .LVU14
	.loc 1 78 30 is_stmt 0 view .LVU15
	ldr	r3, .L5+28
	adds	r2, r2, #8
	strh	r2, [r3]
	.loc 1 80 2 is_stmt 1 view .LVU16
.LBB9:
	.loc 1 80 7 view .LVU17
.LVL2:
	.loc 1 80 16 discriminator 1 view .LVU18
	ldr	r4, .L5+32
	ldr	r6, .L5+36
.LBE9:
	.loc 1 78 30 is_stmt 0 view .LVU19
	lsls	r5, r5, #19
.LVL3:
.L2:
.LBB14:
	.loc 1 81 3 is_stmt 1 view .LVU20
.LBB10:
.LBI10:
	.file 2 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/graphicsDef.h"
	.loc 2 15 20 view .LVU21
.LBB11:
	.loc 2 16 2 view .LVU22
	.loc 2 16 42 is_stmt 0 view .LVU23
	ldrh	r0, [r4, #4]
	.loc 2 16 12 view .LVU24
	ldr	r3, [r4, #8]
	.loc 2 16 38 view .LVU25
	lsls	r0, r0, #14
	.loc 2 16 12 view .LVU26
	lsls	r3, r3, #5
	adds	r0, r0, r3
	movs	r3, #192
	lsls	r3, r3, #19
	mov	ip, r3
	.loc 2 16 2 view .LVU27
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	.loc 2 16 12 view .LVU28
	add	r0, r0, ip
	.loc 2 16 2 view .LVU29
	bl	memcpy256
.LVL4:
	.loc 2 17 2 is_stmt 1 view .LVU30
	.loc 2 18 6 is_stmt 0 view .LVU31
	ldr	r2, [r4, #16]
	.loc 2 20 6 view .LVU32
	ldrh	r3, [r4, #20]
.LVL5:
.LBB12:
.LBI12:
	.file 3 "C:/devkitPro/libtonc/include/tonc_oam.h"
	.loc 3 87 25 is_stmt 1 view .LVU33
.LBB13:
	.loc 3 89 2 view .LVU34
	.loc 3 89 18 view .LVU35
	.loc 3 89 12 is_stmt 0 view .LVU36
	str	r2, [r5]
.LVL6:
	.loc 3 89 34 is_stmt 1 view .LVU37
	.loc 3 89 44 is_stmt 0 view .LVU38
	strh	r3, [r5, #4]
	.loc 3 90 2 is_stmt 1 view .LVU39
.LVL7:
	.loc 3 90 2 is_stmt 0 view .LVU40
.LBE13:
.LBE12:
	.loc 2 21 2 is_stmt 1 view .LVU41
.LBE11:
.LBE10:
	.loc 1 80 21 discriminator 3 view .LVU42
	.loc 1 80 16 discriminator 1 view .LVU43
	adds	r5, r5, #8
	adds	r4, r4, #24
	cmp	r5, r6
	bne	.L2
.LBE14:
	.loc 1 83 2 view .LVU44
	movs	r2, #128
	.loc 1 87 1 is_stmt 0 view .LVU45
	@ sp needed
	.loc 1 83 2 view .LVU46
	ldr	r1, .L5+40
	ldr	r0, .L5+44
	lsls	r2, r2, #1
	bl	memcpy256
.LVL8:
	.loc 1 85 2 is_stmt 1 view .LVU47
	movs	r2, #255
	.loc 1 85 32 is_stmt 0 view .LVU48
	ldr	r1, .L5+48
	ldrh	r3, [r1]
	ands	r2, r3
	movs	r3, #161
	lsls	r3, r3, #5
	orrs	r3, r2
	.loc 1 85 30 view .LVU49
	strh	r3, [r1]
	.loc 1 86 2 is_stmt 1 view .LVU50
	.loc 1 87 1 is_stmt 0 view .LVU51
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L6:
	.align	2
.L5:
	.word	gccTiles
	.word	100712448
	.word	gccMap
	.word	100696064
	.word	67108878
	.word	4108
	.word	67108892
	.word	67108894
	.word	spriteObjs
	.word	117440624
	.word	ZbuttonPressedTiles
	.word	100729856
	.word	67108868
	.cfi_endproc
.LFE202:
	.size	controlStateEntry, .-controlStateEntry
	.align	1
	.p2align 2,,3
	.global	controlStateProcess
	.syntax unified
	.code	16
	.thumb_func
	.type	controlStateProcess, %function
controlStateProcess:
.LFB203:
	.loc 1 88 73 is_stmt 1 view -0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 89 2 view .LVU53
	.loc 1 88 73 is_stmt 0 view .LVU54
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	mov	lr, r8
	.loc 1 89 6 view .LVU55
	ldr	r2, .L10
	.loc 1 90 36 view .LVU56
	movs	r5, #224
	.loc 1 89 6 view .LVU57
	ldrh	r3, [r2]
	mov	ip, r3
.LVL9:
	.loc 1 90 2 is_stmt 1 view .LVU58
	.loc 1 90 118 is_stmt 0 view .LVU59
	movs	r1, #0
	ldrsh	r3, [r2, r1]
	movs	r1, #128
	.loc 1 88 73 view .LVU60
	push	{lr}
	.cfi_def_cfa_offset 24
	.cfi_offset 8, -24
	.loc 1 90 36 view .LVU61
	lsls	r5, r5, #19
	.loc 1 90 83 view .LVU62
	ldrh	r4, [r5, #4]
	.loc 1 90 118 view .LVU63
	lsls	r1, r1, #5
	lsls	r0, r3, #12
	.loc 1 90 83 view .LVU64
	lsls	r4, r4, #20
	.loc 1 90 118 view .LVU65
	ands	r0, r1
	.loc 1 90 83 view .LVU66
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 88 73 view .LVU67
	sub	sp, sp, #8
	.cfi_def_cfa_offset 32
	.loc 1 90 36 view .LVU68
	strh	r0, [r5, #4]
	.loc 1 91 2 is_stmt 1 view .LVU69
	.loc 1 91 36 is_stmt 0 view .LVU70
	ldr	r5, .L10+4
	.loc 1 91 83 view .LVU71
	ldrh	r4, [r5, #4]
	.loc 1 91 118 view .LVU72
	lsls	r0, r3, #11
	.loc 1 91 83 view .LVU73
	lsls	r4, r4, #20
	.loc 1 91 118 view .LVU74
	ands	r0, r1
	.loc 1 91 83 view .LVU75
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 91 36 view .LVU76
	strh	r0, [r5, #4]
	.loc 1 92 2 is_stmt 1 view .LVU77
	.loc 1 92 36 is_stmt 0 view .LVU78
	ldr	r5, .L10+8
	.loc 1 92 83 view .LVU79
	ldrh	r4, [r5, #4]
	.loc 1 92 118 view .LVU80
	lsls	r0, r3, #10
	.loc 1 92 83 view .LVU81
	lsls	r4, r4, #20
	.loc 1 92 118 view .LVU82
	ands	r0, r1
	.loc 1 92 83 view .LVU83
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 92 36 view .LVU84
	strh	r0, [r5, #4]
	.loc 1 93 2 is_stmt 1 view .LVU85
	.loc 1 93 36 is_stmt 0 view .LVU86
	ldr	r5, .L10+12
	.loc 1 93 83 view .LVU87
	ldrh	r4, [r5, #4]
	.loc 1 93 118 view .LVU88
	lsls	r0, r3, #9
	.loc 1 93 83 view .LVU89
	lsls	r4, r4, #20
	.loc 1 93 118 view .LVU90
	ands	r0, r1
	.loc 1 93 83 view .LVU91
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 93 36 view .LVU92
	strh	r0, [r5, #4]
	.loc 1 94 2 is_stmt 1 view .LVU93
	.loc 1 95 2 view .LVU94
	.loc 1 95 36 is_stmt 0 view .LVU95
	ldr	r0, .L10+16
	mov	r8, r0
	.loc 1 95 83 view .LVU96
	mov	r4, r8
	ldrh	r4, [r4, #4]
	.loc 1 95 118 view .LVU97
	lsls	r0, r3, #1
	.loc 1 95 83 view .LVU98
	lsls	r4, r4, #20
	.loc 1 95 118 view .LVU99
	ands	r0, r1
	.loc 1 95 83 view .LVU100
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 95 36 view .LVU101
	mov	r4, r8
	.loc 1 94 36 view .LVU102
	ldr	r5, .L10+20
	ldrh	r7, [r5, #4]
	.loc 1 95 36 view .LVU103
	strh	r0, [r4, #4]
	.loc 1 96 2 is_stmt 1 view .LVU104
	.loc 1 96 36 is_stmt 0 view .LVU105
	ldr	r0, .L10+24
	mov	r8, r0
	.loc 1 96 83 view .LVU106
	mov	r4, r8
	ldrh	r4, [r4, #4]
	.loc 1 96 118 view .LVU107
	lsls	r0, r3, #2
	.loc 1 96 83 view .LVU108
	lsls	r4, r4, #20
	.loc 1 96 118 view .LVU109
	ands	r0, r1
	.loc 1 96 83 view .LVU110
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 96 36 view .LVU111
	mov	r4, r8
	strh	r0, [r4, #4]
	.loc 1 97 2 is_stmt 1 view .LVU112
	.loc 1 97 36 is_stmt 0 view .LVU113
	ldr	r0, .L10+28
	mov	r8, r0
	.loc 1 97 83 view .LVU114
	mov	r4, r8
	ldrh	r4, [r4, #4]
	.loc 1 97 118 view .LVU115
	lsls	r0, r3, #4
	.loc 1 97 83 view .LVU116
	lsls	r4, r4, #20
	.loc 1 97 118 view .LVU117
	ands	r0, r1
	.loc 1 97 83 view .LVU118
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 97 36 view .LVU119
	mov	r4, r8
	strh	r0, [r4, #4]
	.loc 1 98 2 is_stmt 1 view .LVU120
	.loc 1 98 36 is_stmt 0 view .LVU121
	ldr	r0, .L10+32
	mov	r8, r0
	.loc 1 98 83 view .LVU122
	mov	r4, r8
	ldrh	r4, [r4, #4]
	.loc 1 98 118 view .LVU123
	lsls	r0, r3, #3
	.loc 1 98 83 view .LVU124
	lsls	r4, r4, #20
	.loc 1 98 118 view .LVU125
	ands	r0, r1
	.loc 1 98 83 view .LVU126
	lsrs	r4, r4, #20
	orrs	r0, r4
	.loc 1 98 36 view .LVU127
	mov	r4, r8
	strh	r0, [r4, #4]
	.loc 1 99 2 is_stmt 1 view .LVU128
	.loc 1 99 36 is_stmt 0 view .LVU129
	ldr	r4, .L10+36
	.loc 1 99 83 view .LVU130
	ldrh	r0, [r4, #4]
	.loc 1 99 118 view .LVU131
	lsls	r3, r3, #8
	.loc 1 99 83 view .LVU132
	lsls	r0, r0, #20
	.loc 1 99 118 view .LVU133
	ands	r3, r1
	.loc 1 99 83 view .LVU134
	lsrs	r0, r0, #20
	orrs	r3, r0
	.loc 1 99 36 view .LVU135
	strh	r3, [r4, #4]
	.loc 1 100 2 is_stmt 1 view .LVU136
	.loc 1 100 114 is_stmt 0 view .LVU137
	mov	r3, ip
	.loc 1 100 37 view .LVU138
	ldr	r4, .L10+40
	.loc 1 100 85 view .LVU139
	ldrh	r0, [r4, #4]
	.loc 1 100 114 view .LVU140
	asrs	r3, r3, #2
	.loc 1 100 85 view .LVU141
	lsls	r0, r0, #20
	.loc 1 100 120 view .LVU142
	ands	r3, r1
	.loc 1 100 85 view .LVU143
	lsrs	r0, r0, #20
	orrs	r3, r0
	.loc 1 100 37 view .LVU144
	strh	r3, [r4, #4]
	.loc 1 101 2 is_stmt 1 view .LVU145
	.loc 1 101 114 is_stmt 0 view .LVU146
	mov	r3, ip
	mov	r6, ip
	.loc 1 101 37 view .LVU147
	ldr	r0, .L10+44
	.loc 1 101 114 view .LVU148
	asrs	r3, r3, #1
	ands	r6, r1
	.loc 1 101 120 view .LVU149
	ands	r3, r1
	.loc 1 101 85 view .LVU150
	ldrh	r1, [r0, #4]
	lsls	r1, r1, #20
	lsrs	r1, r1, #20
	orrs	r3, r1
	.loc 1 94 36 view .LVU151
	lsls	r7, r7, #20
	.loc 1 101 37 view .LVU152
	strh	r3, [r0, #4]
	.loc 1 102 2 is_stmt 1 view .LVU153
	.loc 1 94 36 is_stmt 0 view .LVU154
	lsrs	r7, r7, #20
	.loc 1 102 83 view .LVU155
	rsbs	r3, r6, #0
	adcs	r3, r3, r6
	orrs	r7, r6
	movs	r6, #7
	rsbs	r3, r3, #0
	lsrs	r1, r7, #10
	bics	r3, r6
	lsls	r1, r1, #10
	adds	r3, r3, #32
	.loc 1 102 83 discriminator 4 view .LVU156
	orrs	r3, r1
	.loc 1 105 6 view .LVU157
	movs	r1, #128
	.loc 1 102 36 discriminator 4 view .LVU158
	strh	r3, [r5, #4]
	.loc 1 104 2 is_stmt 1 view .LVU159
.LVL10:
	.loc 1 105 2 view .LVU160
	.loc 1 106 2 view .LVU161
	.loc 1 105 6 is_stmt 0 view .LVU162
	movs	r5, #40
	lsls	r1, r1, #2
	mov	ip, r1
.LVL11:
	.loc 1 104 6 view .LVU163
	ldrb	r3, [r2, #6]
	.loc 1 105 6 view .LVU164
	muls	r3, r5
	add	r3, r3, ip
	.loc 1 106 37 view .LVU165
	ldrh	r6, [r4]
	.loc 1 106 107 view .LVU166
	lsls	r3, r3, #16
	.loc 1 106 37 view .LVU167
	subs	r1, r1, #2
	subs	r1, r1, #255
	.loc 1 106 107 view .LVU168
	lsrs	r3, r3, #26
	.loc 1 106 37 view .LVU169
	bics	r6, r1
	.loc 1 106 107 view .LVU170
	adds	r3, r3, #20
	.loc 1 106 37 view .LVU171
	orrs	r3, r6
	strh	r3, [r4]
	.loc 1 108 2 is_stmt 1 view .LVU172
.LVL12:
	.loc 1 109 2 view .LVU173
	.loc 1 110 2 view .LVU174
	.loc 1 108 14 is_stmt 0 view .LVU175
	ldrb	r3, [r2, #7]
	.loc 1 109 5 view .LVU176
	muls	r3, r5
	add	r3, r3, ip
	.loc 1 110 37 view .LVU177
	ldrh	r4, [r0]
	.loc 1 110 107 view .LVU178
	lsls	r3, r3, #16
	lsrs	r3, r3, #26
	.loc 1 110 37 view .LVU179
	bics	r4, r1
	.loc 1 110 107 view .LVU180
	adds	r3, r3, #20
	.loc 1 110 37 view .LVU181
	orrs	r3, r4
	strh	r3, [r0]
	.loc 1 113 2 is_stmt 1 view .LVU182
.LVL13:
	.loc 1 114 2 view .LVU183
	.loc 1 115 2 view .LVU184
	.loc 1 116 2 view .LVU185
	.loc 1 115 6 is_stmt 0 view .LVU186
	movs	r0, #48
	.loc 1 113 6 view .LVU187
	ldrb	r3, [r2, #2]
	.loc 1 115 6 view .LVU188
	muls	r3, r0
	.loc 1 116 37 view .LVU189
	ldr	r4, .L10+48
	.loc 1 115 6 view .LVU190
	add	r3, r3, ip
	.loc 1 116 37 view .LVU191
	ldrh	r5, [r4, #2]
	.loc 1 116 111 view .LVU192
	lsls	r3, r3, #16
	lsrs	r3, r3, #26
	.loc 1 116 37 view .LVU193
	lsrs	r5, r5, #9
	lsls	r5, r5, #9
	.loc 1 116 111 view .LVU194
	adds	r3, r3, #53
	.loc 1 116 37 view .LVU195
	orrs	r3, r5
	.loc 1 121 112 view .LVU196
	movs	r5, #50
	.loc 1 116 37 view .LVU197
	strh	r3, [r4, #2]
	.loc 1 118 2 is_stmt 1 view .LVU198
.LVL14:
	.loc 1 119 2 view .LVU199
	.loc 1 120 2 view .LVU200
	.loc 1 121 2 view .LVU201
	.loc 1 118 11 is_stmt 0 view .LVU202
	ldrb	r3, [r2, #3]
	.loc 1 120 5 view .LVU203
	muls	r3, r0
	add	r3, r3, ip
	.loc 1 121 112 view .LVU204
	lsls	r3, r3, #16
	lsrs	r3, r3, #26
	subs	r3, r5, r3
	.loc 1 121 37 view .LVU205
	ldrh	r5, [r4]
	bics	r5, r1
	orrs	r3, r5
	strh	r3, [r4]
	.loc 1 123 2 is_stmt 1 view .LVU206
.LVL15:
	.loc 1 124 2 view .LVU207
	.loc 1 125 2 view .LVU208
	.loc 1 126 2 view .LVU209
	.loc 1 123 11 is_stmt 0 view .LVU210
	ldrb	r3, [r2, #4]
	.loc 1 125 5 view .LVU211
	muls	r3, r0
	.loc 1 126 37 view .LVU212
	ldr	r4, .L10+52
	.loc 1 125 5 view .LVU213
	add	r3, r3, ip
	.loc 1 126 37 view .LVU214
	ldrh	r5, [r4, #2]
	.loc 1 126 112 view .LVU215
	lsls	r3, r3, #16
	lsrs	r3, r3, #26
	.loc 1 126 37 view .LVU216
	lsrs	r5, r5, #9
	lsls	r5, r5, #9
	.loc 1 126 112 view .LVU217
	adds	r3, r3, #132
	.loc 1 126 37 view .LVU218
	orrs	r3, r5
	strh	r3, [r4, #2]
	.loc 1 128 2 is_stmt 1 view .LVU219
.LVL16:
	.loc 1 129 2 view .LVU220
	.loc 1 130 2 view .LVU221
	.loc 1 131 2 view .LVU222
	.loc 1 128 11 is_stmt 0 view .LVU223
	ldrb	r3, [r2, #5]
	.loc 1 131 112 view .LVU224
	movs	r2, #88
	.loc 1 130 5 view .LVU225
	muls	r3, r0
	add	r3, r3, ip
	.loc 1 131 112 view .LVU226
	lsls	r3, r3, #16
	lsrs	r3, r3, #26
	subs	r3, r2, r3
	.loc 1 131 37 view .LVU227
	ldrh	r2, [r4]
	bics	r2, r1
	orrs	r3, r2
	strh	r3, [r4]
	.loc 1 133 2 is_stmt 1 view .LVU228
	movs	r0, #1
	bl	processInput
.LVL17:
	.loc 1 135 2 view .LVU229
	.loc 1 135 30 is_stmt 0 view .LVU230
	movs	r2, #4
	.loc 1 135 2 view .LVU231
	ldr	r4, .L10+56
	ldrh	r3, [r4]
	.loc 1 135 30 view .LVU232
	orrs	r3, r2
	strh	r3, [r4]
	.loc 1 136 2 is_stmt 1 view .LVU233
	movs	r1, #4
	movs	r0, #0
	bl	IntrWait
.LVL18:
	.loc 1 137 2 view .LVU234
	movs	r0, #0
	bl	processInput
.LVL19:
	.loc 1 138 2 view .LVU235
	.loc 1 138 30 is_stmt 0 view .LVU236
	movs	r2, #4
	ldrh	r3, [r4]
	bics	r3, r2
	strh	r3, [r4]
	.loc 1 139 2 is_stmt 1 view .LVU237
	.loc 1 140 1 is_stmt 0 view .LVU238
	add	sp, sp, #8
	@ sp needed
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L11:
	.align	2
.L10:
	.word	controllerState
	.word	117440520
	.word	117440528
	.word	117440536
	.word	117440552
	.word	117440544
	.word	117440560
	.word	117440568
	.word	117440576
	.word	117440584
	.word	117440608
	.word	117440616
	.word	117440592
	.word	117440600
	.word	67109376
	.cfi_endproc
.LFE203:
	.size	controlStateProcess, .-controlStateProcess
	.align	1
	.p2align 2,,3
	.global	controlStateExit
	.syntax unified
	.code	16
	.thumb_func
	.type	controlStateExit, %function
controlStateExit:
.LFB204:
	.loc 1 142 70 is_stmt 1 view -0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 143 2 view .LVU240
	.loc 1 144 1 is_stmt 0 view .LVU241
	@ sp needed
	bx	lr
	.cfi_endproc
.LFE204:
	.size	controlStateExit, .-controlStateExit
	.global	spriteObjs
	.global	cStickObj
	.global	dStickObj
	.global	RtriggerObj
	.global	LtriggerObj
	.global	STARTbuttonObj
	.global	dPadRObj
	.global	dPadLObj
	.global	dPadDObj
	.global	dPadUObj
	.global	ZbuttonObj
	.global	YbuttonObj
	.global	XbuttonObj
	.global	BbuttonObj
	.global	AbuttonObj
	.section	.rodata
	.align	2
	.type	spriteObjs, %object
	.size	spriteObjs, 336
spriteObjs:
	.word	AbuttonTiles
	.short	4
	.space	2
	.word	0
	.word	512
	.short	44
	.short	-32610
	.short	0
	.space	2
	.word	BbuttonTiles
	.short	4
	.space	2
	.word	16
	.word	128
	.short	61
	.short	16531
	.short	16
	.space	2
	.word	XbuttonTiles
	.short	4
	.space	2
	.word	20
	.word	64
	.short	-32724
	.short	183
	.short	20
	.space	2
	.word	YbuttonTiles
	.short	4
	.space	2
	.word	22
	.word	64
	.short	16419
	.short	157
	.short	22
	.space	2
	.word	ZbuttonUnpressedTiles
	.short	4
	.space	2
	.word	24
	.word	256
	.short	16409
	.short	-32603
	.short	24
	.space	2
	.word	dPadUDTiles
	.short	4
	.space	2
	.word	40
	.word	64
	.short	-32689
	.short	91
	.short	40
	.space	2
	.word	dPadUDTiles
	.short	4
	.space	2
	.word	40
	.word	64
	.short	-32684
	.short	12378
	.short	40
	.space	2
	.word	dPadLRTiles
	.short	4
	.space	2
	.word	42
	.word	64
	.short	16470
	.short	84
	.short	42
	.space	2
	.word	dPadLRTiles
	.short	4
	.space	2
	.word	42
	.word	64
	.short	16469
	.short	12377
	.short	42
	.space	2
	.word	STARTbuttonTiles
	.short	4
	.space	2
	.word	44
	.word	32
	.short	51
	.short	116
	.short	44
	.space	2
	.word	dStickTiles
	.short	4
	.space	2
	.word	61
	.word	512
	.short	44
	.short	-32709
	.short	61
	.space	2
	.word	cStickTiles
	.short	4
	.space	2
	.word	77
	.word	128
	.short	82
	.short	16522
	.short	77
	.space	2
	.word	LtriggerTiles
	.short	4
	.space	2
	.word	45
	.word	256
	.short	16404
	.short	-32713
	.short	1069
	.space	2
	.word	RtriggerTiles
	.short	4
	.space	2
	.word	53
	.word	256
	.short	16404
	.short	-32604
	.short	1077
	.space	2
	.type	cStickObj, %object
	.size	cStickObj, 24
cStickObj:
	.word	cStickTiles
	.short	4
	.space	2
	.word	77
	.word	128
	.short	82
	.short	16522
	.short	77
	.space	2
	.type	dStickObj, %object
	.size	dStickObj, 24
dStickObj:
	.word	dStickTiles
	.short	4
	.space	2
	.word	61
	.word	512
	.short	44
	.short	-32709
	.short	61
	.space	2
	.type	RtriggerObj, %object
	.size	RtriggerObj, 24
RtriggerObj:
	.word	RtriggerTiles
	.short	4
	.space	2
	.word	53
	.word	256
	.short	16404
	.short	-32604
	.short	1077
	.space	2
	.type	LtriggerObj, %object
	.size	LtriggerObj, 24
LtriggerObj:
	.word	LtriggerTiles
	.short	4
	.space	2
	.word	45
	.word	256
	.short	16404
	.short	-32713
	.short	1069
	.space	2
	.type	STARTbuttonObj, %object
	.size	STARTbuttonObj, 24
STARTbuttonObj:
	.word	STARTbuttonTiles
	.short	4
	.space	2
	.word	44
	.word	32
	.short	51
	.short	116
	.short	44
	.space	2
	.type	dPadRObj, %object
	.size	dPadRObj, 24
dPadRObj:
	.word	dPadLRTiles
	.short	4
	.space	2
	.word	42
	.word	64
	.short	16469
	.short	12377
	.short	42
	.space	2
	.type	dPadLObj, %object
	.size	dPadLObj, 24
dPadLObj:
	.word	dPadLRTiles
	.short	4
	.space	2
	.word	42
	.word	64
	.short	16470
	.short	84
	.short	42
	.space	2
	.type	dPadDObj, %object
	.size	dPadDObj, 24
dPadDObj:
	.word	dPadUDTiles
	.short	4
	.space	2
	.word	40
	.word	64
	.short	-32684
	.short	12378
	.short	40
	.space	2
	.type	dPadUObj, %object
	.size	dPadUObj, 24
dPadUObj:
	.word	dPadUDTiles
	.short	4
	.space	2
	.word	40
	.word	64
	.short	-32689
	.short	91
	.short	40
	.space	2
	.type	ZbuttonObj, %object
	.size	ZbuttonObj, 24
ZbuttonObj:
	.word	ZbuttonUnpressedTiles
	.short	4
	.space	2
	.word	24
	.word	256
	.short	16409
	.short	-32603
	.short	24
	.space	2
	.type	YbuttonObj, %object
	.size	YbuttonObj, 24
YbuttonObj:
	.word	YbuttonTiles
	.short	4
	.space	2
	.word	22
	.word	64
	.short	16419
	.short	157
	.short	22
	.space	2
	.type	XbuttonObj, %object
	.size	XbuttonObj, 24
XbuttonObj:
	.word	XbuttonTiles
	.short	4
	.space	2
	.word	20
	.word	64
	.short	-32724
	.short	183
	.short	20
	.space	2
	.type	BbuttonObj, %object
	.size	BbuttonObj, 24
BbuttonObj:
	.word	BbuttonTiles
	.short	4
	.space	2
	.word	16
	.word	128
	.short	61
	.short	16531
	.short	16
	.space	2
	.type	AbuttonObj, %object
	.size	AbuttonObj, 24
AbuttonObj:
	.word	AbuttonTiles
	.short	4
	.space	2
	.word	0
	.word	512
	.short	44
	.short	-32610
	.short	0
	.space	2
	.text
.Letext0:
	.file 4 "C:/devkitPro/libtonc/include/tonc_types.h"
	.file 5 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Abutton.h"
	.file 6 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Bbutton.h"
	.file 7 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Xbutton.h"
	.file 8 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/Ybutton.h"
	.file 9 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/ZbuttonPressed.h"
	.file 10 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/ZbuttonUnpressed.h"
	.file 11 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dStick.h"
	.file 12 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/cStick.h"
	.file 13 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dPadLR.h"
	.file 14 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/dPadUD.h"
	.file 15 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/STARTbutton.h"
	.file 16 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/LTrigger.h"
	.file 17 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/RTrigger.h"
	.file 18 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/build/gcc.h"
	.file 19 "C:/Users/Landon/Desktop/my_projects/PeachyGCC/PeachyGCC/include/controllerStateDef.h"
	.file 20 "C:/devkitPro/libtonc/include/tonc_bios.h"
	.file 21 "C:/devkitPro/libtonc/include/tonc_irq.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x775
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1b
	.4byte	.LASF91
	.byte	0x1d
	.4byte	.LASF92
	.4byte	.LASF93
	.4byte	.LLRL7
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0xc
	.ascii	"u8\000"
	.byte	0x76
	.byte	0x17
	.4byte	0x30
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0xc
	.ascii	"u16\000"
	.byte	0x77
	.byte	0x18
	.4byte	0x4c
	.uleb128 0x14
	.4byte	0x37
	.uleb128 0x5
	.4byte	0x37
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	0x4c
	.uleb128 0xc
	.ascii	"u32\000"
	.byte	0x78
	.byte	0x16
	.4byte	0x6d
	.uleb128 0x14
	.4byte	0x58
	.uleb128 0x5
	.4byte	0x58
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x5
	.4byte	0x6d
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0xc
	.ascii	"s16\000"
	.byte	0x7c
	.byte	0x16
	.4byte	0x92
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	0x99
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x11
	.4byte	.LASF7
	.byte	0x86
	.byte	0x16
	.4byte	0x42
	.uleb128 0x11
	.4byte	.LASF8
	.byte	0x87
	.byte	0x16
	.4byte	0x63
	.uleb128 0x7
	.4byte	0x58
	.4byte	0xd2
	.uleb128 0x9
	.4byte	0x6d
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x1d
	.byte	0x20
	.byte	0x4
	.byte	0xb5
	.byte	0x9
	.4byte	0xf0
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x4
	.byte	0xb5
	.byte	0x16
	.4byte	0xc2
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF10
	.byte	0xb5
	.byte	0x21
	.4byte	0xd9
	.uleb128 0xd
	.4byte	0x100
	.uleb128 0x1e
	.uleb128 0x1f
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x144
	.byte	0xe
	.4byte	0x10e
	.uleb128 0x7
	.4byte	0xf0
	.4byte	0x11f
	.uleb128 0x12
	.4byte	0x6d
	.2byte	0x1ff
	.byte	0
	.uleb128 0x20
	.4byte	.LASF94
	.byte	0x8
	.byte	0x4
	.byte	0x4
	.2byte	0x154
	.byte	0x10
	.4byte	0x15f
	.uleb128 0xe
	.4byte	.LASF13
	.2byte	0x156
	.4byte	0x37
	.byte	0
	.uleb128 0xe
	.4byte	.LASF14
	.2byte	0x157
	.4byte	0x37
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF15
	.2byte	0x158
	.4byte	0x37
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF16
	.2byte	0x159
	.4byte	0x87
	.byte	0x6
	.byte	0
	.uleb128 0x21
	.4byte	.LASF94
	.byte	0x4
	.2byte	0x15a
	.byte	0x1f
	.4byte	0x11f
	.byte	0x4
	.uleb128 0x22
	.4byte	.LASF95
	.byte	0x7
	.byte	0x1
	.4byte	0x30
	.byte	0x15
	.byte	0x21
	.byte	0xe
	.4byte	0x1da
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x6
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x7
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x9
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0xa
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0xb
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0xd
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0xe
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	.LASF32
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF33
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF34
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x18
	.byte	0x2
	.byte	0x5
	.4byte	0x257
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x2
	.byte	0x6
	.byte	0xd
	.4byte	0x25c
	.byte	0
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x2
	.byte	0x7
	.byte	0xc
	.4byte	0x47
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x2
	.byte	0x8
	.byte	0xc
	.4byte	0x68
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0x2
	.byte	0x9
	.byte	0xc
	.4byte	0x68
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0x2
	.byte	0xa
	.byte	0xc
	.4byte	0x47
	.byte	0x10
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0x2
	.byte	0xb
	.byte	0xc
	.4byte	0x47
	.byte	0x12
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x2
	.byte	0xc
	.byte	0xc
	.4byte	0x47
	.byte	0x14
	.byte	0
	.uleb128 0x5
	.4byte	0x1ef
	.uleb128 0xd
	.4byte	0x68
	.uleb128 0x7
	.4byte	0x74
	.4byte	0x271
	.uleb128 0x9
	.4byte	0x6d
	.byte	0x7f
	.byte	0
	.uleb128 0x5
	.4byte	0x261
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x5
	.byte	0x14
	.byte	0x1b
	.4byte	0x271
	.uleb128 0x7
	.4byte	0x74
	.4byte	0x292
	.uleb128 0x9
	.4byte	0x6d
	.byte	0x1f
	.byte	0
	.uleb128 0x5
	.4byte	0x282
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x6
	.byte	0x14
	.byte	0x1b
	.4byte	0x292
	.uleb128 0x7
	.4byte	0x74
	.4byte	0x2b3
	.uleb128 0x9
	.4byte	0x6d
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.4byte	0x2a3
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x7
	.byte	0x14
	.byte	0x1b
	.4byte	0x2b3
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x8
	.byte	0x14
	.byte	0x1b
	.4byte	0x2b3
	.uleb128 0x7
	.4byte	0x74
	.4byte	0x2e0
	.uleb128 0x9
	.4byte	0x6d
	.byte	0x3f
	.byte	0
	.uleb128 0x5
	.4byte	0x2d0
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x9
	.byte	0x14
	.byte	0x1b
	.4byte	0x2e0
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0xa
	.byte	0x14
	.byte	0x1b
	.4byte	0x2e0
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0xb
	.byte	0x14
	.byte	0x1b
	.4byte	0x271
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0xc
	.byte	0x14
	.byte	0x1b
	.4byte	0x292
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0xd
	.byte	0x14
	.byte	0x1b
	.4byte	0x2b3
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0xe
	.byte	0x14
	.byte	0x1b
	.4byte	0x2b3
	.uleb128 0x7
	.4byte	0x74
	.4byte	0x33d
	.uleb128 0x9
	.4byte	0x6d
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.4byte	0x32d
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0xf
	.byte	0x14
	.byte	0x1b
	.4byte	0x33d
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x10
	.byte	0x14
	.byte	0x1b
	.4byte	0x2e0
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x11
	.byte	0x14
	.byte	0x1b
	.4byte	0x2e0
	.uleb128 0x7
	.4byte	0x74
	.4byte	0x377
	.uleb128 0x12
	.4byte	0x6d
	.2byte	0x427
	.byte	0
	.uleb128 0x5
	.4byte	0x366
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x12
	.byte	0x15
	.byte	0x1b
	.4byte	0x377
	.uleb128 0x7
	.4byte	0x53
	.4byte	0x399
	.uleb128 0x12
	.4byte	0x6d
	.2byte	0x3ff
	.byte	0
	.uleb128 0x5
	.4byte	0x388
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x12
	.byte	0x18
	.byte	0x1d
	.4byte	0x399
	.uleb128 0x15
	.4byte	.LASF58
	.byte	0x8
	.byte	0x13
	.byte	0xe
	.4byte	0x412
	.uleb128 0x2
	.4byte	.LASF59
	.byte	0x13
	.byte	0xf
	.byte	0x6
	.4byte	0x37
	.byte	0
	.uleb128 0x2
	.4byte	.LASF60
	.byte	0x13
	.byte	0x10
	.byte	0x5
	.4byte	0x26
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF61
	.byte	0x13
	.byte	0x11
	.byte	0x5
	.4byte	0x26
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF62
	.byte	0x13
	.byte	0x12
	.byte	0x5
	.4byte	0x26
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF63
	.byte	0x13
	.byte	0x13
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF64
	.byte	0x13
	.byte	0x14
	.byte	0x5
	.4byte	0x26
	.byte	0x6
	.uleb128 0x2
	.4byte	.LASF65
	.byte	0x13
	.byte	0x15
	.byte	0x5
	.4byte	0x26
	.byte	0x7
	.byte	0
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x1
	.byte	0x8
	.byte	0x19
	.4byte	0x3aa
	.uleb128 0x4
	.4byte	.LASF67
	.byte	0xa
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	AbuttonObj
	.uleb128 0x4
	.4byte	.LASF68
	.byte	0xd
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	BbuttonObj
	.uleb128 0x4
	.4byte	.LASF69
	.byte	0x10
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	XbuttonObj
	.uleb128 0x4
	.4byte	.LASF70
	.byte	0x13
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	YbuttonObj
	.uleb128 0x4
	.4byte	.LASF71
	.byte	0x16
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	ZbuttonObj
	.uleb128 0x4
	.4byte	.LASF72
	.byte	0x19
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	dPadUObj
	.uleb128 0x4
	.4byte	.LASF73
	.byte	0x1c
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	dPadDObj
	.uleb128 0x4
	.4byte	.LASF74
	.byte	0x1f
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	dPadLObj
	.uleb128 0x4
	.4byte	.LASF75
	.byte	0x22
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	dPadRObj
	.uleb128 0x4
	.4byte	.LASF76
	.byte	0x25
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	STARTbuttonObj
	.uleb128 0x4
	.4byte	.LASF77
	.byte	0x28
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	LtriggerObj
	.uleb128 0x4
	.4byte	.LASF78
	.byte	0x2b
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	RtriggerObj
	.uleb128 0x4
	.4byte	.LASF79
	.byte	0x2e
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	dStickObj
	.uleb128 0x4
	.4byte	.LASF80
	.byte	0x31
	.4byte	0x257
	.uleb128 0x5
	.byte	0x3
	.4byte	cStickObj
	.uleb128 0x7
	.4byte	0x257
	.4byte	0x50e
	.uleb128 0x9
	.4byte	0x6d
	.byte	0xd
	.byte	0
	.uleb128 0x5
	.4byte	0x4fe
	.uleb128 0x4
	.4byte	.LASF81
	.byte	0x34
	.4byte	0x50e
	.uleb128 0x5
	.byte	0x3
	.4byte	spriteObjs
	.uleb128 0x23
	.4byte	.LASF82
	.byte	0x14
	.2byte	0x16e
	.byte	0x6
	.4byte	0x53b
	.uleb128 0xa
	.4byte	0x58
	.uleb128 0xa
	.4byte	0x58
	.byte	0
	.uleb128 0x16
	.4byte	.LASF83
	.byte	0x6
	.4byte	0x54b
	.uleb128 0xa
	.4byte	0x99
	.byte	0
	.uleb128 0x16
	.4byte	.LASF84
	.byte	0x7
	.4byte	0x565
	.uleb128 0xa
	.4byte	0xfb
	.uleb128 0xa
	.4byte	0xfb
	.uleb128 0xa
	.4byte	0x68
	.byte	0
	.uleb128 0x24
	.4byte	.LASF96
	.byte	0x1
	.byte	0x8e
	.byte	0x34
	.4byte	.LFB204
	.4byte	.LFE204-.LFB204
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF88
	.byte	0x58
	.4byte	.LFB203
	.4byte	.LFE203-.LFB203
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x60c
	.uleb128 0x25
	.4byte	.LASF85
	.byte	0x1
	.byte	0x59
	.byte	0x6
	.4byte	0x37
	.4byte	.LLST6
	.4byte	.LVUS6
	.uleb128 0x18
	.4byte	.LASF86
	.byte	0x68
	.4byte	0x37
	.uleb128 0x13
	.ascii	"t40\000"
	.byte	0x69
	.4byte	0x37
	.uleb128 0x18
	.4byte	.LASF87
	.byte	0x71
	.4byte	0x37
	.uleb128 0x13
	.ascii	"t16\000"
	.byte	0x72
	.4byte	0x37
	.uleb128 0x13
	.ascii	"t48\000"
	.byte	0x73
	.4byte	0x37
	.uleb128 0xf
	.4byte	.LVL17
	.4byte	0x53b
	.4byte	0x5e4
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0xf
	.4byte	.LVL18
	.4byte	0x523
	.4byte	0x5fc
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x19
	.4byte	.LVL19
	.4byte	0x53b
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF89
	.byte	0x45
	.4byte	.LFB202
	.4byte	.LFE202-.LFB202
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x709
	.uleb128 0x26
	.4byte	.LLRL0
	.4byte	0x6b3
	.uleb128 0x27
	.ascii	"i\000"
	.byte	0x1
	.byte	0x50
	.byte	0xb
	.4byte	0x99
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0x28
	.4byte	0x709
	.4byte	.LBI10
	.byte	.LVU21
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x1
	.byte	0x51
	.byte	0x3
	.uleb128 0x1a
	.4byte	0x716
	.uleb128 0x1a
	.4byte	0x722
	.uleb128 0x29
	.4byte	0x734
	.4byte	.LBI12
	.byte	.LVU33
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.4byte	0x6a8
	.uleb128 0x10
	.4byte	0x745
	.4byte	.LLST2
	.4byte	.LVUS2
	.uleb128 0x10
	.4byte	0x751
	.4byte	.LLST3
	.4byte	.LVUS3
	.uleb128 0x10
	.4byte	0x75c
	.4byte	.LLST4
	.4byte	.LVUS4
	.uleb128 0x10
	.4byte	0x767
	.4byte	.LLST5
	.4byte	.LVUS5
	.byte	0
	.uleb128 0x2a
	.4byte	.LVL4
	.4byte	0x54b
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL0
	.4byte	0x54b
	.4byte	0x6d1
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x600c000
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.2byte	0x10a0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL1
	.4byte	0x54b
	.4byte	0x6ee
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x6008000
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL8
	.4byte	0x54b
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0xc
	.4byte	0x6010400
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0xa
	.2byte	0x100
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF97
	.byte	0x2
	.byte	0xf
	.byte	0x14
	.byte	0x3
	.4byte	0x72f
	.uleb128 0xb
	.ascii	"obj\000"
	.byte	0x2
	.byte	0xf
	.byte	0x35
	.4byte	0x72f
	.uleb128 0x2c
	.4byte	.LASF90
	.byte	0x2
	.byte	0xf
	.byte	0x43
	.4byte	0xa0
	.byte	0
	.uleb128 0xd
	.4byte	0x257
	.uleb128 0x2d
	.4byte	.LASF98
	.byte	0x3
	.byte	0x57
	.byte	0x19
	.4byte	0x773
	.byte	0x3
	.4byte	0x773
	.uleb128 0xb
	.ascii	"obj\000"
	.byte	0x3
	.byte	0x57
	.byte	0x30
	.4byte	0x773
	.uleb128 0xb
	.ascii	"a0\000"
	.byte	0x3
	.byte	0x57
	.byte	0x39
	.4byte	0x37
	.uleb128 0xb
	.ascii	"a1\000"
	.byte	0x3
	.byte	0x57
	.byte	0x41
	.4byte	0x37
	.uleb128 0xb
	.ascii	"a2\000"
	.byte	0x3
	.byte	0x57
	.byte	0x49
	.4byte	0x37
	.byte	0
	.uleb128 0xd
	.4byte	0x15f
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x49
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x7e
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 52
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x48
	.byte	0x1
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x88
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x48
	.byte	0
	.uleb128 0x7d
	.uleb128 0x1
	.uleb128 0x7f
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",%progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LVUS6:
	.uleb128 .LVU58
	.uleb128 .LVU163
.LLST6:
	.byte	0x8
	.4byte	.LVL9
	.uleb128 .LVL11-.LVL9
	.uleb128 0x1
	.byte	0x5c
	.byte	0
.LVUS1:
	.uleb128 .LVU18
	.uleb128 .LVU20
.LLST1:
	.byte	0x8
	.4byte	.LVL2
	.uleb128 .LVL3-.LVL2
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS2:
	.uleb128 .LVU33
	.uleb128 .LVU40
.LLST2:
	.byte	0x8
	.4byte	.LVL5
	.uleb128 .LVL7-.LVL5
	.uleb128 0x1
	.byte	0x55
	.byte	0
.LVUS3:
	.uleb128 .LVU33
	.uleb128 .LVU37
.LLST3:
	.byte	0x8
	.4byte	.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x2
	.byte	0x74
	.sleb128 16
	.byte	0
.LVUS4:
	.uleb128 .LVU33
	.uleb128 .LVU37
.LLST4:
	.byte	0x8
	.4byte	.LVL5
	.uleb128 .LVL6-.LVL5
	.uleb128 0x2
	.byte	0x74
	.sleb128 18
	.byte	0
.LVUS5:
	.uleb128 .LVU33
	.uleb128 .LVU40
.LLST5:
	.byte	0x8
	.4byte	.LVL5
	.uleb128 .LVL7-.LVL5
	.uleb128 0x1
	.byte	0x53
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB202
	.4byte	.LFE202-.LFB202
	.4byte	.LFB203
	.4byte	.LFE203-.LFB203
	.4byte	.LFB204
	.4byte	.LFE204-.LFB204
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",%progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x5
	.4byte	.LBB9
	.byte	0x4
	.uleb128 .LBB9-.LBB9
	.uleb128 .LBE9-.LBB9
	.byte	0x4
	.uleb128 .LBB14-.LBB9
	.uleb128 .LBE14-.LBB9
	.byte	0
.LLRL7:
	.byte	0x7
	.4byte	.LFB202
	.uleb128 .LFE202-.LFB202
	.byte	0x7
	.4byte	.LFB203
	.uleb128 .LFE203-.LFB203
	.byte	0x7
	.4byte	.LFB204
	.uleb128 .LFE204-.LFB204
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF62:
	.ascii	"cStickX\000"
.LASF63:
	.ascii	"cStickY\000"
.LASF98:
	.ascii	"obj_set_attr\000"
.LASF8:
	.ascii	"vu32\000"
.LASF66:
	.ascii	"controllerState\000"
.LASF19:
	.ascii	"II_VCOUNT\000"
.LASF45:
	.ascii	"YbuttonTiles\000"
.LASF5:
	.ascii	"short int\000"
.LASF59:
	.ascii	"buttons\000"
.LASF75:
	.ascii	"dPadRObj\000"
.LASF81:
	.ascii	"spriteObjs\000"
.LASF84:
	.ascii	"memcpy256\000"
.LASF65:
	.ascii	"Rtrig\000"
.LASF77:
	.ascii	"LtriggerObj\000"
.LASF70:
	.ascii	"YbuttonObj\000"
.LASF86:
	.ascii	"triggerPress\000"
.LASF30:
	.ascii	"II_GAMEPAK\000"
.LASF16:
	.ascii	"fill\000"
.LASF51:
	.ascii	"dPadUDTiles\000"
.LASF37:
	.ascii	"tileIndex\000"
.LASF49:
	.ascii	"cStickTiles\000"
.LASF48:
	.ascii	"dStickTiles\000"
.LASF35:
	.ascii	"tileData\000"
.LASF80:
	.ascii	"cStickObj\000"
.LASF94:
	.ascii	"OBJ_ATTR\000"
.LASF72:
	.ascii	"dPadUObj\000"
.LASF15:
	.ascii	"attr2\000"
.LASF6:
	.ascii	"long long int\000"
.LASF79:
	.ascii	"dStickObj\000"
.LASF87:
	.ascii	"stickTilt\000"
.LASF9:
	.ascii	"char\000"
.LASF88:
	.ascii	"controlStateProcess\000"
.LASF11:
	.ascii	"CHARBLOCK\000"
.LASF32:
	.ascii	"long int\000"
.LASF38:
	.ascii	"tileLen\000"
.LASF95:
	.ascii	"eIrqIndex\000"
.LASF33:
	.ascii	"long unsigned int\000"
.LASF83:
	.ascii	"processInput\000"
.LASF56:
	.ascii	"gccMap\000"
.LASF44:
	.ascii	"XbuttonTiles\000"
.LASF58:
	.ascii	"ctrlState\000"
.LASF42:
	.ascii	"AbuttonTiles\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"II_SERIAL\000"
.LASF34:
	.ascii	"long double\000"
.LASF29:
	.ascii	"II_KEYPAD\000"
.LASF31:
	.ascii	"II_MAX\000"
.LASF7:
	.ascii	"vu16\000"
.LASF4:
	.ascii	"signed char\000"
.LASF90:
	.ascii	"OAM_INDEX\000"
.LASF3:
	.ascii	"long long unsigned int\000"
.LASF60:
	.ascii	"dStickX\000"
.LASF61:
	.ascii	"dStickY\000"
.LASF10:
	.ascii	"TILE\000"
.LASF13:
	.ascii	"attr0\000"
.LASF14:
	.ascii	"attr1\000"
.LASF78:
	.ascii	"RtriggerObj\000"
.LASF92:
	.ascii	"C:/Users/Landon/Desktop/my_projects/PeachyGCC/Peach"
	.ascii	"yGCC/source/controlState.c\000"
.LASF67:
	.ascii	"AbuttonObj\000"
.LASF57:
	.ascii	"regObj\000"
.LASF1:
	.ascii	"short unsigned int\000"
.LASF71:
	.ascii	"ZbuttonObj\000"
.LASF17:
	.ascii	"II_VBLANK\000"
.LASF97:
	.ascii	"init_regObj\000"
.LASF91:
	.ascii	"GNU C17 14.1.0 -mcpu=arm7tdmi -mtune=arm7tdmi -mthu"
	.ascii	"mb -mthumb-interwork -march=armv4t -g -O2\000"
.LASF93:
	.ascii	"C:\\\\Users\\\\Landon\\\\Desktop\\\\my_projects\\\\"
	.ascii	"PeachyGCC\\\\PeachyGCC\\\\build\000"
.LASF43:
	.ascii	"BbuttonTiles\000"
.LASF89:
	.ascii	"controlStateEntry\000"
.LASF27:
	.ascii	"II_DMA2\000"
.LASF28:
	.ascii	"II_DMA3\000"
.LASF12:
	.ascii	"data\000"
.LASF18:
	.ascii	"II_HBLANK\000"
.LASF76:
	.ascii	"STARTbuttonObj\000"
.LASF50:
	.ascii	"dPadLRTiles\000"
.LASF25:
	.ascii	"II_DMA0\000"
.LASF53:
	.ascii	"LtriggerTiles\000"
.LASF26:
	.ascii	"II_DMA1\000"
.LASF85:
	.ascii	"GCCbuttons\000"
.LASF69:
	.ascii	"XbuttonObj\000"
.LASF55:
	.ascii	"gccTiles\000"
.LASF64:
	.ascii	"Ltrig\000"
.LASF46:
	.ascii	"ZbuttonPressedTiles\000"
.LASF54:
	.ascii	"RtriggerTiles\000"
.LASF47:
	.ascii	"ZbuttonUnpressedTiles\000"
.LASF96:
	.ascii	"controlStateExit\000"
.LASF52:
	.ascii	"STARTbuttonTiles\000"
.LASF36:
	.ascii	"charBlock\000"
.LASF73:
	.ascii	"dPadDObj\000"
.LASF82:
	.ascii	"IntrWait\000"
.LASF2:
	.ascii	"unsigned int\000"
.LASF20:
	.ascii	"II_TIMER0\000"
.LASF21:
	.ascii	"II_TIMER1\000"
.LASF22:
	.ascii	"II_TIMER2\000"
.LASF23:
	.ascii	"II_TIMER3\000"
.LASF39:
	.ascii	"ATTR0\000"
.LASF40:
	.ascii	"ATTR1\000"
.LASF41:
	.ascii	"ATTR2\000"
.LASF68:
	.ascii	"BbuttonObj\000"
.LASF74:
	.ascii	"dPadLObj\000"
	.ident	"GCC: (devkitARM release 64) 14.1.0"
