	.file	"Swallow-nOS_client.xc"

	.set usage.anon.0,0
	.globread client_createThreadDynamic,sw_ncols,"Swallow-nOS_client.xc:34: error: previously used here"
	.globread client_createThreadDynamic,sw_nrows,"Swallow-nOS_client.xc:79: error: previously used here"
	.call child1,channelSendWord
	.call p1,get_address_begin1
	.call p1,client_createThread
	.call client_getThreadStatus,nodeIndexToId
	.call client_getThreadStatus,nOS_requestAction
	.call client_getThreadStatus,get_local_tile_id
	.call client_getThreadStatus,__builtin_getid
	.call client_lookupSpecificChanend,nodeIndexToId
	.call client_lookupSpecificChanend,nOS_requestAction
	.call client_lookupSpecificChanend,get_local_tile_id
	.call client_lookupParentChanend,nOS_requestAction
	.call client_lookupParentChanend,get_local_tile_id
	.call client_lookupParentChanend,__builtin_getid
	.call client_lookupLocalChanend,nOS_requestAction
	.call client_lookupLocalChanend,get_local_tile_id
	.call client_lookupLocalChanend,__builtin_getid
	.call client_releaseLocalChannel,nOS_requestAction
	.call client_releaseLocalChannel,get_local_tile_id
	.call client_releaseLocalChannel,__builtin_getid
	.call client_updateLocalChannelDest,nOS_requestAction
	.call client_updateLocalChannelDest,get_local_tile_id
	.call client_updateLocalChannelDest,__builtin_getid
	.call client_getLocalChannelDest,nOS_requestAction
	.call client_getLocalChannelDest,get_local_tile_id
	.call client_getLocalChannelDest,__builtin_getid
	.call client_allocateNewLocalChannel,nOS_requestAction
	.call client_allocateNewLocalChannel,get_local_tile_id
	.call client_allocateNewLocalChannel,__builtin_getid
	.call client_connectNewLocalChannel,nOS_requestAction
	.call client_connectNewLocalChannel,get_local_tile_id
	.call client_connectNewLocalChannel,__builtin_getid
	.call client_createThread,nodeIndexToId
	.call client_createThread,nOS_requestAction
	.call client_createThread,get_local_tile_id
	.call client_createThread,__builtin_getid
	.call client_createThreadRandom,srand
	.call client_createThreadRandom,rand
	.call client_createThreadRandom,nodeIndexToId
	.call client_createThreadRandom,nOS_requestAction
	.call client_createThreadRandom,get_local_tile_id
	.call client_createThreadRandom,__builtin_getid
	.call client_createThreadDynamic,printMany
	.call client_createThreadDynamic,nodeIndexToId
	.call client_createThreadDynamic,nOS_requestAction
	.call client_createThreadDynamic,get_local_tile_id
	.call client_createThreadDynamic,client_getThreadStatus
	.call client_createThreadDynamic,client_createThreadDynamic
	.call client_createThreadDynamic,__builtin_getid
	.set client_createThreadDynamic.locnoside, 1
	.set client_createThreadRandom.locnoside, 1
	.set client_createThread.locnoside, 1
	.set client_connectNewLocalChannel.locnoside, 1
	.set client_allocateNewLocalChannel.locnoside, 1
	.set client_getLocalChannelDest.locnoside, 1
	.set client_updateLocalChannelDest.locnoside, 1
	.set client_releaseLocalChannel.locnoside, 1
	.set client_lookupLocalChanend.locnoside, 1
	.set client_lookupParentChanend.locnoside, 1
	.set client_lookupSpecificChanend.locnoside, 1
	.set client_getThreadStatus.locnoside, 1
	.set get_address_p1.locnoside, 1
	.set get_address_begin1.locnoside, 1
	.set child1.locnoside, 1
	.set client_createThreadDynamic.locnochandec, 1
	.set client_createThreadRandom.locnochandec, 1
	.set client_createThread.locnochandec, 1
	.set client_connectNewLocalChannel.locnochandec, 1
	.set client_allocateNewLocalChannel.locnochandec, 1
	.set client_getLocalChannelDest.locnochandec, 1
	.set client_updateLocalChannelDest.locnochandec, 1
	.set client_releaseLocalChannel.locnochandec, 1
	.set client_lookupLocalChanend.locnochandec, 1
	.set client_lookupParentChanend.locnochandec, 1
	.set client_lookupSpecificChanend.locnochandec, 1
	.set client_getThreadStatus.locnochandec, 1
	.set get_address_p1.locnochandec, 1
	.set get_address_begin1.locnochandec, 1
	.set p1.locnochandec, 1
	.set child1.locnochandec, 1


	.text
	.globl	p1
	.align	2
	.type	p1,@function
	.cc_top p1.function
p1:
.Lxtalabel0:
	entsp 1
	chkct res[r0], 1
	outct res[r0], 1
.Lxta.endpoint_labels0:
	in r1, res[r0]
	chkct res[r0], 1
	outct res[r0], 1
	ldc r2, 42
	ldc r3, 0
.Lxta.call_labels0:
	bl client_createThread
	retsp 1
	.cc_bottom p1.function
	.set	p1.nstackwords,(client_createThread.nstackwords + 1)
	.globl	p1.nstackwords
	.set	p1.maxcores,client_createThread.maxcores $M 1
	.globl	p1.maxcores
	.set	p1.maxtimers,client_createThread.maxtimers $M 0
	.globl	p1.maxtimers
	.set	p1.maxchanends,client_createThread.maxchanends $M 0
	.globl	p1.maxchanends
.Ltmp0:
	.size	p1, .Ltmp0-p1

	.globl	child1
	.align	2
	.type	child1,@function
	.cc_top child1.function
child1:
.Lxtalabel1:
	entsp 1
.Lxta.call_labels1:
	bl channelSendWord
	retsp 1
	.cc_bottom child1.function
	.set	child1.nstackwords,(channelSendWord.nstackwords + 1)
	.globl	child1.nstackwords
	.set	child1.maxcores,channelSendWord.maxcores $M 1
	.globl	child1.maxcores
	.set	child1.maxtimers,channelSendWord.maxtimers $M 0
	.globl	child1.maxtimers
	.set	child1.maxchanends,channelSendWord.maxchanends $M 0
	.globl	child1.maxchanends
.Ltmp1:
	.size	child1, .Ltmp1-child1

	.globl	client_createThread
	.align	2
	.type	client_createThread,@function
	.cc_top client_createThread.function
client_createThread:
.Lxtalabel2:
	entsp 6
	stw r4, sp[5]
	stw r5, sp[4]
	stw r6, sp[3]
	stw r7, sp[2]
	mov r6, r3
	mov r5, r2
	mov r4, r0
.Lxta.call_labels2:
	bl get_local_tile_id
	shl r7, r0, 16
	bl __builtin_getid
	or r7, r7, r0
	mov r0, r6
	bl nodeIndexToId
	ldc r1, 7938
	or r0, r0, r1
	stw r5, sp[1]
	ldc r1, 6
	mov r2, r7
	mov r3, r4
.Lxta.call_labels3:
	bl nOS_requestAction
	ldw r7, sp[2]
	ldw r6, sp[3]
	ldw r5, sp[4]
	ldw r4, sp[5]
	retsp 6
	.cc_bottom client_createThread.function
	.set	client_createThread.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nodeIndexToId.nstackwords $M nOS_requestAction.nstackwords) + 6)
	.globl	client_createThread.nstackwords
	.set	client_createThread.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M nodeIndexToId.maxcores $M 1
	.globl	client_createThread.maxcores
	.set	client_createThread.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M nodeIndexToId.maxtimers $M 0
	.globl	client_createThread.maxtimers
	.set	client_createThread.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M nodeIndexToId.maxchanends $M 0
	.globl	client_createThread.maxchanends
.Ltmp2:
	.size	client_createThread, .Ltmp2-client_createThread

	.globl	client_createThreadDynamic
	.align	2
	.type	client_createThreadDynamic,@function
	.cc_top client_createThreadDynamic.function
client_createThreadDynamic:
.Lxtalabel3:
	entsp 29
	stw r4, sp[28]
	stw r5, sp[27]
	stw r6, sp[26]
	stw r7, sp[25]
	stw r8, sp[24]
	stw r9, sp[23]
	stw r10, sp[22]
	mov r9, r3
	mov r8, r2
	mov r5, r1
	mov r4, r0
.Lxta.call_labels4:
	bl get_local_tile_id
	mov r7, r0
	shl r6, r7, 16
	bl __builtin_getid
	or r0, r6, r0
	stw r0, sp[3]
	ldw r0, dp[sw_ncols]
	bt r8, .LBB3_5
.Lxtalabel4:
	shr r10, r7, 8
	mul r0, r0, r10
	shr r1, r7, 1
	zext r1, 2
	stw r1, sp[7]
	add r6, r0, r1
	mov r0, r6
.Lxta.call_labels5:
	bl client_getThreadStatus
	ldc r1, 4
	lsu r0, r0, r1
	bt r0, .LBB3_7
	mkmsk r1, 1
.LBB3_3:
.Lxtalabel5:
	mov r11, r10
	ldc r0, 1000
	stw r0, sp[19]
	stw r0, sp[20]
	stw r0, sp[21]
	eq r0, r9, 1
	bt r0, .LBB3_9
	mov r10, r6
	bu .LBB3_36
.LBB3_5:
.Lxtalabel6:
	ldw r6, sp[30]
	divu r10, r6, r0
	remu r0, r6, r0
	stw r0, sp[7]
	bf r9, .LBB3_8
	ldc r1, 0
	bu .LBB3_3
.LBB3_7:
.Lxtalabel7:
	stw r5, sp[11]
	stw r6, sp[12]
	ldc r0, 2
	ldaw r1, sp[11]
	ldc r2, 5
.Lxta.call_labels6:
	bl printMany
	mov r0, r6
	bl nodeIndexToId
	ldc r1, 7938
	or r0, r0, r1
	stw r5, sp[1]
	ldc r1, 6
	ldw r2, sp[3]
	mov r3, r4
.Lxta.call_labels7:
	bl nOS_requestAction
	mov r10, r0
	bu .LBB3_37
.LBB3_8:
.Lxtalabel8:
	mov r0, r6
.Lxta.call_labels8:
	bl client_getThreadStatus
	mov r10, r0
	bu .LBB3_37
.LBB3_9:
	stw r1, sp[2]
	sub r0, r6, 2
	stw r0, sp[6]
	sub r0, r6, 1
	stw r0, sp[9]
	add r0, r6, 2
	stw r0, sp[5]
	add r8, r8, 1
	add r0, r6, 1
	stw r0, sp[8]
	stw r6, sp[10]
	ldc r9, 0
	mkmsk r1, 2
	ldw r0, sp[7]
	lsu r0, r1, r0
	stw r0, sp[4]
.LBB3_10:
.Lxtalabel9:
	ldw r0, sp[4]
	bf r0, .LBB3_12
	ldc r1, 10
	mov r10, r7
	bu .LBB3_22
.LBB3_12:
.Lxtalabel10:
	mov r10, r11
	ldw r0, sp[7]
	
	.xtabranch .Ljumptable0+2,.Ljumptable0+4,.Ljumptable0+6,.Ljumptable0+8
.Ljumptable0:
		bru r0
	.jmptable .LBB3_13,.LBB3_28,.LBB3_29,.LBB3_33
.LBB3_13:
.Lxtalabel11:
	ldw r0, sp[8]
	stw r0, sp[16]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels9:
	bl client_createThreadDynamic
	stw r0, sp[19]
	bt r10, .LBB3_26
	mkmsk r6, 1
.LBB3_15:
.Lxtalabel12:
	ldw r0, dp[sw_nrows]
	sub r0, r0, 1
	lsu r0, r10, r0
	bt r0, .LBB3_27
.LBB3_16:
	mov r11, r10
	ldc r0, 0
	ldc r2, 10
.LBB3_17:
.Lxtalabel13:
	ldc r1, 2
	lsu r1, r1, r0
	ecallt r1
	ldaw r1, sp[19]
	ldw r1, r1[r0]
	lsu r3, r1, r2
	bt r3, .LBB3_19
.Lxtalabel14:
	mov r1, r2
.LBB3_19:
.Lxtalabel15:
	mov r10, r0
	bt r3, .LBB3_21
.Lxtalabel16:
	mov r10, r7
.LBB3_21:
.Lxtalabel17:
	add r0, r0, 1
	lsu r3, r0, r6
.Lxta.loop_labels0:
	# LOOPMARKER 0
	mov r2, r1
	mov r7, r10
	bt r3, .LBB3_17
.LBB3_22:
.Lxtalabel18:
	bt r9, .LBB3_35
.Lxtalabel19:
	ldc r0, 4
	lsu r0, r1, r0
	mkmsk r9, 1
	mov r7, r10
	bf r0, .LBB3_10
	bu .LBB3_24
.LBB3_38:
.Lxtalabel20:
	ldw r0, dp[sw_ncols]
	ldw r1, sp[10]
	sub r0, r1, r0
	stw r0, sp[17]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels10:
	bl client_createThreadDynamic
	stw r0, sp[20]
	ldc r6, 2
	bu .LBB3_31
.LBB3_26:
.Lxtalabel21:
	ldw r0, dp[sw_ncols]
	ldw r1, sp[10]
	sub r0, r1, r0
	stw r0, sp[17]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels11:
	bl client_createThreadDynamic
	stw r0, sp[20]
	ldc r6, 2
	bu .LBB3_15
.LBB3_27:
.Lxtalabel22:
	ldw r0, dp[sw_ncols]
	ldw r1, sp[10]
	add r0, r0, r1
	ldaw r1, sp[16]
	stw r0, r1[r6]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels12:
	bl client_createThreadDynamic
	ldaw r1, sp[19]
	stw r0, r1[r6]
	add r6, r6, 1
	bu .LBB3_16
.LBB3_28:
.Lxtalabel23:
	ldw r0, sp[5]
	stw r0, sp[16]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels13:
	bl client_createThreadDynamic
	stw r0, sp[19]
	ldw r0, sp[9]
	stw r0, sp[17]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels14:
	bl client_createThreadDynamic
	stw r0, sp[20]
	ldc r6, 2
	bu .LBB3_16
.LBB3_29:
.Lxtalabel24:
	ldw r0, sp[8]
	stw r0, sp[16]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels15:
	bl client_createThreadDynamic
	stw r0, sp[19]
	bt r10, .LBB3_38
	mkmsk r6, 1
.LBB3_31:
.Lxtalabel25:
	ldw r0, dp[sw_nrows]
	sub r0, r0, 1
	lsu r0, r10, r0
	bf r0, .LBB3_16
.Lxtalabel26:
	ldw r0, dp[sw_ncols]
	ldw r1, sp[10]
	add r0, r0, r1
	ldaw r1, sp[16]
	stw r0, r1[r6]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels16:
	bl client_createThreadDynamic
	ldaw r1, sp[19]
	stw r0, r1[r6]
	add r6, r6, 1
	bu .LBB3_16
.LBB3_33:
.Lxtalabel27:
	ldw r0, sp[6]
	stw r0, sp[16]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels17:
	bl client_createThreadDynamic
	stw r0, sp[19]
	ldw r0, sp[9]
	stw r0, sp[17]
	stw r0, sp[1]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
.Lxta.call_labels18:
	bl client_createThreadDynamic
	stw r0, sp[20]
	ldc r6, 2
	bu .LBB3_16
.LBB3_24:
.Lxtalabel28:
	ldw r0, sp[2]
	eq r0, r0, 1
	mkmsk r1, 2
	bf r0, .LBB3_34
.Lxtalabel29:
	lsu r0, r10, r1
	ecallf r0
	ldaw r0, sp[16]
	ldw r10, r0[r10]
	bu .LBB3_36
.LBB3_34:
.Lxtalabel30:
	lsu r0, r10, r1
	ecallf r0
	ldaw r0, sp[16]
	ldw r10, r0[r10]
	bu .LBB3_37
.LBB3_35:
.Lxtalabel31:
	ldw r0, sp[2]
	bf r0, .LBB3_37
.LBB3_36:
.Lxtalabel32:
	stw r5, sp[11]
	stw r10, sp[12]
	ldc r0, 2
	ldaw r1, sp[11]
	ldc r2, 5
.Lxta.call_labels19:
	bl printMany
	mov r0, r10
	bl nodeIndexToId
	ldc r1, 7938
	or r0, r0, r1
	stw r5, sp[1]
	ldc r1, 6
	ldw r2, sp[3]
	mov r3, r4
.Lxta.call_labels20:
	bl nOS_requestAction
	mov r10, r0
.LBB3_37:
	mov r0, r10
	ldw r10, sp[22]
	ldw r9, sp[23]
	ldw r8, sp[24]
	ldw r7, sp[25]
	ldw r6, sp[26]
	ldw r5, sp[27]
	ldw r4, sp[28]
	retsp 29
	.cc_bottom client_createThreadDynamic.function
	.set	client_createThreadDynamic.nstackwords.pragma,3000
	.globl	client_createThreadDynamic.nstackwords.pragma
	.set	client_createThreadDynamic.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M printMany.nstackwords $M nodeIndexToId.nstackwords $M nOS_requestAction.nstackwords $M client_createThreadDynamic.nstackwords $M client_getThreadStatus.nstackwords) + 29)
	.globl	client_createThreadDynamic.nstackwords
	.set	client_createThreadDynamic.maxcores,__builtin_getid.maxcores $M client_createThreadDynamic.maxcores $M client_getThreadStatus.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M nodeIndexToId.maxcores $M printMany.maxcores $M 1
	.globl	client_createThreadDynamic.maxcores
	.set	client_createThreadDynamic.maxtimers,__builtin_getid.maxtimers $M client_createThreadDynamic.maxtimers $M client_getThreadStatus.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M nodeIndexToId.maxtimers $M printMany.maxtimers $M 0
	.globl	client_createThreadDynamic.maxtimers
	.set	client_createThreadDynamic.maxchanends,__builtin_getid.maxchanends $M client_createThreadDynamic.maxchanends $M client_getThreadStatus.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M nodeIndexToId.maxchanends $M printMany.maxchanends $M 0
	.globl	client_createThreadDynamic.maxchanends
.Ltmp3:
	.size	client_createThreadDynamic, .Ltmp3-client_createThreadDynamic

	.globl	client_createThreadRandom
	.align	2
	.type	client_createThreadRandom,@function
	.cc_top client_createThreadRandom.function
client_createThreadRandom:
.Lxtalabel33:
	entsp 8
	stw r4, sp[7]
	stw r5, sp[6]
	stw r6, sp[5]
	stw r7, sp[4]
	stw r8, sp[3]
	stw r9, sp[2]
	mov r6, r2
	mov r5, r1
	mov r4, r0
	sub r9, r3, r6
.Lxta.call_labels21:
	bl get_local_tile_id
	mov r7, r0
	bl __builtin_getid
	mov r8, r0
	ldc r0, 0
.Lxta.call_labels22:
	bl srand
.Lxta.call_labels23:
	bl rand
	remu r0, r0, r9
	add r0, r0, r6
	bl nodeIndexToId
	shl r1, r7, 16
	or r2, r1, r8
	ldc r1, 7938
	or r0, r0, r1
	stw r5, sp[1]
	ldc r1, 6
	mov r3, r4
.Lxta.call_labels24:
	bl nOS_requestAction
	ldw r9, sp[2]
	ldw r8, sp[3]
	ldw r7, sp[4]
	ldw r6, sp[5]
	ldw r5, sp[6]
	ldw r4, sp[7]
	retsp 8
	.cc_bottom client_createThreadRandom.function
	.set	client_createThreadRandom.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M srand.nstackwords $M rand.nstackwords $M nodeIndexToId.nstackwords $M nOS_requestAction.nstackwords) + 8)
	.globl	client_createThreadRandom.nstackwords
	.set	client_createThreadRandom.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M nodeIndexToId.maxcores $M rand.maxcores $M srand.maxcores $M 1
	.globl	client_createThreadRandom.maxcores
	.set	client_createThreadRandom.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M nodeIndexToId.maxtimers $M rand.maxtimers $M srand.maxtimers $M 0
	.globl	client_createThreadRandom.maxtimers
	.set	client_createThreadRandom.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M nodeIndexToId.maxchanends $M rand.maxchanends $M srand.maxchanends $M 0
	.globl	client_createThreadRandom.maxchanends
.Ltmp4:
	.size	client_createThreadRandom, .Ltmp4-client_createThreadRandom

	.globl	client_connectNewLocalChannel
	.align	2
	.type	client_connectNewLocalChannel,@function
	.cc_top client_connectNewLocalChannel.function
client_connectNewLocalChannel:
.Lxtalabel34:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	mov r4, r1
	mov r5, r0
.Lxta.call_labels25:
	bl get_local_tile_id
	shl r0, r0, 16
	ldc r1, 7938
	or r6, r0, r1
	bl __builtin_getid
	shl r0, r0, 16
	or r2, r0, r5
	ldc r0, 0
	stw r0, sp[1]
	mkmsk r1, 1
	mov r0, r6
	mov r3, r4
.Lxta.call_labels26:
	bl nOS_requestAction
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom client_connectNewLocalChannel.function
	.set	client_connectNewLocalChannel.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 5)
	.globl	client_connectNewLocalChannel.nstackwords
	.set	client_connectNewLocalChannel.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_connectNewLocalChannel.maxcores
	.set	client_connectNewLocalChannel.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_connectNewLocalChannel.maxtimers
	.set	client_connectNewLocalChannel.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_connectNewLocalChannel.maxchanends
.Ltmp5:
	.size	client_connectNewLocalChannel, .Ltmp5-client_connectNewLocalChannel

	.globl	client_allocateNewLocalChannel
	.align	2
	.type	client_allocateNewLocalChannel,@function
	.cc_top client_allocateNewLocalChannel.function
client_allocateNewLocalChannel:
.Lxtalabel35:
	entsp 4
	stw r4, sp[3]
	stw r5, sp[2]
	mov r4, r0
.Lxta.call_labels27:
	bl get_local_tile_id
	shl r0, r0, 16
	ldc r1, 7938
	or r5, r0, r1
	bl __builtin_getid
	shl r0, r0, 16
	or r2, r0, r4
	ldc r3, 0
	stw r3, sp[1]
	mov r0, r5
	mov r1, r3
.Lxta.call_labels28:
	bl nOS_requestAction
	ldw r5, sp[2]
	ldw r4, sp[3]
	retsp 4
	.cc_bottom client_allocateNewLocalChannel.function
	.set	client_allocateNewLocalChannel.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 4)
	.globl	client_allocateNewLocalChannel.nstackwords
	.set	client_allocateNewLocalChannel.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_allocateNewLocalChannel.maxcores
	.set	client_allocateNewLocalChannel.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_allocateNewLocalChannel.maxtimers
	.set	client_allocateNewLocalChannel.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_allocateNewLocalChannel.maxchanends
.Ltmp6:
	.size	client_allocateNewLocalChannel, .Ltmp6-client_allocateNewLocalChannel

	.globl	client_getLocalChannelDest
	.align	2
	.type	client_getLocalChannelDest,@function
	.cc_top client_getLocalChannelDest.function
client_getLocalChannelDest:
.Lxtalabel36:
	entsp 4
	stw r4, sp[3]
	stw r5, sp[2]
	mov r4, r0
.Lxta.call_labels29:
	bl get_local_tile_id
	shl r0, r0, 16
	ldc r1, 7938
	or r5, r0, r1
	bl __builtin_getid
	shl r0, r0, 16
	or r2, r0, r4
	ldc r3, 0
	stw r3, sp[1]
	ldc r1, 2
	mov r0, r5
.Lxta.call_labels30:
	bl nOS_requestAction
	ldw r5, sp[2]
	ldw r4, sp[3]
	retsp 4
	.cc_bottom client_getLocalChannelDest.function
	.set	client_getLocalChannelDest.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 4)
	.globl	client_getLocalChannelDest.nstackwords
	.set	client_getLocalChannelDest.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_getLocalChannelDest.maxcores
	.set	client_getLocalChannelDest.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_getLocalChannelDest.maxtimers
	.set	client_getLocalChannelDest.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_getLocalChannelDest.maxchanends
.Ltmp7:
	.size	client_getLocalChannelDest, .Ltmp7-client_getLocalChannelDest

	.globl	client_updateLocalChannelDest
	.align	2
	.type	client_updateLocalChannelDest,@function
	.cc_top client_updateLocalChannelDest.function
client_updateLocalChannelDest:
.Lxtalabel37:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	mov r4, r1
	mov r5, r0
.Lxta.call_labels31:
	bl get_local_tile_id
	shl r0, r0, 16
	ldc r1, 7938
	or r6, r0, r1
	bl __builtin_getid
	shl r0, r0, 16
	or r2, r0, r5
	ldc r0, 0
	stw r0, sp[1]
	mkmsk r1, 2
	mov r0, r6
	mov r3, r4
.Lxta.call_labels32:
	bl nOS_requestAction
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom client_updateLocalChannelDest.function
	.set	client_updateLocalChannelDest.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 5)
	.globl	client_updateLocalChannelDest.nstackwords
	.set	client_updateLocalChannelDest.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_updateLocalChannelDest.maxcores
	.set	client_updateLocalChannelDest.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_updateLocalChannelDest.maxtimers
	.set	client_updateLocalChannelDest.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_updateLocalChannelDest.maxchanends
.Ltmp8:
	.size	client_updateLocalChannelDest, .Ltmp8-client_updateLocalChannelDest

	.globl	client_releaseLocalChannel
	.align	2
	.type	client_releaseLocalChannel,@function
	.cc_top client_releaseLocalChannel.function
client_releaseLocalChannel:
.Lxtalabel38:
	entsp 4
	stw r4, sp[3]
	stw r5, sp[2]
	mov r4, r0
.Lxta.call_labels33:
	bl get_local_tile_id
	shl r0, r0, 16
	ldc r1, 7938
	or r5, r0, r1
	bl __builtin_getid
	shl r0, r0, 16
	or r2, r0, r4
	ldc r3, 0
	stw r3, sp[1]
	ldc r1, 4
	mov r0, r5
.Lxta.call_labels34:
	bl nOS_requestAction
	ldw r5, sp[2]
	ldw r4, sp[3]
	retsp 4
	.cc_bottom client_releaseLocalChannel.function
	.set	client_releaseLocalChannel.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 4)
	.globl	client_releaseLocalChannel.nstackwords
	.set	client_releaseLocalChannel.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_releaseLocalChannel.maxcores
	.set	client_releaseLocalChannel.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_releaseLocalChannel.maxtimers
	.set	client_releaseLocalChannel.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_releaseLocalChannel.maxchanends
.Ltmp9:
	.size	client_releaseLocalChannel, .Ltmp9-client_releaseLocalChannel

	.globl	client_lookupLocalChanend
	.align	2
	.type	client_lookupLocalChanend,@function
	.cc_top client_lookupLocalChanend.function
client_lookupLocalChanend:
.Lxtalabel39:
	entsp 4
	stw r4, sp[3]
	stw r5, sp[2]
	mov r4, r0
.Lxta.call_labels35:
	bl get_local_tile_id
	shl r0, r0, 16
	ldc r1, 7938
	or r5, r0, r1
	bl __builtin_getid
	shl r0, r0, 16
	or r2, r0, r4
	ldc r3, 0
	stw r3, sp[1]
	ldc r1, 5
	mov r0, r5
.Lxta.call_labels36:
	bl nOS_requestAction
	ldw r5, sp[2]
	ldw r4, sp[3]
	retsp 4
	.cc_bottom client_lookupLocalChanend.function
	.set	client_lookupLocalChanend.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 4)
	.globl	client_lookupLocalChanend.nstackwords
	.set	client_lookupLocalChanend.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_lookupLocalChanend.maxcores
	.set	client_lookupLocalChanend.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_lookupLocalChanend.maxtimers
	.set	client_lookupLocalChanend.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_lookupLocalChanend.maxchanends
.Ltmp10:
	.size	client_lookupLocalChanend, .Ltmp10-client_lookupLocalChanend

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI11_0.data
	.align	4
.LCPI11_0:
	.long	4294901760
	.cc_bottom .LCPI11_0.data
	.text
	.globl	client_lookupParentChanend
	.align	2
	.type	client_lookupParentChanend,@function
	.cc_top client_lookupParentChanend.function
client_lookupParentChanend:
.Lxtalabel40:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	mov r4, r1
	mov r5, r0
	ldw r0, cp[.LCPI11_0]
	and r6, r5, r0
.Lxta.call_labels37:
	bl get_local_tile_id
	bl __builtin_getid
	ldc r0, 7938
	or r0, r6, r0
	shl r1, r5, 16
	zext r4, 16
	or r2, r4, r1
	ldc r3, 0
	stw r3, sp[1]
	ldc r1, 5
.Lxta.call_labels38:
	bl nOS_requestAction
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom client_lookupParentChanend.function
	.set	client_lookupParentChanend.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nOS_requestAction.nstackwords) + 5)
	.globl	client_lookupParentChanend.nstackwords
	.set	client_lookupParentChanend.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M 1
	.globl	client_lookupParentChanend.maxcores
	.set	client_lookupParentChanend.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M 0
	.globl	client_lookupParentChanend.maxtimers
	.set	client_lookupParentChanend.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M 0
	.globl	client_lookupParentChanend.maxchanends
.Ltmp11:
	.size	client_lookupParentChanend, .Ltmp11-client_lookupParentChanend

	.globl	client_lookupSpecificChanend
	.align	2
	.type	client_lookupSpecificChanend,@function
	.cc_top client_lookupSpecificChanend.function
client_lookupSpecificChanend:
.Lxtalabel41:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	mov r4, r2
	mov r6, r1
.Lxta.call_labels39:
	bl nodeIndexToId
	ldc r1, 7938
	or r5, r0, r1
	shl r0, r6, 16
	or r4, r0, r4
.Lxta.call_labels40:
	bl get_local_tile_id
	ldc r3, 0
	stw r3, sp[1]
	ldc r1, 5
	mov r0, r5
	mov r2, r4
.Lxta.call_labels41:
	bl nOS_requestAction
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom client_lookupSpecificChanend.function
	.set	client_lookupSpecificChanend.nstackwords,((nodeIndexToId.nstackwords $M get_local_tile_id.nstackwords $M nOS_requestAction.nstackwords) + 5)
	.globl	client_lookupSpecificChanend.nstackwords
	.set	client_lookupSpecificChanend.maxcores,get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M nodeIndexToId.maxcores $M 1
	.globl	client_lookupSpecificChanend.maxcores
	.set	client_lookupSpecificChanend.maxtimers,get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M nodeIndexToId.maxtimers $M 0
	.globl	client_lookupSpecificChanend.maxtimers
	.set	client_lookupSpecificChanend.maxchanends,get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M nodeIndexToId.maxchanends $M 0
	.globl	client_lookupSpecificChanend.maxchanends
.Ltmp12:
	.size	client_lookupSpecificChanend, .Ltmp12-client_lookupSpecificChanend

	.globl	client_getThreadStatus
	.align	2
	.type	client_getThreadStatus,@function
	.cc_top client_getThreadStatus.function
client_getThreadStatus:
.Lxtalabel42:
	entsp 4
	stw r4, sp[3]
	stw r5, sp[2]
	mov r5, r0
.Lxta.call_labels42:
	bl get_local_tile_id
	shl r4, r0, 16
	bl __builtin_getid
	or r4, r4, r0
	mov r0, r5
	bl nodeIndexToId
	ldc r1, 7938
	or r0, r0, r1
	ldc r3, 0
	stw r3, sp[1]
	mkmsk r1, 3
	mov r2, r4
.Lxta.call_labels43:
	bl nOS_requestAction
	ldw r5, sp[2]
	ldw r4, sp[3]
	retsp 4
	.cc_bottom client_getThreadStatus.function
	.set	client_getThreadStatus.nstackwords,((get_local_tile_id.nstackwords $M __builtin_getid.nstackwords $M nodeIndexToId.nstackwords $M nOS_requestAction.nstackwords) + 4)
	.globl	client_getThreadStatus.nstackwords
	.set	client_getThreadStatus.maxcores,__builtin_getid.maxcores $M get_local_tile_id.maxcores $M nOS_requestAction.maxcores $M nodeIndexToId.maxcores $M 1
	.globl	client_getThreadStatus.maxcores
	.set	client_getThreadStatus.maxtimers,__builtin_getid.maxtimers $M get_local_tile_id.maxtimers $M nOS_requestAction.maxtimers $M nodeIndexToId.maxtimers $M 0
	.globl	client_getThreadStatus.maxtimers
	.set	client_getThreadStatus.maxchanends,__builtin_getid.maxchanends $M get_local_tile_id.maxchanends $M nOS_requestAction.maxchanends $M nodeIndexToId.maxchanends $M 0
	.globl	client_getThreadStatus.maxchanends
.Ltmp13:
	.size	client_getThreadStatus, .Ltmp13-client_getThreadStatus

	.globl	get_address_p1
	.align	2
	.type	get_address_p1,@function
	.cc_top get_address_p1.function
get_address_p1:
.Lxtalabel43:
	retsp 0
	.cc_bottom get_address_p1.function
	.set	get_address_p1.nstackwords,0
	.globl	get_address_p1.nstackwords
	.set	get_address_p1.maxcores,1
	.globl	get_address_p1.maxcores
	.set	get_address_p1.maxtimers,0
	.globl	get_address_p1.maxtimers
	.set	get_address_p1.maxchanends,0
	.globl	get_address_p1.maxchanends
.Ltmp14:
	.size	get_address_p1, .Ltmp14-get_address_p1

	.globl	get_address_begin1
	.align	2
	.type	get_address_begin1,@function
	.cc_top get_address_begin1.function
get_address_begin1:
.Lxtalabel44:
	retsp 0
	.cc_bottom get_address_begin1.function
	.set	get_address_begin1.nstackwords,0
	.globl	get_address_begin1.nstackwords
	.set	get_address_begin1.maxcores,1
	.globl	get_address_begin1.maxcores
	.set	get_address_begin1.maxtimers,0
	.globl	get_address_begin1.maxtimers
	.set	get_address_begin1.maxchanends,0
	.globl	get_address_begin1.maxchanends
.Ltmp15:
	.size	get_address_begin1, .Ltmp15-get_address_begin1


	.typestring get_local_tile_id, "f{ui}()"
	.typestring __builtin_getid, "f{si}()"
	.typestring rand, "f{si}()"
	.typestring srand, "f{0}(ui)"
	.typestring nodeIndexToId, "f{ui}(ui)"
	.typestring channelSendWord, "f{0}(ui,ui)"
	.typestring printMany, "f{0}(ui,&(a(:ui)))"
	.typestring nOS_requestAction, "f{ui}(ui,ui,ui,ui,ui)"
	.typestring p1, "f{0}(chd)"
	.typestring child1, "f{0}(ui)"
	.typestring client_createThread, "f{ui}(ui,ui,ui,ui)"
	.typestring client_createThreadDynamic, "f{ui}(ui,ui,ui,ui,ui)"
	.typestring client_createThreadRandom, "f{ui}(ui,ui,ui,ui)"
	.typestring client_connectNewLocalChannel, "f{ui}(ui,ui)"
	.typestring client_allocateNewLocalChannel, "f{ui}(ui)"
	.typestring client_getLocalChannelDest, "f{ui}(ui)"
	.typestring client_updateLocalChannelDest, "f{0}(ui,ui)"
	.typestring client_releaseLocalChannel, "f{0}(ui)"
	.typestring client_lookupLocalChanend, "f{ui}(ui)"
	.typestring client_lookupParentChanend, "f{ui}(ui,ui)"
	.typestring client_lookupSpecificChanend, "f{ui}(ui,ui,ui)"
	.typestring client_getThreadStatus, "f{ui}(ui)"
	.typestring get_address_p1, "f{ui}()"
	.typestring get_address_begin1, "f{ui}()"
	.typestring sw_nrows, "ui"
	.typestring sw_ncols, "ui"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels4
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	20
	.long	.Lxta.call_labels4
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels5
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	51
	.long	.Lxta.call_labels5
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels6
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	54
	.long	.Lxta.call_labels6
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels7
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	55
	.long	.Lxta.call_labels7
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels8
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	58
	.long	.Lxta.call_labels8
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels9
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	72
	.long	.Lxta.call_labels9
.cc_bottom cc_5
.cc_top cc_6,.Lxta.call_labels11
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	76
	.long	.Lxta.call_labels11
.cc_bottom cc_6
.cc_top cc_7,.Lxta.call_labels12
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	81
	.long	.Lxta.call_labels12
.cc_bottom cc_7
.cc_top cc_8,.Lxta.call_labels13
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	87
	.long	.Lxta.call_labels13
.cc_bottom cc_8
.cc_top cc_9,.Lxta.call_labels14
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	91
	.long	.Lxta.call_labels14
.cc_bottom cc_9
.cc_top cc_10,.Lxta.call_labels15
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	96
	.long	.Lxta.call_labels15
.cc_bottom cc_10
.cc_top cc_11,.Lxta.call_labels10
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	100
	.long	.Lxta.call_labels10
.cc_bottom cc_11
.cc_top cc_12,.Lxta.call_labels16
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	105
	.long	.Lxta.call_labels16
.cc_bottom cc_12
.cc_top cc_13,.Lxta.call_labels17
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	111
	.long	.Lxta.call_labels17
.cc_bottom cc_13
.cc_top cc_14,.Lxta.call_labels18
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	115
	.long	.Lxta.call_labels18
.cc_bottom cc_14
.cc_top cc_15,.Lxta.call_labels19
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	157
	.long	.Lxta.call_labels19
.cc_bottom cc_15
.cc_top cc_16,.Lxta.call_labels20
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	158
	.long	.Lxta.call_labels20
.cc_bottom cc_16
.cc_top cc_17,.Lxta.call_labels21
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	164
	.long	.Lxta.call_labels21
.cc_bottom cc_17
.cc_top cc_18,.Lxta.call_labels22
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	170
	.long	.Lxta.call_labels22
.cc_bottom cc_18
.cc_top cc_19,.Lxta.call_labels23
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	172
	.long	.Lxta.call_labels23
.cc_bottom cc_19
.cc_top cc_20,.Lxta.call_labels24
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	174
	.long	.Lxta.call_labels24
.cc_bottom cc_20
.cc_top cc_21,.Lxta.call_labels2
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	180
	.long	.Lxta.call_labels2
.cc_bottom cc_21
.cc_top cc_22,.Lxta.call_labels3
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	188
	.long	.Lxta.call_labels3
.cc_bottom cc_22
.cc_top cc_23,.Lxta.call_labels25
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	226
	.long	.Lxta.call_labels25
.cc_bottom cc_23
.cc_top cc_24,.Lxta.call_labels26
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	234
	.long	.Lxta.call_labels26
.cc_bottom cc_24
.cc_top cc_25,.Lxta.call_labels27
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	239
	.long	.Lxta.call_labels27
.cc_bottom cc_25
.cc_top cc_26,.Lxta.call_labels28
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	247
	.long	.Lxta.call_labels28
.cc_bottom cc_26
.cc_top cc_27,.Lxta.call_labels29
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	252
	.long	.Lxta.call_labels29
.cc_bottom cc_27
.cc_top cc_28,.Lxta.call_labels30
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	260
	.long	.Lxta.call_labels30
.cc_bottom cc_28
.cc_top cc_29,.Lxta.call_labels31
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	265
	.long	.Lxta.call_labels31
.cc_bottom cc_29
.cc_top cc_30,.Lxta.call_labels32
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	273
	.long	.Lxta.call_labels32
.cc_bottom cc_30
.cc_top cc_31,.Lxta.call_labels33
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	279
	.long	.Lxta.call_labels33
.cc_bottom cc_31
.cc_top cc_32,.Lxta.call_labels34
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	287
	.long	.Lxta.call_labels34
.cc_bottom cc_32
.cc_top cc_33,.Lxta.call_labels35
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	292
	.long	.Lxta.call_labels35
.cc_bottom cc_33
.cc_top cc_34,.Lxta.call_labels36
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	300
	.long	.Lxta.call_labels36
.cc_bottom cc_34
.cc_top cc_35,.Lxta.call_labels37
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	308
	.long	.Lxta.call_labels37
.cc_bottom cc_35
.cc_top cc_36,.Lxta.call_labels38
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	317
	.long	.Lxta.call_labels38
.cc_bottom cc_36
.cc_top cc_37,.Lxta.call_labels39
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	324
	.long	.Lxta.call_labels39
.cc_bottom cc_37
.cc_top cc_38,.Lxta.call_labels40
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	327
	.long	.Lxta.call_labels40
.cc_bottom cc_38
.cc_top cc_39,.Lxta.call_labels41
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	337
	.long	.Lxta.call_labels41
.cc_bottom cc_39
.cc_top cc_40,.Lxta.call_labels42
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	345
	.long	.Lxta.call_labels42
.cc_bottom cc_40
.cc_top cc_41,.Lxta.call_labels43
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	350
	.long	.Lxta.call_labels43
.cc_bottom cc_41
.cc_top cc_42,.Lxta.call_labels0
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	381
	.long	.Lxta.call_labels0
.cc_bottom cc_42
.cc_top cc_43,.Lxta.call_labels1
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	398
	.long	.Lxta.call_labels1
.cc_bottom cc_43
.Lentries_end1:
	.section	.xtaendpointtable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_44,.Lxta.endpoint_labels0
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	373
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_44
.Lentries_end3:
	.section	.xtalabeltable,"",@progbits
.Lentries_start4:
	.long	.Lentries_end5-.Lentries_start4
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_45,.Lxtalabel3
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	19
	.long	38
	.long	.Lxtalabel3
.cc_bottom cc_45
.cc_top cc_46,.Lxtalabel6
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	39
	.long	43
	.long	.Lxtalabel6
.cc_bottom cc_46
.cc_top cc_47,.Lxtalabel4
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	44
	.long	51
	.long	.Lxtalabel4
.cc_bottom cc_47
.cc_top cc_48,.Lxtalabel6
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	44
	.long	51
	.long	.Lxtalabel6
.cc_bottom cc_48
.cc_top cc_49,.Lxtalabel7
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	52
	.long	56
	.long	.Lxtalabel7
.cc_bottom cc_49
.cc_top cc_50,.Lxtalabel4
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	57
	.long	58
	.long	.Lxtalabel4
.cc_bottom cc_50
.cc_top cc_51,.Lxtalabel6
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	57
	.long	58
	.long	.Lxtalabel6
.cc_bottom cc_51
.cc_top cc_52,.Lxtalabel8
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	59
	.long	61
	.long	.Lxtalabel8
.cc_bottom cc_52
.cc_top cc_53,.Lxtalabel5
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	62
	.long	63
	.long	.Lxtalabel5
.cc_bottom cc_53
.cc_top cc_54,.Lxtalabel5
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	62
	.long	63
	.long	.Lxtalabel5
.cc_bottom cc_54
.cc_top cc_55,.Lxtalabel5
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	62
	.long	63
	.long	.Lxtalabel5
.cc_bottom cc_55
.cc_top cc_56,.Lxtalabel5
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	64
	.long	67
	.long	.Lxtalabel5
.cc_bottom cc_56
.cc_top cc_57,.Lxtalabel10
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	68
	.long	70
	.long	.Lxtalabel10
.cc_bottom cc_57
.cc_top cc_58,.Lxtalabel9
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	68
	.long	70
	.long	.Lxtalabel9
.cc_bottom cc_58
.cc_top cc_59,.Lxtalabel11
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	71
	.long	74
	.long	.Lxtalabel11
.cc_bottom cc_59
.cc_top cc_60,.Lxtalabel21
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	75
	.long	78
	.long	.Lxtalabel21
.cc_bottom cc_60
.cc_top cc_61,.Lxtalabel12
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	79
	.long	79
	.long	.Lxtalabel12
.cc_bottom cc_61
.cc_top cc_62,.Lxtalabel22
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	80
	.long	83
	.long	.Lxtalabel22
.cc_bottom cc_62
.cc_top cc_63,.Lxtalabel23
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	86
	.long	94
	.long	.Lxtalabel23
.cc_bottom cc_63
.cc_top cc_64,.Lxtalabel24
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	95
	.long	98
	.long	.Lxtalabel24
.cc_bottom cc_64
.cc_top cc_65,.Lxtalabel20
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	99
	.long	102
	.long	.Lxtalabel20
.cc_bottom cc_65
.cc_top cc_66,.Lxtalabel25
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	103
	.long	103
	.long	.Lxtalabel25
.cc_bottom cc_66
.cc_top cc_67,.Lxtalabel26
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	104
	.long	107
	.long	.Lxtalabel26
.cc_bottom cc_67
.cc_top cc_68,.Lxtalabel27
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	110
	.long	119
	.long	.Lxtalabel27
.cc_bottom cc_68
.cc_top cc_69,.Lxtalabel10
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	120
	.long	123
	.long	.Lxtalabel10
.cc_bottom cc_69
.cc_top cc_70,.Lxtalabel9
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	120
	.long	123
	.long	.Lxtalabel9
.cc_bottom cc_70
.cc_top cc_71,.Lxtalabel13
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	124
	.long	124
	.long	.Lxtalabel13
.cc_bottom cc_71
.cc_top cc_72,.Lxtalabel14
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	128
	.long	128
	.long	.Lxtalabel14
.cc_bottom cc_72
.cc_top cc_73,.Lxtalabel15
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	128
	.long	128
	.long	.Lxtalabel15
.cc_bottom cc_73
.cc_top cc_74,.Lxtalabel16
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	128
	.long	128
	.long	.Lxtalabel16
.cc_bottom cc_74
.cc_top cc_75,.Lxtalabel17
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	128
	.long	128
	.long	.Lxtalabel17
.cc_bottom cc_75
.cc_top cc_76,.Lxtalabel18
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	129
	.long	130
	.long	.Lxtalabel18
.cc_bottom cc_76
.cc_top cc_77,.Lxtalabel19
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	131
	.long	131
	.long	.Lxtalabel19
.cc_bottom cc_77
.cc_top cc_78,.Lxtalabel28
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	132
	.long	132
	.long	.Lxtalabel28
.cc_bottom cc_78
.cc_top cc_79,.Lxtalabel29
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	133
	.long	135
	.long	.Lxtalabel29
.cc_bottom cc_79
.cc_top cc_80,.Lxtalabel30
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	136
	.long	139
	.long	.Lxtalabel30
.cc_bottom cc_80
.cc_top cc_81,.Lxtalabel19
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	141
	.long	143
	.long	.Lxtalabel19
.cc_bottom cc_81
.cc_top cc_82,.Lxtalabel19
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	144
	.long	144
	.long	.Lxtalabel19
.cc_bottom cc_82
.cc_top cc_83,.Lxtalabel31
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	145
	.long	146
	.long	.Lxtalabel31
.cc_bottom cc_83
.cc_top cc_84,.Lxtalabel31
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	147
	.long	149
	.long	.Lxtalabel31
.cc_bottom cc_84
.cc_top cc_85,.Lxtalabel31
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	150
	.long	151
	.long	.Lxtalabel31
.cc_bottom cc_85
.cc_top cc_86,.Lxtalabel19
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	153
	.long	154
	.long	.Lxtalabel19
.cc_bottom cc_86
.cc_top cc_87,.Lxtalabel32
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	155
	.long	160
	.long	.Lxtalabel32
.cc_bottom cc_87
.cc_top cc_88,.Lxtalabel33
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	163
	.long	176
	.long	.Lxtalabel33
.cc_bottom cc_88
.cc_top cc_89,.Lxtalabel2
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	179
	.long	189
	.long	.Lxtalabel2
.cc_bottom cc_89
.cc_top cc_90,.Lxtalabel2
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	221
	.long	221
	.long	.Lxtalabel2
.cc_bottom cc_90
.cc_top cc_91,.Lxtalabel34
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	225
	.long	235
	.long	.Lxtalabel34
.cc_bottom cc_91
.cc_top cc_92,.Lxtalabel35
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	238
	.long	248
	.long	.Lxtalabel35
.cc_bottom cc_92
.cc_top cc_93,.Lxtalabel36
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	251
	.long	261
	.long	.Lxtalabel36
.cc_bottom cc_93
.cc_top cc_94,.Lxtalabel37
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	264
	.long	274
	.long	.Lxtalabel37
.cc_bottom cc_94
.cc_top cc_95,.Lxtalabel38
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	278
	.long	288
	.long	.Lxtalabel38
.cc_bottom cc_95
.cc_top cc_96,.Lxtalabel39
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	291
	.long	301
	.long	.Lxtalabel39
.cc_bottom cc_96
.cc_top cc_97,.Lxtalabel40
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	305
	.long	318
	.long	.Lxtalabel40
.cc_bottom cc_97
.cc_top cc_98,.Lxtalabel41
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	320
	.long	338
	.long	.Lxtalabel41
.cc_bottom cc_98
.cc_top cc_99,.Lxtalabel42
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	344
	.long	351
	.long	.Lxtalabel42
.cc_bottom cc_99
.cc_top cc_100,.Lxtalabel43
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	355
	.long	359
	.long	.Lxtalabel43
.cc_bottom cc_100
.cc_top cc_101,.Lxtalabel44
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	362
	.long	366
	.long	.Lxtalabel44
.cc_bottom cc_101
.cc_top cc_102,.Lxtalabel0
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	369
	.long	383
	.long	.Lxtalabel0
.cc_bottom cc_102
.cc_top cc_103,.Lxtalabel1
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	387
	.long	401
	.long	.Lxtalabel1
.cc_bottom cc_103
.Lentries_end5:
	.section	.xtalooplabeltable,"",@progbits
.Lentries_start6:
	.long	.Lentries_end7-.Lentries_start6
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_104,.Lxta.loop_labels0
	.ascii	 "Swallow-nOS_client.xc"
	.byte	0
	.long	124
	.long	128
	.long	.Lxta.loop_labels0
.cc_bottom cc_104
.Lentries_end7:
