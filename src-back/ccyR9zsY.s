	.file	"Swallow-nOS.xc"

	.globalresource 0x40500,"even_leds"
	.set usage.anon.0,0
	.set usage.anon.1,0
	.globread usage.anon.1,noUserThreadsLock,"Swallow-nOS.xc:222: error: previously used here"
	.globread nOS_doAction,noUserThreads,"Swallow-nOS.xc:168: error: previously used here"
	.globwrite eventTestB,food,"Swallow-nOS.xc:316: error: previously used here"
	.globwrite nOS_start,noUserThreadsLock,"Swallow-nOS.xc:222: error: previously used here"
	.call printID,get_local_tile_id
	.call chanTestChild,printstrln
	.call chanTestChild,client_lookupParentChanend
	.call chanTestChild,client_connectNewLocalChannel
	.call chanTestChild,channelSendWord
	.call chanTestParent,printstrln
	.call chanTestParent,printstr
	.call chanTestParent,printintln
	.call chanTestParent,client_createThread
	.call chanTestParent,client_allocateNewLocalChannel
	.call chanTestParent,channelReceiveWord
	.call chanTestParent,channelListen
	.call begin3,printstrln
	.call begin2,printstrln
	.call begin1,printstrln
	.call begin1,printintln
	.call eventTestB,nOS_setChannelDest
	.call eventTestB,getNewChannel
	.call eventTestB,channelSendWord
	.call eventTestA,select1A
	.call eventTestA,nOS_waitForEvent
	.call eventTestA,nOS_setChannelDest
	.call eventTestA,nOS_disableEvent
	.call eventTestA,installHandlerToFoo
	.call eventTestA,getNewChannel
	.call nOS_start,usage.anon.1
	.call nOS_start,setFreqDivider
	.call nOS_start,nOS_listenForAction
	.call nOS_start,getSpecificLocalChannel
	.call nOS_start,exit
	.call nOS_start,enableAEC
	.call nOS_start,__builtin_getid
	.call nOS_start,GetLock
	.call nOS_start,FreerLock
	.call nOS_doAction,nOS_createThread
	.call nOS_doAction,lookupChanMapEntry
	.call nOS_doAction,getStartAddress
	.call nOS_doAction,getNewChannel
	.call nOS_doAction,deleteChanMapEntry
	.call nOS_doAction,connectChannel
	.call nOS_doAction,addNewChanMapEntry
	.call usage.anon.0,printMany
	.call setFreqDivider,write_pswitch_reg
	.call setFreqDivider,get_local_tile_id
	.call enableAEC,write_pswitch_reg
	.call enableAEC,get_local_tile_id
	.par usage.anon.1,GetLock,"Swallow-nOS.xc:222: error: use of `%s' causes an ambiguous evaluation"
	.set usage.anon.1.locnoside, 1
	.set enableAEC.locnoside, 1
	.set setFreqDivider.locnoside, 1
	.set usage.anon.0.locnoside, 1
	.set lookupChanMapEntry.locnoside, 1
	.set eventTestA.locnoside, 1
	.set begin1.locnoside, 1
	.set begin2.locnoside, 1
	.set begin3.locnoside, 1
	.set chanTestChild.locnoside, 1
	.set printID.locnoside, 1
	.set usage.anon.1.locnochandec, 1
	.set startSync.locnochandec, 1
	.set enableAEC.locnochandec, 1
	.set setFreqDivider.locnochandec, 1
	.set usage.anon.0.locnochandec, 1
	.set addNewChanMapEntry.locnochandec, 1
	.set lookupChanMapEntry.locnochandec, 1
	.set deleteChanMapEntry.locnochandec, 1
	.set nOS_doAction.locnochandec, 1
	.set eventTestA.locnochandec, 1
	.set select1B.locnochandec, 1
	.set eventTestB.locnochandec, 1
	.set begin1.locnochandec, 1
	.set begin2.locnochandec, 1
	.set begin3.locnochandec, 1
	.set chanTestParent.locnochandec, 1
	.set chanTestChild.locnochandec, 1
	.set sinkSync.locnochandec, 1
	.set printID.locnochandec, 1


	.text
	.globl	startSync
	.align	2
	.type	startSync,@function
	.cc_top startSync.function
startSync:
.Lxtalabel0:
	outct res[r0], 1
	chkct res[r0], 1
	ldc r1, 42
.Lxta.endpoint_labels0:
	out res[r0], r1
	outct res[r0], 1
	chkct res[r0], 1
	retsp 0
	.cc_bottom startSync.function
	.set	startSync.nstackwords,0
	.globl	startSync.nstackwords
	.set	startSync.maxcores,1
	.globl	startSync.maxcores
	.set	startSync.maxtimers,0
	.globl	startSync.maxtimers
	.set	startSync.maxchanends,0
	.globl	startSync.maxchanends
.Ltmp0:
	.size	startSync, .Ltmp0-startSync

	.globl	sinkSync
	.align	2
	.type	sinkSync,@function
	.cc_top sinkSync.function
sinkSync:
.Lxtalabel1:
	bf r1, .LBB1_2
.Lxtalabel2:
	chkct res[r0], 1
	outct res[r0], 1
.Lxta.endpoint_labels1:
	in r1, res[r0]
	chkct res[r0], 1
	outct res[r0], 1
.LBB1_2:
	retsp 0
	.cc_bottom sinkSync.function
	.set	sinkSync.nstackwords,0
	.globl	sinkSync.nstackwords
	.set	sinkSync.maxcores,1
	.globl	sinkSync.maxcores
	.set	sinkSync.maxtimers,0
	.globl	sinkSync.maxtimers
	.set	sinkSync.maxchanends,0
	.globl	sinkSync.maxchanends
.Ltmp1:
	.size	sinkSync, .Ltmp1-sinkSync

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI2_0.data
	.align	4
.LCPI2_0:
	.long	4294967247
	.cc_bottom .LCPI2_0.data
	.text
	.globl	nOS_start
	.align	2
	.type	nOS_start,@function
	.cc_top nOS_start.function
nOS_start:
.Lxtalabel3:
	entsp 10367
	stw r4, sp[10366]
	stw r5, sp[10365]
	stw r6, sp[10364]
	stw r7, sp[10363]
	stw r8, sp[10362]
	stw r9, sp[10361]
	mov r4, r1
	mov r6, r0
	bl __builtin_getid
	mov r7, r0
	bl get_local_tile_id
	ldc r8, 6
	ldc r5, 0
	mov r1, r8
	mov r2, r5
.Lxta.call_labels0:
	bl write_pswitch_reg
	ldc r0, 16
	ldc r9, 523
	set ps[r9], r0
	bl get_local_tile_id
	ldc r2, 4
	mov r1, r8
.Lxta.call_labels1:
	bl write_pswitch_reg
	get r0, ps[r9]
	ldw r1, cp[.LCPI2_0]
	and r0, r0, r1
	set ps[r9], r0
.Lxta.call_labels2:
	bl GetLock
	stw r0, dp[noUserThreadsLock]
	chkct res[r6], 1
	outct res[r6], 1
.Lxta.endpoint_labels2:
	in r8, res[r6]
	chkct res[r6], 1
	outct res[r6], 1
	mkmsk r0, 5
.Lxta.call_labels3:
	bl getSpecificLocalChannel
	mov r6, r0
	mov r0, r5
	bf r7, .LBB2_2
.Lxtalabel4:
	mkmsk r0, 32
.Lxta.call_labels4:
	bl exit
	ldc r0, 0
.LBB2_2:
.Lxtalabel5:
	ldc r1, 96
	mul r1, r0, r1
	ldaw r2, sp[1]
	add r1, r2, r1
	ldc r2, 24
	mov r3, r5
.LBB2_3:
.Lxtalabel6:
	stw r5, r1[r3]
	add r3, r3, 1
	lss r11, r3, r2
.Lxta.loop_labels0:
	# LOOPMARKER 0
	bt r11, .LBB2_3
.Lxtalabel7:
	add r0, r0, 1
	ldc r1, 5
	lss r1, r0, r1
.Lxta.loop_labels1:
	# LOOPMARKER 1
	bt r1, .LBB2_2
.Lxtalabel8:
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels3:
	out res[r4], r8
	outct res[r4], 1
	chkct res[r4], 1
	ldaw r4, sp[121]
	ldaw r5, sp[1]
.LBB2_6:
.Lxtalabel9:
	mov r0, r6
	mov r1, r4
	mov r2, r5
.Lxta.call_labels5:
	bl nOS_listenForAction
	bu .LBB2_6
	.cc_bottom nOS_start.function
	.set	nOS_start.nstackwords,((__builtin_getid.nstackwords $M get_local_tile_id.nstackwords $M write_pswitch_reg.nstackwords $M GetLock.nstackwords $M getSpecificLocalChannel.nstackwords $M nOS_listenForAction.nstackwords $M exit.nstackwords) + 10367)
	.globl	nOS_start.nstackwords
	.set	nOS_start.maxcores,GetLock.maxcores $M __builtin_getid.maxcores $M exit.maxcores $M getSpecificLocalChannel.maxcores $M get_local_tile_id.maxcores $M nOS_listenForAction.maxcores $M write_pswitch_reg.maxcores $M 1
	.globl	nOS_start.maxcores
	.set	nOS_start.maxtimers,GetLock.maxtimers $M __builtin_getid.maxtimers $M exit.maxtimers $M getSpecificLocalChannel.maxtimers $M get_local_tile_id.maxtimers $M nOS_listenForAction.maxtimers $M write_pswitch_reg.maxtimers $M 0
	.globl	nOS_start.maxtimers
	.set	nOS_start.maxchanends,GetLock.maxchanends $M __builtin_getid.maxchanends $M exit.maxchanends $M getSpecificLocalChannel.maxchanends $M get_local_tile_id.maxchanends $M nOS_listenForAction.maxchanends $M write_pswitch_reg.maxchanends $M 0
	.globl	nOS_start.maxchanends
.Ltmp2:
	.size	nOS_start, .Ltmp2-nOS_start

	.globl	addNewChanMapEntry
	.align	2
	.type	addNewChanMapEntry,@function
	.cc_top addNewChanMapEntry.function
addNewChanMapEntry:
.Lxtalabel10:
	zext r2, 8
	sub r2, r2, 1
	ldc r11, 4
	lsu r11, r11, r2
	ecallt r11
	ldc r11, 23
	lsu r11, r11, r3
	ecallt r11
	ldc r11, 96
	mul r2, r2, r11
	add r0, r0, r2
	stw r1, r0[r3]
	retsp 0
	.cc_bottom addNewChanMapEntry.function
	.set	addNewChanMapEntry.nstackwords,0
	.globl	addNewChanMapEntry.nstackwords
	.set	addNewChanMapEntry.maxcores,1
	.globl	addNewChanMapEntry.maxcores
	.set	addNewChanMapEntry.maxtimers,0
	.globl	addNewChanMapEntry.maxtimers
	.set	addNewChanMapEntry.maxchanends,0
	.globl	addNewChanMapEntry.maxchanends
.Ltmp3:
	.size	addNewChanMapEntry, .Ltmp3-addNewChanMapEntry

	.globl	lookupChanMapEntry
	.align	2
	.type	lookupChanMapEntry,@function
	.cc_top lookupChanMapEntry.function
lookupChanMapEntry:
.Lxtalabel11:
	zext r1, 8
	sub r1, r1, 1
	ldc r3, 4
	lsu r3, r3, r1
	ecallt r3
	ldc r3, 23
	lsu r3, r3, r2
	ecallt r3
	ldc r3, 96
	mul r1, r1, r3
	add r0, r0, r1
	ldw r0, r0[r2]
	retsp 0
	.cc_bottom lookupChanMapEntry.function
	.set	lookupChanMapEntry.nstackwords,0
	.globl	lookupChanMapEntry.nstackwords
	.set	lookupChanMapEntry.maxcores,1
	.globl	lookupChanMapEntry.maxcores
	.set	lookupChanMapEntry.maxtimers,0
	.globl	lookupChanMapEntry.maxtimers
	.set	lookupChanMapEntry.maxchanends,0
	.globl	lookupChanMapEntry.maxchanends
.Ltmp4:
	.size	lookupChanMapEntry, .Ltmp4-lookupChanMapEntry

	.globl	deleteChanMapEntry
	.align	2
	.type	deleteChanMapEntry,@function
	.cc_top deleteChanMapEntry.function
deleteChanMapEntry:
.Lxtalabel12:
	zext r1, 8
	sub r1, r1, 1
	ldc r3, 4
	lsu r3, r3, r1
	ecallt r3
	ldc r3, 23
	lsu r3, r3, r2
	ecallt r3
	ldc r3, 96
	mul r1, r1, r3
	add r0, r0, r1
	ldc r1, 0
	stw r1, r0[r2]
	retsp 0
	.cc_bottom deleteChanMapEntry.function
	.set	deleteChanMapEntry.nstackwords,0
	.globl	deleteChanMapEntry.nstackwords
	.set	deleteChanMapEntry.maxcores,1
	.globl	deleteChanMapEntry.maxcores
	.set	deleteChanMapEntry.maxtimers,0
	.globl	deleteChanMapEntry.maxtimers
	.set	deleteChanMapEntry.maxchanends,0
	.globl	deleteChanMapEntry.maxchanends
.Ltmp5:
	.size	deleteChanMapEntry, .Ltmp5-deleteChanMapEntry

	.globl	nOS_doAction
	.align	2
	.type	nOS_doAction,@function
	.cc_top nOS_doAction.function
nOS_doAction:
.Lxtalabel13:
	entsp 6
	stw r4, sp[5]
	stw r5, sp[4]
	stw r6, sp[3]
	stw r7, sp[2]
	stw r8, sp[1]
	mov r5, r3
	mov r6, r2
	mov r4, r1
	mkmsk r1, 3
	lsu r1, r1, r0
	bt r1, .LBB6_10
.Lxtalabel14:
	ldw r7, sp[8]
	
	.xtabranch .Ljumptable0+2,.Ljumptable0+4,.Ljumptable0+6,.Ljumptable0+8,.Ljumptable0+10,.Ljumptable0+12,.Ljumptable0+14,.Ljumptable0+16
.Ljumptable0:
		bru r0
	.jmptable .LBB6_3,.LBB6_2,.LBB6_4,.LBB6_5,.LBB6_6,.LBB6_7,.LBB6_8,.LBB6_9
.LBB6_2:
.Lxtalabel15:
.Lxta.call_labels6:
	bl getNewChannel
	mov r5, r0
	mov r0, r5
	mov r1, r6
.Lxta.call_labels7:
	bl connectChannel
	shr r0, r4, 16
	zext r0, 8
	sub r0, r0, 1
	ldc r1, 4
	lsu r1, r1, r0
	ecallt r1
	zext r4, 16
	ldc r1, 24
	lsu r1, r4, r1
	ecallf r1
	ldc r1, 96
	mul r0, r0, r1
	add r0, r7, r0
	stw r5, r0[r4]
	bu .LBB6_10
.LBB6_3:
.Lxtalabel16:
	shr r0, r4, 16
	zext r0, 8
	sub r6, r0, 1
	ldc r0, 4
	lsu r8, r0, r6
.Lxta.call_labels8:
	bl getNewChannel
	mov r5, r0
	ecallt r8
	zext r4, 16
	ldc r0, 24
	lsu r0, r4, r0
	ecallf r0
	ldc r0, 96
	mul r0, r6, r0
	add r0, r7, r0
	stw r5, r0[r4]
	bu .LBB6_10
.LBB6_4:
.Lxtalabel17:
	shr r0, r4, 16
	zext r0, 8
	sub r0, r0, 1
	ldc r1, 4
	lsu r1, r1, r0
	ecallt r1
	zext r4, 16
	ldc r1, 24
	lsu r1, r4, r1
	ecallf r1
	ldc r1, 96
	mul r0, r0, r1
	add r0, r7, r0
	ldw r0, r0[r4]
	#APP
	getd r5, res[r0]
	#NO_APP
	bu .LBB6_10
.LBB6_5:
.Lxtalabel18:
	shr r0, r4, 16
	zext r0, 8
	sub r0, r0, 1
	ldc r1, 4
	lsu r1, r1, r0
	ecallt r1
	zext r4, 16
	ldc r1, 24
	lsu r1, r4, r1
	ecallf r1
	ldc r1, 96
	mul r0, r0, r1
	add r0, r7, r0
	ldw r0, r0[r4]
	#APP
	setd res[r0], r6
	#NO_APP
	ldc r5, 0
	bu .LBB6_10
.LBB6_6:
.Lxtalabel19:
	shr r0, r4, 16
	zext r0, 8
	sub r0, r0, 1
	ldc r1, 4
	lsu r1, r1, r0
	ecallt r1
	zext r4, 16
	ldc r1, 24
	lsu r1, r4, r1
	ecallf r1
	ldc r1, 96
	mul r0, r0, r1
	add r0, r7, r0
	ldw r1, r0[r4]
	#APP
	freer res[r1]
	#NO_APP
	ldc r5, 0
	stw r5, r0[r4]
	bu .LBB6_10
.LBB6_7:
.Lxtalabel20:
	shr r0, r4, 16
	zext r0, 8
	sub r0, r0, 1
	ldc r1, 4
	lsu r1, r1, r0
	ecallt r1
	zext r4, 16
	ldc r1, 24
	lsu r1, r4, r1
	ecallf r1
	ldc r1, 96
	mul r0, r0, r1
	add r0, r7, r0
	ldw r5, r0[r4]
	bu .LBB6_10
.LBB6_8:
.Lxtalabel21:
	ldw r7, sp[7]
	mov r0, r6
.Lxta.call_labels9:
	bl getStartAddress
	mov r1, r0
	mov r0, r4
	mov r2, r5
	mov r3, r7
.Lxta.call_labels10:
	bl nOS_createThread
	mov r5, r0
	bu .LBB6_10
.LBB6_9:
.Lxtalabel22:
	ldw r5, dp[noUserThreads]
.LBB6_10:
	mov r0, r5
	ldw r8, sp[1]
	ldw r7, sp[2]
	ldw r6, sp[3]
	ldw r5, sp[4]
	ldw r4, sp[5]
	retsp 6
	.cc_bottom nOS_doAction.function
	.set	nOS_doAction.nstackwords,((getNewChannel.nstackwords $M connectChannel.nstackwords $M getStartAddress.nstackwords $M nOS_createThread.nstackwords) + 6)
	.globl	nOS_doAction.nstackwords
	.set	nOS_doAction.maxcores,connectChannel.maxcores $M getNewChannel.maxcores $M getStartAddress.maxcores $M nOS_createThread.maxcores $M 1
	.globl	nOS_doAction.maxcores
	.set	nOS_doAction.maxtimers,connectChannel.maxtimers $M getNewChannel.maxtimers $M getStartAddress.maxtimers $M nOS_createThread.maxtimers $M 0
	.globl	nOS_doAction.maxtimers
	.set	nOS_doAction.maxchanends,connectChannel.maxchanends $M getNewChannel.maxchanends $M getStartAddress.maxchanends $M nOS_createThread.maxchanends $M 0
	.globl	nOS_doAction.maxchanends
.Ltmp6:
	.size	nOS_doAction, .Ltmp6-nOS_doAction

	.globl	begin1
	.align	2
	.type	begin1,@function
	.cc_top begin1.function
begin1:
.Lxtalabel23:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
	mov r4, r1
	mov r5, r0
	ldaw r0, dp[.str]
	ldc r1, 8
.Lxta.call_labels11:
	bl printstrln
	mov r0, r5
.Lxta.call_labels12:
	bl printintln
	mov r0, r4
.Lxta.call_labels13:
	bl printintln
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom begin1.function
	.set	begin1.nstackwords,((printstrln.nstackwords $M printintln.nstackwords) + 3)
	.globl	begin1.nstackwords
	.set	begin1.maxcores,printintln.maxcores $M printstrln.maxcores $M 1
	.globl	begin1.maxcores
	.set	begin1.maxtimers,printintln.maxtimers $M printstrln.maxtimers $M 0
	.globl	begin1.maxtimers
	.set	begin1.maxchanends,printintln.maxchanends $M printstrln.maxchanends $M 0
	.globl	begin1.maxchanends
.Ltmp7:
	.size	begin1, .Ltmp7-begin1

	.globl	begin2
	.align	2
	.type	begin2,@function
	.cc_top begin2.function
begin2:
.Lxtalabel24:
	entsp 1
	ldaw r0, dp[.str1]
	ldc r1, 8
.Lxta.call_labels14:
	bl printstrln
	retsp 1
	.cc_bottom begin2.function
	.set	begin2.nstackwords,(printstrln.nstackwords + 1)
	.globl	begin2.nstackwords
	.set	begin2.maxcores,printstrln.maxcores $M 1
	.globl	begin2.maxcores
	.set	begin2.maxtimers,printstrln.maxtimers $M 0
	.globl	begin2.maxtimers
	.set	begin2.maxchanends,printstrln.maxchanends $M 0
	.globl	begin2.maxchanends
.Ltmp8:
	.size	begin2, .Ltmp8-begin2

	.globl	begin3
	.align	2
	.type	begin3,@function
	.cc_top begin3.function
begin3:
.Lxtalabel25:
	entsp 1
	ldaw r0, dp[.str2]
	ldc r1, 8
.Lxta.call_labels15:
	bl printstrln
	retsp 1
	.cc_bottom begin3.function
	.set	begin3.nstackwords,(printstrln.nstackwords + 1)
	.globl	begin3.nstackwords
	.set	begin3.maxcores,printstrln.maxcores $M 1
	.globl	begin3.maxcores
	.set	begin3.maxtimers,printstrln.maxtimers $M 0
	.globl	begin3.maxtimers
	.set	begin3.maxchanends,printstrln.maxchanends $M 0
	.globl	begin3.maxchanends
.Ltmp9:
	.size	begin3, .Ltmp9-begin3

	.globl	select1B
	.align	2
	.type	select1B,@function
	.cc_top select1B.function
select1B:
.Lxtalabel26:
	clre
	ldap r11, .Ltmp10
	setv res[r0], r11
	eeu res[r0]
	ldap r11, .Ltmp11
	setv res[r1], r11
	eeu res[r1]
	
	.xtabranch .LBB10_2, .LBB10_1
waiteu
.Ltmp10:
.LBB10_1:
.Lxtalabel27:
	chkct res[r0], 1
	outct res[r0], 1
.Lxta.endpoint_labels4:
	in r1, res[r0]
	chkct res[r0], 1
	outct res[r0], 1
	retsp 0
.Ltmp11:
.LBB10_2:
.Lxtalabel28:
	chkct res[r1], 1
	outct res[r1], 1
.Lxta.endpoint_labels5:
	in r0, res[r1]
	chkct res[r1], 1
	outct res[r1], 1
	retsp 0
	.cc_bottom select1B.function
	.set	select1B.nstackwords,0
	.globl	select1B.nstackwords
	.set	select1B.maxcores,1
	.globl	select1B.maxcores
	.set	select1B.maxtimers,0
	.globl	select1B.maxtimers
	.set	select1B.maxchanends,0
	.globl	select1B.maxchanends
.Ltmp12:
	.size	select1B, .Ltmp12-select1B

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI11_0.data
	.align	4
.LCPI11_0:
	.long	263424
	.cc_bottom .LCPI11_0.data
	.text
	.align	2
	.type	even_leds.ctor,@function
	.cc_top even_leds.ctor.function
even_leds.ctor:
	ldw r0, cp[.LCPI11_0]
	setc res[r0], 8
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom even_leds.ctor.function
	.set	even_leds.ctor.nstackwords,0
	.set	even_leds.ctor.maxcores,1
	.set	even_leds.ctor.maxtimers,0
	.set	even_leds.ctor.maxchanends,0
.Ltmp13:
	.size	even_leds.ctor, .Ltmp13-even_leds.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI12_0.data
	.align	4
.LCPI12_0:
	.long	263424
	.cc_bottom .LCPI12_0.data
	.text
	.align	2
	.type	even_leds.dtor,@function
	.cc_top even_leds.dtor.function
even_leds.dtor:
	ldw r0, cp[.LCPI12_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom even_leds.dtor.function
	.set	even_leds.dtor.nstackwords,0
	.set	even_leds.dtor.maxcores,1
	.set	even_leds.dtor.maxtimers,0
	.set	even_leds.dtor.maxchanends,0
.Ltmp14:
	.size	even_leds.dtor, .Ltmp14-even_leds.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI13_0.data
	.align	4
.LCPI13_0:
	.long	4294967247
	.cc_bottom .LCPI13_0.data
	.text
	.globl	enableAEC
	.align	2
	.type	enableAEC,@function
	.cc_top enableAEC.function
enableAEC:
.Lxtalabel29:
	entsp 2
	stw r4, sp[1]
	mov r4, r0
	bl get_local_tile_id
	ldc r1, 6
	mov r2, r4
.Lxta.call_labels16:
	bl write_pswitch_reg
	ldc r0, 523
	get r1, ps[r0]
	ldw r2, cp[.LCPI13_0]
	and r1, r1, r2
	set ps[r0], r1
	ldw r4, sp[1]
	retsp 2
	.cc_bottom enableAEC.function
	.set	enableAEC.nstackwords,((get_local_tile_id.nstackwords $M write_pswitch_reg.nstackwords) + 2)
	.globl	enableAEC.nstackwords
	.set	enableAEC.maxcores,get_local_tile_id.maxcores $M write_pswitch_reg.maxcores $M 1
	.globl	enableAEC.maxcores
	.set	enableAEC.maxtimers,get_local_tile_id.maxtimers $M write_pswitch_reg.maxtimers $M 0
	.globl	enableAEC.maxtimers
	.set	enableAEC.maxchanends,get_local_tile_id.maxchanends $M write_pswitch_reg.maxchanends $M 0
	.globl	enableAEC.maxchanends
.Ltmp15:
	.size	enableAEC, .Ltmp15-enableAEC

	.globl	setFreqDivider
	.align	2
	.type	setFreqDivider,@function
	.cc_top setFreqDivider.function
setFreqDivider:
.Lxtalabel30:
	entsp 2
	stw r4, sp[1]
	mov r4, r0
	bl get_local_tile_id
	ldc r1, 6
	mov r2, r4
.Lxta.call_labels17:
	bl write_pswitch_reg
	ldc r0, 16
	ldc r1, 523
	set ps[r1], r0
	ldw r4, sp[1]
	retsp 2
	.cc_bottom setFreqDivider.function
	.set	setFreqDivider.nstackwords,((get_local_tile_id.nstackwords $M write_pswitch_reg.nstackwords) + 2)
	.globl	setFreqDivider.nstackwords
	.set	setFreqDivider.maxcores,get_local_tile_id.maxcores $M write_pswitch_reg.maxcores $M 1
	.globl	setFreqDivider.maxcores
	.set	setFreqDivider.maxtimers,get_local_tile_id.maxtimers $M write_pswitch_reg.maxtimers $M 0
	.globl	setFreqDivider.maxtimers
	.set	setFreqDivider.maxchanends,get_local_tile_id.maxchanends $M write_pswitch_reg.maxchanends $M 0
	.globl	setFreqDivider.maxchanends
.Ltmp16:
	.size	setFreqDivider, .Ltmp16-setFreqDivider

	.globl	eventTestA
	.align	2
	.type	eventTestA,@function
	.cc_top eventTestA.function
eventTestA:
.Lxtalabel31:
	entsp 4
	stw r4, sp[3]
	stw r5, sp[2]
	stw r6, sp[1]
.Lxta.call_labels18:
	bl getNewChannel
	mov r4, r0
.Lxta.call_labels19:
	bl getNewChannel
	mov r5, r0
	ldc r6, 2
	mov r0, r4
	mov r1, r6
.Lxta.call_labels20:
	bl nOS_setChannelDest
	mov r0, r5
	mov r1, r6
.Lxta.call_labels21:
	bl nOS_setChannelDest
	mov r0, r4
.Lxta.call_labels22:
	bl installHandlerToFoo
	mov r0, r5
.Lxta.call_labels23:
	bl installHandlerToFoo
.Lxta.call_labels24:
	bl nOS_waitForEvent
	mov r0, r4
.Lxta.call_labels25:
	bl nOS_disableEvent
	mov r0, r5
.Lxta.call_labels26:
	bl nOS_disableEvent
	mov r0, r4
	mov r1, r5
.Lxta.call_labels27:
	bl select1A
	ldw r6, sp[1]
	ldw r5, sp[2]
	ldw r4, sp[3]
	retsp 4
	.cc_bottom eventTestA.function
	.set	eventTestA.nstackwords,((getNewChannel.nstackwords $M nOS_setChannelDest.nstackwords $M installHandlerToFoo.nstackwords $M nOS_waitForEvent.nstackwords $M nOS_disableEvent.nstackwords $M select1A.nstackwords) + 4)
	.globl	eventTestA.nstackwords
	.set	eventTestA.maxcores,getNewChannel.maxcores $M installHandlerToFoo.maxcores $M nOS_disableEvent.maxcores $M nOS_setChannelDest.maxcores $M nOS_waitForEvent.maxcores $M select1A.maxcores $M 1
	.globl	eventTestA.maxcores
	.set	eventTestA.maxtimers,getNewChannel.maxtimers $M installHandlerToFoo.maxtimers $M nOS_disableEvent.maxtimers $M nOS_setChannelDest.maxtimers $M nOS_waitForEvent.maxtimers $M select1A.maxtimers $M 0
	.globl	eventTestA.maxtimers
	.set	eventTestA.maxchanends,getNewChannel.maxchanends $M installHandlerToFoo.maxchanends $M nOS_disableEvent.maxchanends $M nOS_setChannelDest.maxchanends $M nOS_waitForEvent.maxchanends $M select1A.maxchanends $M 0
	.globl	eventTestA.maxchanends
.Ltmp17:
	.size	eventTestA, .Ltmp17-eventTestA

	.globl	eventTestB
	.align	2
	.type	eventTestB,@function
	.cc_top eventTestB.function
eventTestB:
.Lxtalabel32:
	entsp 2
	stw r4, sp[1]
.Lxta.call_labels28:
	bl getNewChannel
	mov r4, r0
	ldc r1, 100
	ldw r0, dp[food]
	add r1, r0, r1
.LBB16_1:
	add r0, r0, 1
	eq r2, r0, r1
.xtaloop 100
	# LOOPMARKER 0
	bf r2, .LBB16_1
.Lxtalabel33:
	stw r0, dp[food]
	ldc r1, 258
	mov r0, r4
.Lxta.call_labels29:
	bl nOS_setChannelDest
	ldc r1, 42
	mov r0, r4
.Lxta.call_labels30:
	bl channelSendWord
	ldw r4, sp[1]
	retsp 2
	.cc_bottom eventTestB.function
	.set	eventTestB.nstackwords,((getNewChannel.nstackwords $M nOS_setChannelDest.nstackwords $M channelSendWord.nstackwords) + 2)
	.globl	eventTestB.nstackwords
	.set	eventTestB.maxcores,channelSendWord.maxcores $M getNewChannel.maxcores $M nOS_setChannelDest.maxcores $M 1
	.globl	eventTestB.maxcores
	.set	eventTestB.maxtimers,channelSendWord.maxtimers $M getNewChannel.maxtimers $M nOS_setChannelDest.maxtimers $M 0
	.globl	eventTestB.maxtimers
	.set	eventTestB.maxchanends,channelSendWord.maxchanends $M getNewChannel.maxchanends $M nOS_setChannelDest.maxchanends $M 0
	.globl	eventTestB.maxchanends
.Ltmp18:
	.size	eventTestB, .Ltmp18-eventTestB

	.globl	chanTestParent
	.align	2
	.type	chanTestParent,@function
	.cc_top chanTestParent.function
chanTestParent:
.Lxtalabel34:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
	chkct res[r0], 1
	outct res[r0], 1
.Lxta.endpoint_labels6:
	in r1, res[r0]
	chkct res[r0], 1
	outct res[r0], 1
	ldaw r0, dp[.str3]
	ldc r1, 29
.Lxta.call_labels31:
	bl printstrln
	mkmsk r5, 1
	mov r0, r5
.Lxta.call_labels32:
	bl client_allocateNewLocalChannel
	mov r4, r0
	ldaw r0, dp[.str4]
	ldc r1, 28
.Lxta.call_labels33:
	bl printstr
	ldaw r0, dp[.str5]
	mkmsk r1, 4
.Lxta.call_labels34:
	bl printstrln
	ldc r3, 0
	#APP
	ldap r11, chanTestChild; mov r0, r11
	#NO_APP
	#APP
	ldc r1, chanTestChild.nstackwords
	#NO_APP
	mov r2, r5
.Lxta.call_labels35:
	bl client_createThread
	ldaw r0, dp[.str6]
	ldc r1, 24
.Lxta.call_labels36:
	bl printstr
	ldaw r0, dp[.str7]
	ldc r1, 25
.Lxta.call_labels37:
	bl printstrln
	mov r0, r4
.Lxta.call_labels38:
	bl channelListen
	ldaw r0, dp[.str8]
	ldc r1, 10
.Lxta.call_labels39:
	bl printstrln
	mov r0, r4
.Lxta.call_labels40:
	bl channelReceiveWord
	mov r4, r0
	ldaw r0, dp[.str9]
	ldc r1, 26
.Lxta.call_labels41:
	bl printstr
	mov r0, r4
.Lxta.call_labels42:
	bl printintln
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom chanTestParent.function
	.set	chanTestParent.nstackwords,((client_allocateNewLocalChannel.nstackwords $M client_createThread.nstackwords $M channelListen.nstackwords $M printstrln.nstackwords $M channelReceiveWord.nstackwords $M printstr.nstackwords $M printintln.nstackwords) + 3)
	.globl	chanTestParent.nstackwords
	.set	chanTestParent.maxcores,channelListen.maxcores $M channelReceiveWord.maxcores $M client_allocateNewLocalChannel.maxcores $M client_createThread.maxcores $M printintln.maxcores $M printstr.maxcores $M printstrln.maxcores $M 1
	.globl	chanTestParent.maxcores
	.set	chanTestParent.maxtimers,channelListen.maxtimers $M channelReceiveWord.maxtimers $M client_allocateNewLocalChannel.maxtimers $M client_createThread.maxtimers $M printintln.maxtimers $M printstr.maxtimers $M printstrln.maxtimers $M 0
	.globl	chanTestParent.maxtimers
	.set	chanTestParent.maxchanends,channelListen.maxchanends $M channelReceiveWord.maxchanends $M client_allocateNewLocalChannel.maxchanends $M client_createThread.maxchanends $M printintln.maxchanends $M printstr.maxchanends $M printstrln.maxchanends $M 0
	.globl	chanTestParent.maxchanends
.Ltmp19:
	.size	chanTestParent, .Ltmp19-chanTestParent

	.globl	chanTestChild
	.align	2
	.type	chanTestChild,@function
	.cc_top chanTestChild.function
chanTestChild:
.Lxtalabel35:
	entsp 2
	stw r4, sp[1]
.Lxta.call_labels43:
	bl client_lookupParentChanend
	mov r1, r0
	mkmsk r0, 1
.Lxta.call_labels44:
	bl client_connectNewLocalChannel
	mov r4, r0
	ldaw r0, dp[.str10]
	ldc r1, 28
.Lxta.call_labels45:
	bl printstrln
	ldc r1, 42
	mov r0, r4
.Lxta.call_labels46:
	bl channelSendWord
	ldaw r0, dp[.str11]
	ldc r1, 20
.Lxta.call_labels47:
	bl printstrln
	ldw r4, sp[1]
	retsp 2
	.cc_bottom chanTestChild.function
	.set	chanTestChild.nstackwords,((client_lookupParentChanend.nstackwords $M client_connectNewLocalChannel.nstackwords $M channelSendWord.nstackwords $M printstrln.nstackwords) + 2)
	.globl	chanTestChild.nstackwords
	.set	chanTestChild.maxcores,channelSendWord.maxcores $M client_connectNewLocalChannel.maxcores $M client_lookupParentChanend.maxcores $M printstrln.maxcores $M 1
	.globl	chanTestChild.maxcores
	.set	chanTestChild.maxtimers,channelSendWord.maxtimers $M client_connectNewLocalChannel.maxtimers $M client_lookupParentChanend.maxtimers $M printstrln.maxtimers $M 0
	.globl	chanTestChild.maxtimers
	.set	chanTestChild.maxchanends,channelSendWord.maxchanends $M client_connectNewLocalChannel.maxchanends $M client_lookupParentChanend.maxchanends $M printstrln.maxchanends $M 0
	.globl	chanTestChild.maxchanends
.Ltmp20:
	.size	chanTestChild, .Ltmp20-chanTestChild

	.globl	printID
	.align	2
	.type	printID,@function
	.cc_top printID.function
printID:
.Lxtalabel36:
	entsp 1
.Lxta.call_labels48:
	bl get_local_tile_id
	retsp 1
	.cc_bottom printID.function
	.set	printID.nstackwords,(get_local_tile_id.nstackwords + 1)
	.globl	printID.nstackwords
	.set	printID.maxcores,get_local_tile_id.maxcores $M 1
	.globl	printID.maxcores
	.set	printID.maxtimers,get_local_tile_id.maxtimers $M 0
	.globl	printID.maxtimers
	.set	printID.maxchanends,get_local_tile_id.maxchanends $M 0
	.globl	printID.maxchanends
.Ltmp21:
	.size	printID, .Ltmp21-printID

	.section	.dp.rodata,"awd",@progbits
	.cc_top even_leds.data
	.globl	even_leds
	.align	4
	.type	even_leds,@object
	.size even_leds,4
even_leds:
	.long	263424
	.cc_bottom even_leds.data
	.section	.dp.bss,"awd",@nobits
	.cc_top noUserThreads.data
	.globl	noUserThreads
	.align	4
	.type	noUserThreads,@object
	.size noUserThreads,4
noUserThreads:
	.long	0
	.cc_bottom noUserThreads.data
	.cc_top noUserThreadsLock.data
	.globl	noUserThreadsLock
	.align	4
	.type	noUserThreadsLock,@object
	.size noUserThreadsLock,4
noUserThreadsLock:
	.long	0
	.cc_bottom noUserThreadsLock.data
	.cc_top food.data
	.globl	food
	.align	4
	.type	food,@object
	.size food,4
food:
	.long	0
	.cc_bottom food.data
	.section	.dp.rodata,"awd",@progbits
	.cc_top .str.data
	.align	4
	.type	.str,@object
	.size .str,8
.str:
.asciiz "Begin1!"
	.cc_bottom .str.data
	.cc_top .str1.data
	.align	4
	.type	.str1,@object
	.size .str1,8
.str1:
.asciiz "Begin2!"
	.cc_bottom .str1.data
	.cc_top .str2.data
	.align	4
	.type	.str2,@object
	.size .str2,8
.str2:
.asciiz "Begin3!"
	.cc_bottom .str2.data
	.cc_top .str3.data
	.align	4
	.type	.str3,@object
	.size .str3,29
.str3:
.asciiz "Starting channel test parent"
	.cc_bottom .str3.data
	.cc_top .str4.data
	.align	4
	.type	.str4,@object
	.size .str4,28
.str4:
.asciiz "Channel allocated with ID: "
	.cc_bottom .str4.data
	.cc_top .str5.data
	.align	4
	.type	.str5,@object
	.size .str5,15
.str5:
.asciiz "Starting child"
	.cc_bottom .str5.data
	.cc_top .str6.data
	.align	4
	.type	.str6,@object
	.size .str6,24
.str6:
.asciiz "Child started. ID is : "
	.cc_bottom .str6.data
	.cc_top .str7.data
	.align	4
	.type	.str7,@object
	.size .str7,25
.str7:
.asciiz "Now listening on channel"
	.cc_bottom .str7.data
	.cc_top .str8.data
	.align	4
	.type	.str8,@object
	.size .str8,10
.str8:
.asciiz "Listened."
	.cc_bottom .str8.data
	.cc_top .str9.data
	.align	4
	.type	.str9,@object
	.size .str9,26
.str9:
.asciiz "Done. Data received was: "
	.cc_bottom .str9.data
	.cc_top .str10.data
	.align	4
	.type	.str10,@object
	.size .str10,28
.str10:
.asciiz "chanTestChild sending word."
	.cc_bottom .str10.data
	.cc_top .str11.data
	.align	4
	.type	.str11,@object
	.size .str11,20
.str11:
.asciiz "chanTestChild done."
	.cc_bottom .str11.data
	.section	.ctors,"aw",@progbits
	.align	4
	.long	even_leds.ctor
	.section	.dtors,"aw",@progbits
	.align	4
	.long	even_leds.dtor

	.typestring write_pswitch_reg, "f{si}(ui,ui,ui)"
	.typestring get_local_tile_id, "f{ui}()"
	.typestring __builtin_getid, "f{si}()"
	.typestring printintln, "f{si}(si)"
	.typestring printstr, "f{si}(&(a(:c:uc)))"
	.typestring printstrln, "f{si}(&(a(:c:uc)))"
	.typestring exit, "f{0}(si)"
	.typestring getNewChannel, "f{ui}()"
	.typestring connectChannel, "f{0}(ui,ui)"
	.typestring getSpecificLocalChannel, "f{ui}(ui)"
	.typestring channelListen, "f{ui}(ui)"
	.typestring channelSendWord, "f{0}(ui,ui)"
	.typestring channelReceiveWord, "f{ui}(ui)"
	.typestring nOS_createThread, "f{ui}(ui,ui,ui,&(a(5:a(2048:ui))))"
	.typestring nOS_waitForEvent, "f{0}()"
	.typestring nOS_listenForAction, "f{0}(ui,&(a(5:a(2048:ui))),&(a(5:a(24:s(chanMapping){m(chanID){ui}}))))"
	.typestring nOS_disableEvent, "f{0}(ui)"
	.typestring nOS_setChannelDest, "f{0}(ui,ui)"
	.typestring GetLock, "f{ui}()"
	.typestring startSync, "f{0}(chd)"
	.typestring sinkSync, "f{0}(chd,ui)"
	.typestring nOS_start, "f{0}(chd,chd,ui)"
	.typestring addNewChanMapEntry, "f{0}(&(a(5:a(24:s(chanMapping){m(chanID){ui}}))),ui,ui,ui)"
	.typestring lookupChanMapEntry, "f{ui}(&(a(5:a(24:s(chanMapping){m(chanID){ui}}))),ui,ui)"
	.typestring deleteChanMapEntry, "f{0}(&(a(5:a(24:s(chanMapping){m(chanID){ui}}))),ui,ui)"
	.typestring nOS_doAction, "f{ui}(ui,ui,ui,ui,&(a(5:a(2048:ui))),&(a(5:a(24:s(chanMapping){m(chanID){ui}}))))"
	.typestring begin1, "f{0}(ui,ui)"
	.typestring begin2, "f{0}(ui,ui)"
	.typestring begin3, "f{0}(ui,ui)"
	.typestring select1B, "f{0}(chd,chd)"
	.typestring client_createThread, "f{ui}(ui,ui,ui,ui)"
	.typestring client_connectNewLocalChannel, "f{ui}(ui,ui)"
	.typestring client_allocateNewLocalChannel, "f{ui}(ui)"
	.typestring client_lookupParentChanend, "f{ui}(ui,ui)"
	.typestring getStartAddress, "f{ui}(ui)"
	.typestring installHandlerToFoo, "f{0}(ui)"
	.typestring select1A, "f{0}(ui,ui)"
	.typestring enableAEC, "f{0}(ui)"
	.typestring setFreqDivider, "f{0}(ui,ui)"
	.typestring eventTestA, "f{0}()"
	.typestring eventTestB, "f{0}()"
	.typestring chanTestParent, "f{0}(chd)"
	.typestring chanTestChild, "f{0}(ui,ui)"
	.typestring printID, "f{0}(ui)"
	.typestring even_leds, "o:p"
	.typestring noUserThreads, "ui"
	.typestring noUserThreadsLock, "ui"
	.typestring food, "ui"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels1
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	44
	.long	.Lxta.call_labels1
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels16
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	44
	.long	.Lxta.call_labels16
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels0
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	60
	.long	.Lxta.call_labels0
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels17
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	60
	.long	.Lxta.call_labels17
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels6
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	106
	.long	.Lxta.call_labels6
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels7
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	107
	.long	.Lxta.call_labels7
.cc_bottom cc_5
.cc_top cc_6,.Lxta.call_labels8
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	116
	.long	.Lxta.call_labels8
.cc_bottom cc_6
.cc_top cc_7,.Lxta.call_labels9
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	159
	.long	.Lxta.call_labels9
.cc_bottom cc_7
.cc_top cc_8,.Lxta.call_labels10
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	160
	.long	.Lxta.call_labels10
.cc_bottom cc_8
.cc_top cc_9,.Lxta.call_labels2
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	222
	.long	.Lxta.call_labels2
.cc_bottom cc_9
.cc_top cc_10,.Lxta.call_labels3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	228
	.long	.Lxta.call_labels3
.cc_bottom cc_10
.cc_top cc_11,.Lxta.call_labels4
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	242
	.long	.Lxta.call_labels4
.cc_bottom cc_11
.cc_top cc_12,.Lxta.call_labels5
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	261
	.long	.Lxta.call_labels5
.cc_bottom cc_12
.cc_top cc_13,.Lxta.call_labels18
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	276
	.long	.Lxta.call_labels18
.cc_bottom cc_13
.cc_top cc_14,.Lxta.call_labels19
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	277
	.long	.Lxta.call_labels19
.cc_bottom cc_14
.cc_top cc_15,.Lxta.call_labels20
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	279
	.long	.Lxta.call_labels20
.cc_bottom cc_15
.cc_top cc_16,.Lxta.call_labels21
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	280
	.long	.Lxta.call_labels21
.cc_bottom cc_16
.cc_top cc_17,.Lxta.call_labels22
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	282
	.long	.Lxta.call_labels22
.cc_bottom cc_17
.cc_top cc_18,.Lxta.call_labels23
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	283
	.long	.Lxta.call_labels23
.cc_bottom cc_18
.cc_top cc_19,.Lxta.call_labels24
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	285
	.long	.Lxta.call_labels24
.cc_bottom cc_19
.cc_top cc_20,.Lxta.call_labels25
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	287
	.long	.Lxta.call_labels25
.cc_bottom cc_20
.cc_top cc_21,.Lxta.call_labels26
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	288
	.long	.Lxta.call_labels26
.cc_bottom cc_21
.cc_top cc_22,.Lxta.call_labels27
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	291
	.long	.Lxta.call_labels27
.cc_bottom cc_22
.cc_top cc_23,.Lxta.call_labels28
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	315
	.long	.Lxta.call_labels28
.cc_bottom cc_23
.cc_top cc_24,.Lxta.call_labels29
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	318
	.long	.Lxta.call_labels29
.cc_bottom cc_24
.cc_top cc_25,.Lxta.call_labels30
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	320
	.long	.Lxta.call_labels30
.cc_bottom cc_25
.cc_top cc_26,.Lxta.call_labels11
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	327
	.long	.Lxta.call_labels11
.cc_bottom cc_26
.cc_top cc_27,.Lxta.call_labels12
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	328
	.long	.Lxta.call_labels12
.cc_bottom cc_27
.cc_top cc_28,.Lxta.call_labels13
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	329
	.long	.Lxta.call_labels13
.cc_bottom cc_28
.cc_top cc_29,.Lxta.call_labels14
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	334
	.long	.Lxta.call_labels14
.cc_bottom cc_29
.cc_top cc_30,.Lxta.call_labels15
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	339
	.long	.Lxta.call_labels15
.cc_bottom cc_30
.cc_top cc_31,.Lxta.call_labels31
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	356
	.long	.Lxta.call_labels31
.cc_bottom cc_31
.cc_top cc_32,.Lxta.call_labels32
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	357
	.long	.Lxta.call_labels32
.cc_bottom cc_32
.cc_top cc_33,.Lxta.call_labels33
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	358
	.long	.Lxta.call_labels33
.cc_bottom cc_33
.cc_top cc_34,.Lxta.call_labels34
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	360
	.long	.Lxta.call_labels34
.cc_bottom cc_34
.cc_top cc_35,.Lxta.call_labels35
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	365
	.long	.Lxta.call_labels35
.cc_bottom cc_35
.cc_top cc_36,.Lxta.call_labels36
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	366
	.long	.Lxta.call_labels36
.cc_bottom cc_36
.cc_top cc_37,.Lxta.call_labels37
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	368
	.long	.Lxta.call_labels37
.cc_bottom cc_37
.cc_top cc_38,.Lxta.call_labels38
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	369
	.long	.Lxta.call_labels38
.cc_bottom cc_38
.cc_top cc_39,.Lxta.call_labels39
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	370
	.long	.Lxta.call_labels39
.cc_bottom cc_39
.cc_top cc_40,.Lxta.call_labels40
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	371
	.long	.Lxta.call_labels40
.cc_bottom cc_40
.cc_top cc_41,.Lxta.call_labels41
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	372
	.long	.Lxta.call_labels41
.cc_bottom cc_41
.cc_top cc_42,.Lxta.call_labels42
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	373
	.long	.Lxta.call_labels42
.cc_bottom cc_42
.cc_top cc_43,.Lxta.call_labels43
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	385
	.long	.Lxta.call_labels43
.cc_bottom cc_43
.cc_top cc_44,.Lxta.call_labels44
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	388
	.long	.Lxta.call_labels44
.cc_bottom cc_44
.cc_top cc_45,.Lxta.call_labels45
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	391
	.long	.Lxta.call_labels45
.cc_bottom cc_45
.cc_top cc_46,.Lxta.call_labels46
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	392
	.long	.Lxta.call_labels46
.cc_bottom cc_46
.cc_top cc_47,.Lxta.call_labels47
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	393
	.long	.Lxta.call_labels47
.cc_bottom cc_47
.cc_top cc_48,.Lxta.call_labels48
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	413
	.long	.Lxta.call_labels48
.cc_bottom cc_48
.Lentries_end1:
	.section	.xtaendpointtable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_49,.Lxta.endpoint_labels0
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	37
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_49
.cc_top cc_50,.Lxta.endpoint_labels2
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	226
	.long	.Lxta.endpoint_labels2
.cc_bottom cc_50
.cc_top cc_51,.Lxta.endpoint_labels3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	259
	.long	.Lxta.endpoint_labels3
.cc_bottom cc_51
.cc_top cc_52,.Lxta.endpoint_labels4
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	298
	.long	.Lxta.endpoint_labels4
.cc_bottom cc_52
.cc_top cc_53,.Lxta.endpoint_labels5
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	298
	.long	.Lxta.endpoint_labels5
.cc_bottom cc_53
.cc_top cc_54,.Lxta.endpoint_labels6
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	354
	.long	.Lxta.endpoint_labels6
.cc_bottom cc_54
.cc_top cc_55,.Lxta.endpoint_labels1
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	405
	.long	.Lxta.endpoint_labels1
.cc_bottom cc_55
.Lentries_end3:
	.section	.xtalabeltable,"",@progbits
.Lentries_start4:
	.long	.Lentries_end5-.Lentries_start4
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_56,.Lxtalabel0
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	33
	.long	38
	.long	.Lxtalabel0
.cc_bottom cc_56
.cc_top cc_57,.Lxtalabel29
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	41
	.long	52
	.long	.Lxtalabel29
.cc_bottom cc_57
.cc_top cc_58,.Lxtalabel3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	41
	.long	52
	.long	.Lxtalabel3
.cc_bottom cc_58
.cc_top cc_59,.Lxtalabel30
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	55
	.long	62
	.long	.Lxtalabel30
.cc_bottom cc_59
.cc_top cc_60,.Lxtalabel3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	55
	.long	62
	.long	.Lxtalabel3
.cc_bottom cc_60
.cc_top cc_61,.Lxtalabel10
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	74
	.long	77
	.long	.Lxtalabel10
.cc_bottom cc_61
.cc_top cc_62,.Lxtalabel11
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	80
	.long	83
	.long	.Lxtalabel11
.cc_bottom cc_62
.cc_top cc_63,.Lxtalabel12
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	86
	.long	89
	.long	.Lxtalabel12
.cc_bottom cc_63
.cc_top cc_64,.Lxtalabel14
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	92
	.long	105
	.long	.Lxtalabel14
.cc_bottom cc_64
.cc_top cc_65,.Lxtalabel13
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	92
	.long	105
	.long	.Lxtalabel13
.cc_bottom cc_65
.cc_top cc_66,.Lxtalabel15
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	106
	.long	115
	.long	.Lxtalabel15
.cc_bottom cc_66
.cc_top cc_67,.Lxtalabel16
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	116
	.long	123
	.long	.Lxtalabel16
.cc_bottom cc_67
.cc_top cc_68,.Lxtalabel17
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	124
	.long	131
	.long	.Lxtalabel17
.cc_bottom cc_68
.cc_top cc_69,.Lxtalabel18
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	132
	.long	139
	.long	.Lxtalabel18
.cc_bottom cc_69
.cc_top cc_70,.Lxtalabel19
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	140
	.long	149
	.long	.Lxtalabel19
.cc_bottom cc_70
.cc_top cc_71,.Lxtalabel20
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	150
	.long	158
	.long	.Lxtalabel20
.cc_bottom cc_71
.cc_top cc_72,.Lxtalabel21
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	159
	.long	167
	.long	.Lxtalabel21
.cc_bottom cc_72
.cc_top cc_73,.Lxtalabel22
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	168
	.long	169
	.long	.Lxtalabel22
.cc_bottom cc_73
.cc_top cc_74,.Lxtalabel13
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	170
	.long	170
	.long	.Lxtalabel13
.cc_bottom cc_74
.cc_top cc_75,.Lxtalabel14
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	170
	.long	170
	.long	.Lxtalabel14
.cc_bottom cc_75
.cc_top cc_76,.Lxtalabel3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	183
	.long	204
	.long	.Lxtalabel3
.cc_bottom cc_76
.cc_top cc_77,.Lxtalabel3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	217
	.long	229
	.long	.Lxtalabel3
.cc_bottom cc_77
.cc_top cc_78,.Lxtalabel3
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	240
	.long	240
	.long	.Lxtalabel3
.cc_bottom cc_78
.cc_top cc_79,.Lxtalabel4
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	241
	.long	243
	.long	.Lxtalabel4
.cc_bottom cc_79
.cc_top cc_80,.Lxtalabel5
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	248
	.long	250
	.long	.Lxtalabel5
.cc_bottom cc_80
.cc_top cc_81,.Lxtalabel6
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	251
	.long	251
	.long	.Lxtalabel6
.cc_bottom cc_81
.cc_top cc_82,.Lxtalabel7
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	252
	.long	252
	.long	.Lxtalabel7
.cc_bottom cc_82
.cc_top cc_83,.Lxtalabel8
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	253
	.long	260
	.long	.Lxtalabel8
.cc_bottom cc_83
.cc_top cc_84,.Lxtalabel9
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	261
	.long	266
	.long	.Lxtalabel9
.cc_bottom cc_84
.cc_top cc_85,.Lxtalabel31
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	274
	.long	293
	.long	.Lxtalabel31
.cc_bottom cc_85
.cc_top cc_86,.Lxtalabel26
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	296
	.long	300
	.long	.Lxtalabel26
.cc_bottom cc_86
.cc_top cc_87,.Lxtalabel27
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	301
	.long	303
	.long	.Lxtalabel27
.cc_bottom cc_87
.cc_top cc_88,.Lxtalabel28
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	304
	.long	305
	.long	.Lxtalabel28
.cc_bottom cc_88
.cc_top cc_89,.Lxtalabel32
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	313
	.long	316
	.long	.Lxtalabel32
.cc_bottom cc_89
.cc_top cc_90,.Lxtalabel33
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	317
	.long	322
	.long	.Lxtalabel33
.cc_bottom cc_90
.cc_top cc_91,.Lxtalabel23
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	326
	.long	330
	.long	.Lxtalabel23
.cc_bottom cc_91
.cc_top cc_92,.Lxtalabel24
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	333
	.long	335
	.long	.Lxtalabel24
.cc_bottom cc_92
.cc_top cc_93,.Lxtalabel25
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	338
	.long	340
	.long	.Lxtalabel25
.cc_bottom cc_93
.cc_top cc_94,.Lxtalabel34
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	346
	.long	375
	.long	.Lxtalabel34
.cc_bottom cc_94
.cc_top cc_95,.Lxtalabel35
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	381
	.long	394
	.long	.Lxtalabel35
.cc_bottom cc_95
.cc_top cc_96,.Lxtalabel1
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	397
	.long	404
	.long	.Lxtalabel1
.cc_bottom cc_96
.cc_top cc_97,.Lxtalabel2
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	405
	.long	409
	.long	.Lxtalabel2
.cc_bottom cc_97
.cc_top cc_98,.Lxtalabel36
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	412
	.long	416
	.long	.Lxtalabel36
.cc_bottom cc_98
.Lentries_end5:
	.section	.xtalooplabeltable,"",@progbits
.Lentries_start6:
	.long	.Lentries_end7-.Lentries_start6
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_99,.Lxta.loop_labels1
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	248
	.long	250
	.long	.Lxta.loop_labels1
.cc_bottom cc_99
.cc_top cc_100,.Lxta.loop_labels0
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	251
	.long	251
	.long	.Lxta.loop_labels0
.cc_bottom cc_100
.cc_top cc_101,.Lxta.loop_labels1
	.ascii	 "Swallow-nOS.xc"
	.byte	0
	.long	252
	.long	252
	.long	.Lxta.loop_labels1
.cc_bottom cc_101
.Lentries_end7:
