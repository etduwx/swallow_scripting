	.file	"Swallow-sobel.xc"

	.set getIMGComponents.enable.savedstate,8
	.globl getIMGComponents.enable.savedstate
	.globl getIMGComponents.enable.cases_nstackwords
	.set getIMGComponents.enable.cases_nstackwords, 0 $M (getIMGComponents.case.0.nstackwords)
	.set usage.anon.0,0
	.globread sobel_main,core_list_sobel,"Swallow-sobel.xc:112: error: previously used here"
	.globwrite sobel_main,core_list_sobel,44,4,"Swallow-sobel.xc:83: error: previously used here (bytes 44..48)"
	.globwrite sobel_main,core_list_sobel,40,4,"Swallow-sobel.xc:82: error: previously used here (bytes 40..44)"
	.globwrite sobel_main,core_list_sobel,36,4,"Swallow-sobel.xc:81: error: previously used here (bytes 36..40)"
	.globwrite sobel_main,core_list_sobel,32,4,"Swallow-sobel.xc:80: error: previously used here (bytes 32..36)"
	.globwrite sobel_main,core_list_sobel,28,4,"Swallow-sobel.xc:79: error: previously used here (bytes 28..32)"
	.globwrite sobel_main,core_list_sobel,24,4,"Swallow-sobel.xc:78: error: previously used here (bytes 24..28)"
	.globwrite sobel_main,core_list_sobel,20,4,"Swallow-sobel.xc:77: error: previously used here (bytes 20..24)"
	.globwrite sobel_main,core_list_sobel,16,4,"Swallow-sobel.xc:76: error: previously used here (bytes 16..20)"
	.globwrite sobel_main,core_list_sobel,12,4,"Swallow-sobel.xc:75: error: previously used here (bytes 12..16)"
	.globwrite sobel_main,core_list_sobel,8,4,"Swallow-sobel.xc:74: error: previously used here (bytes 8..12)"
	.globwrite sobel_main,core_list_sobel,4,4,"Swallow-sobel.xc:73: error: previously used here (bytes 4..8)"
	.globwrite sobel_main,core_list_sobel,0,4,"Swallow-sobel.xc:72: error: previously used here (bytes 0..4)"
	.call sobel_child,sqrt
	.call sobel_child,client_releaseLocalChannel
	.call sobel_child,client_lookupParentChanend
	.call sobel_child,client_connectNewLocalChannel
	.call sobel_child,channelSendWord
	.call sobel_child,channelReceiveWord
	.call xc_sobelSelect,getIMGComponents
	.call sobel_main,printMany
	.call sobel_main,client_createThread
	.call sobel_main,client_allocateNewLocalChannel
	.call sobel_main,channelSendWord
	.call sobel_main,channelReceiveWord
	.call sobel_main,channelListen
	.call sobel_main,__builtin_getid
	.set usage.anon.0.locnoside, 1
	.set usage.anon.0.locnochandec, 1
	.set sobel_main.locnochandec, 1
	.set getIMGComponents.locnochandec, 1
	.set xc_sobelSelect.locnochandec, 1
	.set sobel_child.locnochandec, 1
	.set .nonlocal_stackwords, 0 $M (getIMGComponents.enable.cases_nstackwords)


	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI0_0.data
	.align	4
.LCPI0_0:
	.long	274877907
	.cc_bottom .LCPI0_0.data
	.cc_top .LCPI0_1.data
	.align	4
.LCPI0_1:
	.long	1431655766
	.cc_bottom .LCPI0_1.data
	.cc_top .LCPI0_2.data
	.align	4
.LCPI0_2:
	.long	536870908
	.cc_bottom .LCPI0_2.data
	.cc_top .LCPI0_3.data
	.align	4
.LCPI0_3:
	.long	4294967292
	.cc_bottom .LCPI0_3.data
	.cc_top .LCPI0_4.data
	.align	4
.LCPI0_4:
	.long	4294967293
	.cc_bottom .LCPI0_4.data
	.text
	.globl	sobel_main
	.align	2
	.type	sobel_main,@function
	.cc_top sobel_main.function
sobel_main:
.Lxtalabel0:
	entsp 31
	stw r4, sp[30]
	stw r5, sp[29]
	stw r6, sp[28]
	stw r7, sp[27]
	stw r8, sp[26]
	stw r9, sp[25]
	stw r10, sp[24]
	mov r4, r2
	stw r4, sp[2]
	getr r1, 1
	stw r1, sp[3]
	chkct res[r0], 1
	outct res[r0], 1
.Lxta.endpoint_labels0:
	in r1, res[r0]
	chkct res[r0], 1
	outct res[r0], 1
	ldc r0, 28
	stw r0, dp[core_list_sobel]
	ldc r0, 29
	stw r0, dp[core_list_sobel+4]
	ldc r1, 30
	stw r1, dp[core_list_sobel+8]
	mkmsk r1, 5
	stw r1, dp[core_list_sobel+12]
	stw r0, dp[core_list_sobel+16]
	ldc r0, 20
	stw r0, dp[core_list_sobel+20]
	ldc r0, 21
	stw r0, dp[core_list_sobel+24]
	ldc r0, 22
	stw r0, dp[core_list_sobel+28]
	ldc r0, 23
	stw r0, dp[core_list_sobel+32]
	ldc r0, 24
	stw r0, dp[core_list_sobel+36]
	ldc r0, 25
	stw r0, dp[core_list_sobel+40]
	ldc r0, 26
	stw r0, dp[core_list_sobel+44]
	bl __builtin_getid
	outct res[r4], 1
	chkct res[r4], 1
	mkmsk r0, 1
.Lxta.endpoint_labels1:
	outt res[r4], r0
	outct res[r4], 1
	chkct res[r4], 1
	ldc r5, 0
	ldaw r9, sp[12]
	ldc r6, 100
	ldc r10, 12
	mov r7, r5
.LBB0_1:
.Lxtalabel1:
	mov r0, r7
.Lxta.call_labels0:
	bl client_allocateNewLocalChannel
	mov r8, r0
	stw r8, r9[r7]
	ldaw r0, dp[core_list_sobel]
	ldw r3, r0[r7]
	mov r0, r5
	mov r1, r6
	mov r2, r7
.Lxta.call_labels1:
	bl client_createThread
	add r7, r7, 1
	lsu r4, r7, r10
	mov r0, r8
.Lxta.call_labels2:
	bl channelListen
.Lxta.loop_labels0:
	# LOOPMARKER 0
	bt r4, .LBB0_1
.Lxtalabel2:
	ldw r0, sp[3]
	setc res[r0], 1
.Lxta.endpoint_labels2:
	in r0, res[r0]
	ldc r4, 0
	mkmsk r6, 8
	mov r8, r4
	mov r1, r10
.LBB0_3:
.Lxtalabel3:
	mov r10, r4
.LBB0_4:
.Lxtalabel4:
	mov r5, r4
.LBB0_5:
.Lxtalabel5:
	mov r7, r1
	ldw r0, r9[r8]
	eq r1, r5, 2
	bt r1, .LBB0_20
.Lxtalabel6:
	mov r1, r4
.Lxta.call_labels3:
	bl channelSendWord
.LBB0_7:
.Lxtalabel7:
	add r5, r5, 1
	ldc r0, 6
	lsu r0, r5, r0
.Lxta.loop_labels1:
	# LOOPMARKER 1
	mov r1, r7
	bt r0, .LBB0_5
	bu .LBB0_8
.LBB0_20:
.Lxtalabel8:
	mov r1, r6
.Lxta.call_labels4:
	bl channelSendWord
	bu .LBB0_7
.LBB0_8:
.Lxtalabel9:
	add r10, r10, 1
	ldc r0, 6
	lsu r0, r10, r0
.Lxta.loop_labels2:
	# LOOPMARKER 2
	bt r0, .LBB0_4
.Lxtalabel10:
	add r8, r8, 1
	lss r0, r8, r1
.Lxta.loop_labels3:
	# LOOPMARKER 3
	bt r0, .LBB0_3
.Lxtalabel11:
	ldw r7, sp[3]
	setc res[r7], 1
.Lxta.endpoint_labels3:
	in r0, res[r7]
	ldw r7, sp[2]
	outct res[r7], 1
	chkct res[r7], 1
	ldc r0, 2
.Lxta.endpoint_labels4:
	outt res[r7], r0
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	ldc r0, 10
.Lxta.endpoint_labels5:
	outt res[r7], r0
	outct res[r7], 1
	chkct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels6:
	in r0, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels7:
	in r1, res[r7]
	divu r1, r1, r0
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels8:
	in r2, res[r7]
	divu r2, r2, r0
	mul r2, r2, r1
	ldc r10, 0
	ldw r1, cp[.LCPI0_0]
	lmul r2, r3, r2, r1, r10, r10
	shr r2, r2, 6
	stw r2, sp[1]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels9:
	in r3, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels10:
	in r5, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels11:
	in r11, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels12:
	in r8, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels13:
	in r6, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels14:
	in r2, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels15:
	in r4, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels16:
	in r4, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels17:
	in r4, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	chkct res[r7], 1
	outct res[r7], 1
.Lxta.endpoint_labels18:
	in r4, res[r7]
	chkct res[r7], 1
	outct res[r7], 1
	stw r0, sp[4]
	ldw r4, sp[1]
	stw r4, sp[5]
	divu r3, r3, r0
	divu r4, r5, r0
	mul r3, r4, r3
	lmul r3, r4, r3, r1, r10, r10
	shr r3, r3, 6
	stw r3, sp[6]
	divu r3, r11, r0
	divu r11, r8, r0
	mul r3, r11, r3
	lmul r3, r11, r3, r1, r10, r10
	shr r3, r3, 6
	stw r3, sp[7]
	divu r3, r6, r0
	divu r0, r2, r0
	mul r0, r0, r3
	lmul r0, r1, r0, r1, r10, r10
	shr r0, r0, 6
	stw r0, sp[8]
	ldaw r1, sp[4]
	ldc r2, 8
	mov r0, r2
.Lxta.call_labels5:
	bl printMany
	mov r5, r10
.LBB0_11:
.Lxtalabel12:
	ldc r2, 0
	mov r0, r2
	mov r1, r2
	ldw r3, cp[.LCPI0_1]
	maccs r0, r1, r5, r3
	mkmsk r1, 5
	shr r1, r0, r1
	add r0, r0, r1
	ldc r1, 6
	mul r1, r0, r1
	mov r0, r2
	maccs r0, r2, r1, r3
	ashr r1, r5, 32
	ldc r2, 30
	shr r1, r1, r2
	add r1, r5, r1
	ldw r2, cp[.LCPI0_2]
	and r1, r1, r2
	sub r1, r5, r1
	shl r1, r1, 3
	ashr r6, r1, 2
	ldw r1, cp[.LCPI0_3]
	lsu r1, r1, r6
	bt r1, .LBB0_18
	mkmsk r1, 5
	shr r1, r0, r1
	add r7, r0, r1
	add r8, r6, 3
	ldw r0, cp[.LCPI0_4]
	lsu r0, r7, r0
	bf r0, .LBB0_17
	add r10, r7, 3
	bu .LBB0_15
.LBB0_14:
.Lxtalabel13:
	add r6, r6, 1
	lsu r0, r8, r6
.Lxta.loop_labels4:
	# LOOPMARKER 6
	bt r0, .LBB0_18
.LBB0_15:
.Lxtalabel14:
	mov r4, r7
.LBB0_16:
.Lxtalabel15:
	ldw r0, r9[r5]
.Lxta.call_labels6:
	bl channelReceiveWord
	add r4, r4, 1
	lsu r0, r10, r4
.Lxta.loop_labels5:
	# LOOPMARKER 5
	bf r0, .LBB0_16
	bu .LBB0_14
.LBB0_17:
.Lxtalabel16:
	add r6, r6, 1
	lsu r0, r8, r6
.Lxta.loop_labels6:
	# LOOPMARKER 4
	bf r0, .LBB0_17
.LBB0_18:
.Lxtalabel17:
	add r5, r5, 1
	ldc r0, 12
	lss r0, r5, r0
.Lxta.loop_labels7:
	# LOOPMARKER 7
	bt r0, .LBB0_11
.Lxtalabel18:
	ldw r1, sp[3]
	setc res[r1], 1
.Lxta.endpoint_labels19:
	in r0, res[r1]
	freer res[r1]
	ldw r10, sp[24]
	ldw r9, sp[25]
	ldw r8, sp[26]
	ldw r7, sp[27]
	ldw r6, sp[28]
	ldw r5, sp[29]
	ldw r4, sp[30]
	retsp 31
	.cc_bottom sobel_main.function
	.set	sobel_main.nstackwords,((__builtin_getid.nstackwords $M client_allocateNewLocalChannel.nstackwords $M client_createThread.nstackwords $M channelListen.nstackwords $M printMany.nstackwords $M channelReceiveWord.nstackwords $M channelSendWord.nstackwords) + 31)
	.globl	sobel_main.nstackwords
	.set	sobel_main.maxcores,__builtin_getid.maxcores $M channelListen.maxcores $M channelReceiveWord.maxcores $M channelSendWord.maxcores $M client_allocateNewLocalChannel.maxcores $M client_createThread.maxcores $M printMany.maxcores $M 1
	.globl	sobel_main.maxcores
	.set	sobel_main.maxtimers,(1 + __builtin_getid.maxtimers) $M (1 + channelListen.maxtimers) $M (1 + channelReceiveWord.maxtimers) $M (1 + channelSendWord.maxtimers) $M (1 + client_allocateNewLocalChannel.maxtimers) $M (1 + client_createThread.maxtimers) $M (1 + printMany.maxtimers) $M 1
	.globl	sobel_main.maxtimers
	.set	sobel_main.maxchanends,__builtin_getid.maxchanends $M channelListen.maxchanends $M channelReceiveWord.maxchanends $M channelSendWord.maxchanends $M client_allocateNewLocalChannel.maxchanends $M client_createThread.maxchanends $M printMany.maxchanends $M 0
	.globl	sobel_main.maxchanends
.Ltmp0:
	.size	sobel_main, .Ltmp0-sobel_main

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI1_0.data
	.align	4
.LCPI1_0:
	.long	1431655766
	.cc_bottom .LCPI1_0.data
	.cc_top .LCPI1_1.data
	.align	4
.LCPI1_1:
	.long	536870908
	.cc_bottom .LCPI1_1.data
	.text
	.globl	xc_sobelSelect
	.align	2
	.type	xc_sobelSelect,@function
	.cc_top xc_sobelSelect.function
xc_sobelSelect:
.Lxtalabel19:
	entsp 60
	stw r10, sp[1]
	ldaw r10, sp[0]
	ldc r11, 59
	stw r4, r10[r11]
	ldc r11, 58
	stw r5, r10[r11]
	ldc r11, 57
	stw r6, r10[r11]
	ldc r11, 56
	stw r7, r10[r11]
	ldc r11, 55
	stw r8, r10[r11]
	ldc r11, 54
	stw r9, r10[r11]
	stw r3, r10[5]
	stw r2, r10[4]
	stw r1, r10[3]
	stw r0, r10[2]
	ldc r6, 12
	ldc r0, getIMGComponents.enable.savedstate
	mul r0, r0, r6
	mkmsk r1, 1
	or r0, r0, r1
	ldaw r1, sp[0]
	ldaw r0, r1[-r0]
	set sp, r0
	add r4, r0, 4
	# ALLOCA 0
	ldc r8, 0
	ldc r0, 18
	ldaw r9, r10[r0]
	ldaw r7, r10[6]
	mov r11, r8
	ldw r2, cp[.LCPI1_0]
.LBB1_1:
.Lxtalabel20:
	ashr r0, r11, 32
	ldc r1, 30
	shr r0, r0, r1
	add r3, r11, r0
	ashr r0, r3, 2
	ldc r1, 6
	mul r0, r0, r1
	mov r5, r8
	mov r1, r8
	maccs r5, r1, r0, r2
	mkmsk r0, 5
	shr r0, r5, r0
	add r5, r5, r0
	ldw r0, cp[.LCPI1_1]
	and r0, r3, r0
	sub r0, r11, r0
	shl r0, r0, 3
	ashr r0, r0, 2
	ldc r1, 42
	ldaw r1, r10[r1]
	stw r0, r1[r11]
	add r0, r0, 3
	ldc r1, 30
	ldaw r1, r10[r1]
	stw r0, r1[r11]
	stw r5, r9[r11]
	add r0, r5, 3
	stw r0, r7[r11]
	add r11, r11, 1
	lss r3, r11, r6
.Lxta.loop_labels8:
	# LOOPMARKER 0
	bt r3, .LBB1_1
.Lxtalabel21:
	ldc r0, 30
	ldaw r8, r10[r0]
	clre
	ldc r5, 0
.LBB1_3:
	lss r0, r5, r6
	bt r0, .LBB1_5
	bl __wait_nonlocal
	bu .Ltmp1
.LBB1_5:
	ldw r0, r10[4]
	lsu r0, r5, r0
	ecallf r0
	ldc r0, 11
	lsu r0, r0, r5
	ecallt r0
	ldw r0, r10[2]
	ldw r1, r0[r5]
	ldc r0, 42
	ldaw r0, r10[r0]
	ldw r2, r0[r5]
	ldw r0, r8[r5]
	ldw r11, r7[r5]
	ldw r3, r9[r5]
	stw r3, r4[0]
	stw r11, r4[1]
	stw r3, r4[2]
	stw r0, r4[3]
	stw r2, r4[4]
	ldw r0, r10[5]
	stw r0, r4[5]
	ldw r0, r10[3]
	stw r0, r4[6]
	stw r1, r4[7]
	ldap r11, getIMGComponents.case.0
	setv res[r1], r11
	mov r11, r4
	setev res[r1], r11
	eeu res[r1]
	add r5, r5, 1
	ldaw r4, r4[8]
	bu .LBB1_3
.Ltmp1:
.LBB1_6:
	ldc r0, 54
	ldw r9, r10[r0]
	ldc r0, 55
	ldw r8, r10[r0]
	ldc r0, 56
	ldw r7, r10[r0]
	ldc r0, 57
	ldw r6, r10[r0]
	ldc r0, 58
	ldw r5, r10[r0]
	ldc r0, 59
	ldw r4, r10[r0]
	set sp, r10
	ldw r10, sp[1]
	retsp 60
	.cc_bottom xc_sobelSelect.function
	.set	xc_sobelSelect.nstackwords,((((getIMGComponents.enable.savedstate * 12) | 1) + .nonlocal_stackwords) + 60)
	.globl	xc_sobelSelect.nstackwords
	.set	xc_sobelSelect.maxcores,1
	.globl	xc_sobelSelect.maxcores
	.set	xc_sobelSelect.maxtimers,0
	.globl	xc_sobelSelect.maxtimers
	.set	xc_sobelSelect.maxchanends,0
	.globl	xc_sobelSelect.maxchanends
.Ltmp2:
	.size	xc_sobelSelect, .Ltmp2-xc_sobelSelect

	.globl	sobel_child
	.align	2
	.type	sobel_child,@function
	.cc_top sobel_child.function
sobel_child:
.Lxtalabel22:
	entsp 64
	stw r4, sp[63]
	stw r5, sp[62]
	stw r6, sp[61]
	stw r7, sp[60]
	stw r8, sp[59]
	stw r9, sp[58]
	stw r10, sp[57]
	getr r7, 1
	setc res[r7], 1
.Lxta.endpoint_labels20:
	in r2, res[r7]
	setc res[r7], 1
.Lxta.endpoint_labels21:
	in r2, res[r7]
.Lxta.call_labels7:
	bl client_lookupParentChanend
	mov r1, r0
	mkmsk r0, 1
.Lxta.call_labels8:
	bl client_connectNewLocalChannel
	mov r8, r0
	ldc r4, 0
	ldc r10, 24
	ldaw r3, sp[21]
	ldc r5, 6
.LBB2_1:
.Lxtalabel23:
	mul r0, r4, r10
	add r6, r3, r0
	mov r0, r8
	mov r9, r3
.Lxta.call_labels9:
	bl channelReceiveWord
	stw r0, r6[0]
	mov r0, r8
.Lxta.call_labels10:
	bl channelReceiveWord
	stw r0, r6[1]
	mov r0, r8
.Lxta.call_labels11:
	bl channelReceiveWord
	stw r0, r6[2]
	mov r0, r8
.Lxta.call_labels12:
	bl channelReceiveWord
	stw r0, r6[3]
	mov r0, r8
.Lxta.call_labels13:
	bl channelReceiveWord
	stw r0, r6[4]
	mov r0, r8
.Lxta.call_labels14:
	bl channelReceiveWord
	mov r3, r9
	stw r0, r6[5]
	add r4, r4, 1
	lsu r0, r4, r5
.Lxta.loop_labels9:
	# LOOPMARKER 0
	bt r0, .LBB2_1
.Lxtalabel24:
	stw r8, sp[1]
	stw r7, sp[2]
	setc res[r7], 1
.Lxta.endpoint_labels22:
	in r0, res[r7]
	setc res[r7], 1
.Lxta.endpoint_labels23:
	in r0, res[r7]
	ldc r0, 0
	ldc r4, 4
	mov r1, r0
.LBB2_3:
.Lxtalabel25:
	mov r11, r3
	shl r2, r1, 4
	ldaw r3, sp[5]
	add r2, r3, r2
	stw r0, r2[0]
	lsu r3, r1, r4
	ecallf r3
	stw r0, r2[1]
	stw r0, r2[2]
	stw r0, r2[3]
	add r1, r1, 1
	lsu r2, r1, r4
.Lxta.loop_labels10:
	# LOOPMARKER 1
	mov r3, r11
	bt r2, .LBB2_3
	mkmsk r1, 1
.LBB2_5:
.Lxtalabel26:
	mov r5, r3
	stw r1, sp[3]
	add r0, r1, 1
	stw r0, sp[4]
	sub r4, r1, 1
	mkmsk r9, 1
.LBB2_6:
.Lxtalabel27:
	ldw r0, sp[4]
	mul r0, r0, r10
	add r2, r5, r0
	ldw r0, r2[r9]
	mul r1, r4, r10
	add r1, r5, r1
	ldw r3, r1[r9]
	sub r7, r3, r0
	sub r6, r9, 1
	ldw r0, r1[r6]
	add r9, r9, 1
	ldw r1, r1[r9]
	add r11, r1, r0
	ldw r3, r2[r6]
	sub r8, r11, r3
	ldw r11, r2[r9]
	sub r2, r8, r11
	lda16 r2, r2[r7]
	mul r2, r2, r2
	ldw r7, sp[3]
	mul r7, r7, r10
	add r8, r5, r7
	ldw r7, r8[r9]
	ldw r8, r8[r6]
	sub r7, r8, r7
	sub r0, r0, r1
	add r0, r0, r3
	sub r0, r0, r11
	lda16 r0, r0[r7]
	mul r0, r0, r0
	add r0, r0, r2
	bl __floatunsidf
.Lxta.call_labels15:
	bl sqrt
	bl __fixunsdfsi
	mkmsk r1, 5
	lsu r0, r0, r1
	bt r0, .LBB2_8
	or r0, r6, r4
	mkmsk r1, 2
	lsu r0, r1, r0
	ecallt r0
	shl r0, r4, 4
	ldaw r1, sp[5]
	add r0, r1, r0
	mkmsk r1, 1
	stw r1, r0[r6]
.LBB2_8:
.Lxtalabel28:
	ldc r0, 5
	lsu r0, r9, r0
.Lxta.loop_labels11:
	# LOOPMARKER 2
	bt r0, .LBB2_6
.Lxtalabel29:
	ldc r0, 5
	ldw r1, sp[4]
	lsu r0, r1, r0
.Lxta.loop_labels12:
	# LOOPMARKER 3
	mov r3, r5
	bt r0, .LBB2_5
.Lxtalabel30:
	ldw r1, sp[2]
	setc res[r1], 1
.Lxta.endpoint_labels24:
	in r0, res[r1]
	setc res[r1], 1
.Lxta.endpoint_labels25:
	in r0, res[r1]
	mov r6, r1
	ldc r4, 0
	ldw r7, sp[1]
	ldc r8, 4
.LBB2_11:
.Lxtalabel31:
	shl r0, r4, 4
	ldaw r1, sp[5]
	add r5, r1, r0
	ldw r1, r5[0]
	mov r0, r7
.Lxta.call_labels16:
	bl channelSendWord
	lsu r0, r4, r8
	ecallf r0
	ldw r1, r5[1]
	mov r0, r7
.Lxta.call_labels17:
	bl channelSendWord
	ldw r1, r5[2]
	mov r0, r7
.Lxta.call_labels18:
	bl channelSendWord
	ldw r1, r5[3]
	mov r0, r7
.Lxta.call_labels19:
	bl channelSendWord
	add r4, r4, 1
	lsu r0, r4, r8
.Lxta.loop_labels13:
	# LOOPMARKER 4
	bt r0, .LBB2_11
.Lxtalabel32:
	mkmsk r0, 1
.Lxta.call_labels20:
	bl client_releaseLocalChannel
	freer res[r6]
	ldw r10, sp[57]
	ldw r9, sp[58]
	ldw r8, sp[59]
	ldw r7, sp[60]
	ldw r6, sp[61]
	ldw r5, sp[62]
	ldw r4, sp[63]
	retsp 64
	.cc_bottom sobel_child.function
	.set	sobel_child.nstackwords,((client_lookupParentChanend.nstackwords $M client_connectNewLocalChannel.nstackwords $M channelReceiveWord.nstackwords $M __floatunsidf.nstackwords $M sqrt.nstackwords $M __fixunsdfsi.nstackwords $M channelSendWord.nstackwords $M client_releaseLocalChannel.nstackwords) + 64)
	.globl	sobel_child.nstackwords
	.set	sobel_child.maxcores,channelReceiveWord.maxcores $M channelSendWord.maxcores $M client_connectNewLocalChannel.maxcores $M client_lookupParentChanend.maxcores $M client_releaseLocalChannel.maxcores $M sqrt.maxcores $M 1
	.globl	sobel_child.maxcores
	.set	sobel_child.maxtimers,(1 + channelReceiveWord.maxtimers) $M (1 + channelSendWord.maxtimers) $M (1 + client_connectNewLocalChannel.maxtimers) $M (1 + client_lookupParentChanend.maxtimers) $M (1 + client_releaseLocalChannel.maxtimers) $M (1 + sqrt.maxtimers) $M 1
	.globl	sobel_child.maxtimers
	.set	sobel_child.maxchanends,channelReceiveWord.maxchanends $M channelSendWord.maxchanends $M client_connectNewLocalChannel.maxchanends $M client_lookupParentChanend.maxchanends $M client_releaseLocalChannel.maxchanends $M sqrt.maxchanends $M 0
	.globl	sobel_child.maxchanends
.Ltmp3:
	.size	sobel_child, .Ltmp3-sobel_child

	.align	2
	.type	getIMGComponents.case.0,@function
	.cc_top getIMGComponents.case.0.function
getIMGComponents.case.0:
.Lxtalabel33:
	entsp 6
	stw r4, sp[5]
	stw r5, sp[4]
	stw r6, sp[3]
	stw r7, sp[2]
	stw r8, sp[1]
	stw r9, sp[0]
	get r11, ed
	ldw r0, r11[5]
	ldw r1, r11[4]
	lsu r6, r1, r0
	ldw r7, r11[0]
	ldw r2, r11[1]
	ldw r3, r11[2]
	ldw r4, r11[3]
	ldw r5, r11[6]
	ldw r11, r11[7]
	chkct res[r11], 1
	outct res[r11], 1
	ecallf r6
	mkmsk r6, 3
	lsu r8, r6, r3
	ecallt r8
	shl r8, r1, 5
	add r8, r5, r8
.Lxta.endpoint_labels26:
	in r9, res[r11]
	stw r9, r8[r3]
	lsu r8, r4, r1
	chkct res[r11], 1
	outct res[r11], 1
	bt r8, .LBB3_6
	add r7, r7, 1
.LBB3_2:
.Lxtalabel34:
	lsu r8, r2, r7
	bt r8, .LBB3_5
	lsu r8, r1, r0
	bf r8, .LBB3_7
.LBB3_4:
.Lxtalabel35:
	lsu r8, r6, r7
	chkct res[r11], 1
	outct res[r11], 1
	ecallt r8
	shl r8, r1, 5
	add r8, r5, r8
.Lxta.endpoint_labels27:
	in r9, res[r11]
	stw r9, r8[r7]
	add r7, r7, 1
	lsu r8, r2, r7
	chkct res[r11], 1
	outct res[r11], 1
.Lxta.loop_labels14:
	# LOOPMARKER 0
	bf r8, .LBB3_4
.LBB3_5:
.Lxtalabel36:
	add r1, r1, 1
	lsu r8, r4, r1
.Lxta.loop_labels15:
	# LOOPMARKER 1
	mov r7, r3
	bf r8, .LBB3_2
.LBB3_6:
.Lxtalabel37:
	ldw r9, sp[0]
	ldw r8, sp[1]
	ldw r7, sp[2]
	ldw r6, sp[3]
	ldw r5, sp[4]
	ldw r4, sp[5]
	retsp 6
.LBB3_7:
.Lxtalabel38:
	chkct res[r11], 1
	outct res[r11], 1
	ldc r0, 0
	ecallf r0
	.cc_bottom getIMGComponents.case.0.function
	.set	getIMGComponents.case.0.nstackwords,6
	.set	getIMGComponents.case.0.maxcores,1
	.set	getIMGComponents.case.0.maxtimers,0
	.set	getIMGComponents.case.0.maxchanends,0
.Ltmp4:
	.size	getIMGComponents.case.0, .Ltmp4-getIMGComponents.case.0

	.globl	getIMGComponents.enable
	.align	2
	.type	getIMGComponents.enable,@function
	.cc_top getIMGComponents.enable.function
getIMGComponents.enable:
.Lxtalabel39:
	ldw r11, sp[4]
	stw r11, r0[0]
	ldw r11, sp[3]
	stw r11, r0[1]
	ldw r11, sp[2]
	stw r11, r0[2]
	ldw r11, sp[1]
	stw r11, r0[3]
	stw r3, r0[4]
	ldw r3, sp[5]
	stw r3, r0[5]
	stw r2, r0[6]
	stw r1, r0[7]
	ldap r11, getIMGComponents.case.0
	setv res[r1], r11
	mov r11, r0
	setev res[r1], r11
	ldaw r0, r0[8]
	eeu res[r1]
	retsp 0
	.cc_bottom getIMGComponents.enable.function
	.set	getIMGComponents.enable.nstackwords,0
	.globl	getIMGComponents.enable.nstackwords
	.set	getIMGComponents.enable.maxcores,1
	.globl	getIMGComponents.enable.maxcores
	.set	getIMGComponents.enable.maxtimers,0
	.globl	getIMGComponents.enable.maxtimers
	.set	getIMGComponents.enable.maxchanends,0
	.globl	getIMGComponents.enable.maxchanends
.Ltmp5:
	.size	getIMGComponents.enable, .Ltmp5-getIMGComponents.enable

	.globl	getIMGComponents
	.align	2
	.type	getIMGComponents,@function
	.cc_top getIMGComponents.function
getIMGComponents:
.Lxtalabel40:
	entsp 3
	stw r10, sp[1]
	ldaw r10, sp[0]
	stw r4, r10[2]
	ldc r11, getIMGComponents.enable.savedstate
	add r11, r11, 1
	ldaw r4, sp[0]
	ldaw r4, r4[-r11]
	set sp, r4
	# ALLOCA 0
	clre
	ldw r11, r10[6]
	stw r11, r4[1]
	ldw r11, r10[5]
	stw r11, r4[2]
	ldw r11, r10[4]
	stw r11, r4[3]
	stw r3, r4[4]
	stw r2, r4[5]
	ldw r2, r10[7]
	stw r2, r4[6]
	stw r1, r4[7]
	stw r0, r4[8]
	ldap r11, getIMGComponents.case.0
	setv res[r0], r11
	add r11, r4, 4
	setev res[r0], r11
	eeu res[r0]
	bl __wait_nonlocal
	bu .Ltmp6
.Ltmp6:
.LBB5_1:
	ldw r4, r10[2]
	set sp, r10
	ldw r10, sp[1]
	retsp 3
	.cc_bottom getIMGComponents.function
	.set	getIMGComponents.nstackwords,(((getIMGComponents.enable.savedstate + 1) + .nonlocal_stackwords) + 3)
	.globl	getIMGComponents.nstackwords
	.set	getIMGComponents.maxcores,1
	.globl	getIMGComponents.maxcores
	.set	getIMGComponents.maxtimers,0
	.globl	getIMGComponents.maxtimers
	.set	getIMGComponents.maxchanends,0
	.globl	getIMGComponents.maxchanends
.Ltmp7:
	.size	getIMGComponents, .Ltmp7-getIMGComponents

	.section	.dp.bss,"awd",@nobits
	.cc_top core_list_sobel.data
	.globl	core_list_sobel.globound
	.set	core_list_sobel.globound,12
	.globl	core_list_sobel
	.align	4
	.type	core_list_sobel,@object
	.size core_list_sobel,48
core_list_sobel:
	.space	48
	.cc_bottom core_list_sobel.data

	.typestring sqrt, "f{d}(d)"
	.typestring __builtin_getid, "f{si}()"
	.typestring channelListen, "f{ui}(ui)"
	.typestring channelSendWord, "f{0}(ui,ui)"
	.typestring channelReceiveWord, "f{ui}(ui)"
	.typestring printMany, "f{0}(ui,&(a(:ui)))"
	.typestring client_createThread, "f{ui}(ui,ui,ui,ui)"
	.typestring client_connectNewLocalChannel, "f{ui}(ui,ui)"
	.typestring client_allocateNewLocalChannel, "f{ui}(ui)"
	.typestring client_releaseLocalChannel, "f{0}(ui)"
	.typestring client_lookupParentChanend, "f{ui}(ui,ui)"
	.typestring sobel_main, "f{0}(chd,ui,chd)"
	.typestring xc_sobelSelect, "f{0}(&(a(:chd)),&(a(:a(8:ui))))"
	.typestring sobel_child, "f{0}(ui,ui)"
	.typestring getIMGComponents.enable, "fe{0}(chd,&(a(:a(8:ui))),ui,ui,ui,ui,si)"
	.typestring getIMGComponents, "fs{0}(chd,&(a(:a(8:ui))),ui,ui,ui,ui,si)"
	.typestring core_list_sobel, "a(12:ui)"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels0
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	110
	.long	.Lxta.call_labels0
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels1
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	112
	.long	.Lxta.call_labels1
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels2
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	114
	.long	.Lxta.call_labels2
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels4
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	191
	.long	.Lxta.call_labels4
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels3
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	193
	.long	.Lxta.call_labels3
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels5
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	230
	.long	.Lxta.call_labels5
.cc_bottom cc_5
.cc_top cc_6,.Lxta.call_labels6
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	255
	.long	.Lxta.call_labels6
.cc_bottom cc_6
.cc_top cc_7,.Lxta.call_labels7
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	378
	.long	.Lxta.call_labels7
.cc_bottom cc_7
.cc_top cc_8,.Lxta.call_labels8
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	379
	.long	.Lxta.call_labels8
.cc_bottom cc_8
.cc_top cc_9,.Lxta.call_labels14
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	.Lxta.call_labels14
.cc_bottom cc_9
.cc_top cc_10,.Lxta.call_labels13
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	.Lxta.call_labels13
.cc_bottom cc_10
.cc_top cc_11,.Lxta.call_labels12
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	.Lxta.call_labels12
.cc_bottom cc_11
.cc_top cc_12,.Lxta.call_labels11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	.Lxta.call_labels11
.cc_bottom cc_12
.cc_top cc_13,.Lxta.call_labels10
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	.Lxta.call_labels10
.cc_bottom cc_13
.cc_top cc_14,.Lxta.call_labels9
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	.Lxta.call_labels9
.cc_bottom cc_14
.cc_top cc_15,.Lxta.call_labels15
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	410
	.long	.Lxta.call_labels15
.cc_bottom cc_15
.cc_top cc_16,.Lxta.call_labels16
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	434
	.long	.Lxta.call_labels16
.cc_bottom cc_16
.cc_top cc_17,.Lxta.call_labels17
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	434
	.long	.Lxta.call_labels17
.cc_bottom cc_17
.cc_top cc_18,.Lxta.call_labels18
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	434
	.long	.Lxta.call_labels18
.cc_bottom cc_18
.cc_top cc_19,.Lxta.call_labels19
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	434
	.long	.Lxta.call_labels19
.cc_bottom cc_19
.cc_top cc_20,.Lxta.call_labels20
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	439
	.long	.Lxta.call_labels20
.cc_bottom cc_20
.Lentries_end1:
	.section	.xtaendpointtable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_21,.Lxta.endpoint_labels0
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	67
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_21
.cc_top cc_22,.Lxta.endpoint_labels1
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	106
	.long	.Lxta.endpoint_labels1
.cc_bottom cc_22
.cc_top cc_23,.Lxta.endpoint_labels2
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	120
	.long	.Lxta.endpoint_labels2
.cc_bottom cc_23
.cc_top cc_24,.Lxta.endpoint_labels3
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	201
	.long	.Lxta.endpoint_labels3
.cc_bottom cc_24
.cc_top cc_25,.Lxta.endpoint_labels4
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	203
	.long	.Lxta.endpoint_labels4
.cc_bottom cc_25
.cc_top cc_26,.Lxta.endpoint_labels5
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	204
	.long	.Lxta.endpoint_labels5
.cc_bottom cc_26
.cc_top cc_27,.Lxta.endpoint_labels6
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	210
	.long	.Lxta.endpoint_labels6
.cc_bottom cc_27
.cc_top cc_28,.Lxta.endpoint_labels7
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	211
	.long	.Lxta.endpoint_labels7
.cc_bottom cc_28
.cc_top cc_29,.Lxta.endpoint_labels8
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	212
	.long	.Lxta.endpoint_labels8
.cc_bottom cc_29
.cc_top cc_30,.Lxta.endpoint_labels9
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	213
	.long	.Lxta.endpoint_labels9
.cc_bottom cc_30
.cc_top cc_31,.Lxta.endpoint_labels10
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	214
	.long	.Lxta.endpoint_labels10
.cc_bottom cc_31
.cc_top cc_32,.Lxta.endpoint_labels11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	215
	.long	.Lxta.endpoint_labels11
.cc_bottom cc_32
.cc_top cc_33,.Lxta.endpoint_labels12
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	216
	.long	.Lxta.endpoint_labels12
.cc_bottom cc_33
.cc_top cc_34,.Lxta.endpoint_labels13
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	217
	.long	.Lxta.endpoint_labels13
.cc_bottom cc_34
.cc_top cc_35,.Lxta.endpoint_labels14
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	218
	.long	.Lxta.endpoint_labels14
.cc_bottom cc_35
.cc_top cc_36,.Lxta.endpoint_labels15
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	219
	.long	.Lxta.endpoint_labels15
.cc_bottom cc_36
.cc_top cc_37,.Lxta.endpoint_labels16
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	220
	.long	.Lxta.endpoint_labels16
.cc_bottom cc_37
.cc_top cc_38,.Lxta.endpoint_labels17
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	221
	.long	.Lxta.endpoint_labels17
.cc_bottom cc_38
.cc_top cc_39,.Lxta.endpoint_labels18
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	222
	.long	.Lxta.endpoint_labels18
.cc_bottom cc_39
.cc_top cc_40,.Lxta.endpoint_labels19
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	278
	.long	.Lxta.endpoint_labels19
.cc_bottom cc_40
.cc_top cc_41,.Lxta.endpoint_labels26
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	288
	.long	.Lxta.endpoint_labels26
.cc_bottom cc_41
.cc_top cc_42,.Lxta.endpoint_labels27
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	292
	.long	.Lxta.endpoint_labels27
.cc_bottom cc_42
.cc_top cc_43,.Lxta.endpoint_labels20
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	373
	.long	.Lxta.endpoint_labels20
.cc_bottom cc_43
.cc_top cc_44,.Lxta.endpoint_labels21
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	375
	.long	.Lxta.endpoint_labels21
.cc_bottom cc_44
.cc_top cc_45,.Lxta.endpoint_labels22
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	390
	.long	.Lxta.endpoint_labels22
.cc_bottom cc_45
.cc_top cc_46,.Lxta.endpoint_labels23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	395
	.long	.Lxta.endpoint_labels23
.cc_bottom cc_46
.cc_top cc_47,.Lxta.endpoint_labels24
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	418
	.long	.Lxta.endpoint_labels24
.cc_bottom cc_47
.cc_top cc_48,.Lxta.endpoint_labels25
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	423
	.long	.Lxta.endpoint_labels25
.cc_bottom cc_48
.Lentries_end3:
	.section	.xtalabeltable,"",@progbits
.Lentries_start4:
	.long	.Lentries_end5-.Lentries_start4
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_49,.Lxtalabel0
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	40
	.long	89
	.long	.Lxtalabel0
.cc_bottom cc_49
.cc_top cc_50,.Lxtalabel0
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	106
	.long	109
	.long	.Lxtalabel0
.cc_bottom cc_50
.cc_top cc_51,.Lxtalabel1
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	110
	.long	118
	.long	.Lxtalabel1
.cc_bottom cc_51
.cc_top cc_52,.Lxtalabel2
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	119
	.long	121
	.long	.Lxtalabel2
.cc_bottom cc_52
.cc_top cc_53,.Lxtalabel2
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	184
	.long	184
	.long	.Lxtalabel2
.cc_bottom cc_53
.cc_top cc_54,.Lxtalabel3
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	185
	.long	186
	.long	.Lxtalabel3
.cc_bottom cc_54
.cc_top cc_55,.Lxtalabel4
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	187
	.long	188
	.long	.Lxtalabel4
.cc_bottom cc_55
.cc_top cc_56,.Lxtalabel5
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	189
	.long	190
	.long	.Lxtalabel5
.cc_bottom cc_56
.cc_top cc_57,.Lxtalabel8
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	191
	.long	191
	.long	.Lxtalabel8
.cc_bottom cc_57
.cc_top cc_58,.Lxtalabel6
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	192
	.long	193
	.long	.Lxtalabel6
.cc_bottom cc_58
.cc_top cc_59,.Lxtalabel7
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	194
	.long	195
	.long	.Lxtalabel7
.cc_bottom cc_59
.cc_top cc_60,.Lxtalabel9
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	196
	.long	196
	.long	.Lxtalabel9
.cc_bottom cc_60
.cc_top cc_61,.Lxtalabel10
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	197
	.long	197
	.long	.Lxtalabel10
.cc_bottom cc_61
.cc_top cc_62,.Lxtalabel11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	198
	.long	208
	.long	.Lxtalabel11
.cc_bottom cc_62
.cc_top cc_63,.Lxtalabel11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	209
	.long	232
	.long	.Lxtalabel11
.cc_bottom cc_63
.cc_top cc_64,.Lxtalabel11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	233
	.long	233
	.long	.Lxtalabel11
.cc_bottom cc_64
.cc_top cc_65,.Lxtalabel11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	241
	.long	241
	.long	.Lxtalabel11
.cc_bottom cc_65
.cc_top cc_66,.Lxtalabel12
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	242
	.long	250
	.long	.Lxtalabel12
.cc_bottom cc_66
.cc_top cc_67,.Lxtalabel14
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	251
	.long	252
	.long	.Lxtalabel14
.cc_bottom cc_67
.cc_top cc_68,.Lxtalabel16
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	251
	.long	252
	.long	.Lxtalabel16
.cc_bottom cc_68
.cc_top cc_69,.Lxtalabel15
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	253
	.long	258
	.long	.Lxtalabel15
.cc_bottom cc_69
.cc_top cc_70,.Lxtalabel13
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	259
	.long	259
	.long	.Lxtalabel13
.cc_bottom cc_70
.cc_top cc_71,.Lxtalabel16
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	259
	.long	259
	.long	.Lxtalabel16
.cc_bottom cc_71
.cc_top cc_72,.Lxtalabel17
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	260
	.long	261
	.long	.Lxtalabel17
.cc_bottom cc_72
.cc_top cc_73,.Lxtalabel18
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	262
	.long	262
	.long	.Lxtalabel18
.cc_bottom cc_73
.cc_top cc_74,.Lxtalabel18
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	278
	.long	284
	.long	.Lxtalabel18
.cc_bottom cc_74
.cc_top cc_75,.Lxtalabel40
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	287
	.long	288
	.long	.Lxtalabel40
.cc_bottom cc_75
.cc_top cc_76,.Lxtalabel40
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	287
	.long	288
	.long	.Lxtalabel40
.cc_bottom cc_76
.cc_top cc_77,.Lxtalabel39
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	287
	.long	288
	.long	.Lxtalabel39
.cc_bottom cc_77
.cc_top cc_78,.Lxtalabel33
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	289
	.long	290
	.long	.Lxtalabel33
.cc_bottom cc_78
.cc_top cc_79,.Lxtalabel34
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	291
	.long	291
	.long	.Lxtalabel34
.cc_bottom cc_79
.cc_top cc_80,.Lxtalabel38
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	292
	.long	294
	.long	.Lxtalabel38
.cc_bottom cc_80
.cc_top cc_81,.Lxtalabel35
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	292
	.long	294
	.long	.Lxtalabel35
.cc_bottom cc_81
.cc_top cc_82,.Lxtalabel36
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	295
	.long	297
	.long	.Lxtalabel36
.cc_bottom cc_82
.cc_top cc_83,.Lxtalabel37
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	298
	.long	299
	.long	.Lxtalabel37
.cc_bottom cc_83
.cc_top cc_84,.Lxtalabel19
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	302
	.long	311
	.long	.Lxtalabel19
.cc_bottom cc_84
.cc_top cc_85,.Lxtalabel20
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	312
	.long	317
	.long	.Lxtalabel20
.cc_bottom cc_85
.cc_top cc_86,.Lxtalabel21
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	318
	.long	321
	.long	.Lxtalabel21
.cc_bottom cc_86
.cc_top cc_87,.Lxtalabel22
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	326
	.long	384
	.long	.Lxtalabel22
.cc_bottom cc_87
.cc_top cc_88,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	385
	.long	385
	.long	.Lxtalabel23
.cc_bottom cc_88
.cc_top cc_89,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	387
	.long	.Lxtalabel23
.cc_bottom cc_89
.cc_top cc_90,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	387
	.long	.Lxtalabel23
.cc_bottom cc_90
.cc_top cc_91,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	387
	.long	.Lxtalabel23
.cc_bottom cc_91
.cc_top cc_92,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	387
	.long	.Lxtalabel23
.cc_bottom cc_92
.cc_top cc_93,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	387
	.long	.Lxtalabel23
.cc_bottom cc_93
.cc_top cc_94,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	386
	.long	387
	.long	.Lxtalabel23
.cc_bottom cc_94
.cc_top cc_95,.Lxtalabel23
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	388
	.long	388
	.long	.Lxtalabel23
.cc_bottom cc_95
.cc_top cc_96,.Lxtalabel24
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	389
	.long	396
	.long	.Lxtalabel24
.cc_bottom cc_96
.cc_top cc_97,.Lxtalabel25
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	397
	.long	397
	.long	.Lxtalabel25
.cc_bottom cc_97
.cc_top cc_98,.Lxtalabel25
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	398
	.long	399
	.long	.Lxtalabel25
.cc_bottom cc_98
.cc_top cc_99,.Lxtalabel25
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	398
	.long	399
	.long	.Lxtalabel25
.cc_bottom cc_99
.cc_top cc_100,.Lxtalabel26
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	403
	.long	403
	.long	.Lxtalabel26
.cc_bottom cc_100
.cc_top cc_101,.Lxtalabel27
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	404
	.long	412
	.long	.Lxtalabel27
.cc_bottom cc_101
.cc_top cc_102,.Lxtalabel28
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	413
	.long	413
	.long	.Lxtalabel28
.cc_bottom cc_102
.cc_top cc_103,.Lxtalabel29
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	414
	.long	414
	.long	.Lxtalabel29
.cc_bottom cc_103
.cc_top cc_104,.Lxtalabel30
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	415
	.long	432
	.long	.Lxtalabel30
.cc_bottom cc_104
.cc_top cc_105,.Lxtalabel31
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	433
	.long	433
	.long	.Lxtalabel31
.cc_bottom cc_105
.cc_top cc_106,.Lxtalabel31
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	434
	.long	435
	.long	.Lxtalabel31
.cc_bottom cc_106
.cc_top cc_107,.Lxtalabel31
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	434
	.long	435
	.long	.Lxtalabel31
.cc_bottom cc_107
.cc_top cc_108,.Lxtalabel32
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	438
	.long	440
	.long	.Lxtalabel32
.cc_bottom cc_108
.Lentries_end5:
	.section	.xtalooplabeltable,"",@progbits
.Lentries_start6:
	.long	.Lentries_end7-.Lentries_start6
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_109,.Lxta.loop_labels0
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	110
	.long	118
	.long	.Lxta.loop_labels0
.cc_bottom cc_109
.cc_top cc_110,.Lxta.loop_labels3
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	185
	.long	186
	.long	.Lxta.loop_labels3
.cc_bottom cc_110
.cc_top cc_111,.Lxta.loop_labels2
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	187
	.long	188
	.long	.Lxta.loop_labels2
.cc_bottom cc_111
.cc_top cc_112,.Lxta.loop_labels1
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	189
	.long	195
	.long	.Lxta.loop_labels1
.cc_bottom cc_112
.cc_top cc_113,.Lxta.loop_labels2
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	196
	.long	196
	.long	.Lxta.loop_labels2
.cc_bottom cc_113
.cc_top cc_114,.Lxta.loop_labels3
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	197
	.long	197
	.long	.Lxta.loop_labels3
.cc_bottom cc_114
.cc_top cc_115,.Lxta.loop_labels7
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	242
	.long	250
	.long	.Lxta.loop_labels7
.cc_bottom cc_115
.cc_top cc_116,.Lxta.loop_labels4
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	251
	.long	252
	.long	.Lxta.loop_labels4
.cc_bottom cc_116
.cc_top cc_117,.Lxta.loop_labels6
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	251
	.long	252
	.long	.Lxta.loop_labels6
.cc_bottom cc_117
.cc_top cc_118,.Lxta.loop_labels5
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	253
	.long	258
	.long	.Lxta.loop_labels5
.cc_bottom cc_118
.cc_top cc_119,.Lxta.loop_labels4
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	259
	.long	259
	.long	.Lxta.loop_labels4
.cc_bottom cc_119
.cc_top cc_120,.Lxta.loop_labels6
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	259
	.long	259
	.long	.Lxta.loop_labels6
.cc_bottom cc_120
.cc_top cc_121,.Lxta.loop_labels7
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	260
	.long	261
	.long	.Lxta.loop_labels7
.cc_bottom cc_121
.cc_top cc_122,.Lxta.loop_labels15
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	291
	.long	291
	.long	.Lxta.loop_labels15
.cc_bottom cc_122
.cc_top cc_123,.Lxta.loop_labels14
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	292
	.long	294
	.long	.Lxta.loop_labels14
.cc_bottom cc_123
.cc_top cc_124,.Lxta.loop_labels15
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	295
	.long	297
	.long	.Lxta.loop_labels15
.cc_bottom cc_124
.cc_top cc_125,.Lxta.loop_labels8
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	312
	.long	317
	.long	.Lxta.loop_labels8
.cc_bottom cc_125
.cc_top cc_126,.Lxta.loop_labels9
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	385
	.long	385
	.long	.Lxta.loop_labels9
.cc_bottom cc_126
.cc_top cc_127,.Lxta.loop_labels9
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	388
	.long	388
	.long	.Lxta.loop_labels9
.cc_bottom cc_127
.cc_top cc_128,.Lxta.loop_labels10
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	397
	.long	397
	.long	.Lxta.loop_labels10
.cc_bottom cc_128
.cc_top cc_129,.Lxta.loop_labels10
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	400
	.long	400
	.long	.Lxta.loop_labels10
.cc_bottom cc_129
.cc_top cc_130,.Lxta.loop_labels12
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	403
	.long	403
	.long	.Lxta.loop_labels12
.cc_bottom cc_130
.cc_top cc_131,.Lxta.loop_labels11
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	404
	.long	413
	.long	.Lxta.loop_labels11
.cc_bottom cc_131
.cc_top cc_132,.Lxta.loop_labels12
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	414
	.long	414
	.long	.Lxta.loop_labels12
.cc_bottom cc_132
.cc_top cc_133,.Lxta.loop_labels13
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	433
	.long	433
	.long	.Lxta.loop_labels13
.cc_bottom cc_133
.cc_top cc_134,.Lxta.loop_labels13
	.ascii	 "Swallow-sobel.xc"
	.byte	0
	.long	436
	.long	437
	.long	.Lxta.loop_labels13
.cc_bottom cc_134
.Lentries_end7:
