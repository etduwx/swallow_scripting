	.file	"Swallow-helpers.xc"

	.globread nodeIndexToId,sw_ncols,"Swallow-helpers.xc:73: error: previously used here"
	.globread rowColToNodeId,sw_ncols,"Swallow-helpers.xc:39: error: previously used here"
	.call SwPrintString,stringToChars
	.call SwPrintString,coreSendBytes
	.call SwPrintUnsigned,coreSendWords
	.call coreSendBytes,startTransactionClient
	.call coreSendBytes,endTransactionClient
	.call coreReceiveWords,startTransactionServer
	.call coreReceiveWords,endTransactionServer
	.call coreSendWords,startTransactionClient
	.call coreSendWords,endTransactionClient
	.call getSpecificLocalChannel,get_local_tile_id
	.call buildChanId,nodeIndexToId
	.call printMany,startnOSBurstClient
	.call printMany,endnOSBurstClient
	.set rowColToNodeId.locnoside, 1
	.set nodeIndexToId.locnoside, 1
	.set buildChanId.locnoside, 1
	.set getNewChannel.locnoside, 1
	.set connectChannel.locnoside, 1
	.set channelListen.locnoside, 1
	.set channelSendWord.locnoside, 1
	.set channelReceiveWord.locnoside, 1
	.set getSpecificLocalChannel.locnoside, 1
	.set rowColToNodeId.locnochandec, 1
	.set printMany.locnochandec, 1
	.set nodeIndexToId.locnochandec, 1
	.set buildChanId.locnochandec, 1
	.set getNewChannel.locnochandec, 1
	.set connectChanend.locnochandec, 1
	.set connectChannel.locnochandec, 1
	.set freeChanend_sjh.locnochandec, 1
	.set chanendListen.locnochandec, 1
	.set channelListen.locnochandec, 1
	.set channelSendWord.locnochandec, 1
	.set channelReceiveWord.locnochandec, 1
	.set getSpecificLocalChannel.locnochandec, 1
	.set coreSendWords.locnochandec, 1
	.set coreReceiveWords.locnochandec, 1
	.set coreSendBytes.locnochandec, 1
	.set SwPrintUnsigned.locnochandec, 1
	.set stringToChars.locnochandec, 1
	.set SwPrintString.locnochandec, 1


	.text
	.globl	nodeIndexToId
	.align	2
	.type	nodeIndexToId,@function
	.cc_top nodeIndexToId.function
nodeIndexToId:
.Lxtalabel0:
	zext r0, 16
	ldw r1, dp[sw_ncols]
	remu r2, r0, r1
	ldc r3, 17
	shl r2, r2, r3
	divu r0, r0, r1
	shl r0, r0, 24
	or r0, r2, r0
	retsp 0
	.cc_bottom nodeIndexToId.function
	.set	nodeIndexToId.nstackwords,0
	.globl	nodeIndexToId.nstackwords
	.set	nodeIndexToId.maxcores,1
	.globl	nodeIndexToId.maxcores
	.set	nodeIndexToId.maxtimers,0
	.globl	nodeIndexToId.maxtimers
	.set	nodeIndexToId.maxchanends,0
	.globl	nodeIndexToId.maxchanends
.Ltmp0:
	.size	nodeIndexToId, .Ltmp0-nodeIndexToId

	.globl	buildChanId
	.align	2
	.type	buildChanId,@function
	.cc_top buildChanId.function
buildChanId:
.Lxtalabel1:
	zext r0, 16
	ldw r3, dp[sw_ncols]
	remu r2, r0, r3
	ldc r11, 17
	shl r2, r2, r11
	divu r0, r0, r3
	shl r0, r0, 24
	shl r1, r1, 8
	or r0, r1, r0
	or r0, r0, r2
	ldc r1, 2
	or r0, r0, r1
	retsp 0
	.cc_bottom buildChanId.function
	.set	buildChanId.nstackwords,0
	.globl	buildChanId.nstackwords
	.set	buildChanId.maxcores,1
	.globl	buildChanId.maxcores
	.set	buildChanId.maxtimers,0
	.globl	buildChanId.maxtimers
	.set	buildChanId.maxchanends,0
	.globl	buildChanId.maxchanends
.Ltmp1:
	.size	buildChanId, .Ltmp1-buildChanId

	.globl	getNewChannel
	.align	2
	.type	getNewChannel,@function
	.cc_top getNewChannel.function
getNewChannel:
.Lxtalabel2:
	#APP
	getr r0, 0x2
	#NO_APP
	retsp 0
	.cc_bottom getNewChannel.function
	.set	getNewChannel.nstackwords,0
	.globl	getNewChannel.nstackwords
	.set	getNewChannel.maxcores,1
	.globl	getNewChannel.maxcores
	.set	getNewChannel.maxtimers,0
	.globl	getNewChannel.maxtimers
	.set	getNewChannel.maxchanends,0
	.globl	getNewChannel.maxchanends
.Ltmp2:
	.size	getNewChannel, .Ltmp2-getNewChannel

	.globl	connectChannel
	.align	2
	.type	connectChannel,@function
	.cc_top connectChannel.function
connectChannel:
.Lxtalabel3:
	#APP
	setd res[r0], r1
	#NO_APP
	#APP
	out res[r0], r0
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	#APP
	chkct res[r0], 0x1
	#NO_APP
	retsp 0
	.cc_bottom connectChannel.function
	.set	connectChannel.nstackwords,0
	.globl	connectChannel.nstackwords
	.set	connectChannel.maxcores,1
	.globl	connectChannel.maxcores
	.set	connectChannel.maxtimers,0
	.globl	connectChannel.maxtimers
	.set	connectChannel.maxchanends,0
	.globl	connectChannel.maxchanends
.Ltmp3:
	.size	connectChannel, .Ltmp3-connectChannel

	.globl	getSpecificLocalChannel
	.align	2
	.type	getSpecificLocalChannel,@function
	.cc_top getSpecificLocalChannel.function
getSpecificLocalChannel:
.Lxtalabel4:
	entsp 35
	stw r4, sp[34]
	stw r5, sp[33]
	shl r4, r0, 8
.Lxta.call_labels0:
	bl get_local_tile_id
	shl r0, r0, 16
	or r0, r4, r0
	ldc r1, 2
	or r11, r0, r1
	ldc r0, 0
	mkmsk r2, 5
	ldaw r3, sp[1]
.LBB4_1:
.Lxtalabel5:
	mov r4, r0
	lsu r5, r2, r4
	#APP
	getr r0, 0x2
mov r1,r0

	#NO_APP
	ecallt r5
	stw r1, r3[r4]
	eq r5, r1, r11
.Lxta.loop_labels0:
	# LOOPMARKER 0
	add r0, r4, 1
	bf r5, .LBB4_1
.Lxtalabel6:
	sub r0, r4, 1
	ashr r11, r0, 32
	bt r11, .LBB4_4
.LBB4_3:
.Lxtalabel7:
	lsu r11, r2, r0
	ecallt r11
	ldw r11, r3[r0]
	#APP
	freer res[r11]
	#NO_APP
.Lxta.loop_labels1:
	# LOOPMARKER 1
	sub r0, r0, 1
	ashr r11, r0, 32
	bf r11, .LBB4_3
.LBB4_4:
.Lxtalabel8:
	mov r0, r1
	ldw r5, sp[33]
	ldw r4, sp[34]
	retsp 35
	.cc_bottom getSpecificLocalChannel.function
	.set	getSpecificLocalChannel.nstackwords,(get_local_tile_id.nstackwords + 35)
	.globl	getSpecificLocalChannel.nstackwords
	.set	getSpecificLocalChannel.maxcores,get_local_tile_id.maxcores $M 1
	.globl	getSpecificLocalChannel.maxcores
	.set	getSpecificLocalChannel.maxtimers,get_local_tile_id.maxtimers $M 0
	.globl	getSpecificLocalChannel.maxtimers
	.set	getSpecificLocalChannel.maxchanends,get_local_tile_id.maxchanends $M 0
	.globl	getSpecificLocalChannel.maxchanends
.Ltmp4:
	.size	getSpecificLocalChannel, .Ltmp4-getSpecificLocalChannel

	.globl	channelListen
	.align	2
	.type	channelListen,@function
	.cc_top channelListen.function
channelListen:
.Lxtalabel9:
	#APP
	in r1, res[r0]
	#NO_APP
	#APP
	setd res[r0], r1
	#NO_APP
	#APP
	chkct res[r0], 0x1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	mov r0, r1
	retsp 0
	.cc_bottom channelListen.function
	.set	channelListen.nstackwords,0
	.globl	channelListen.nstackwords
	.set	channelListen.maxcores,1
	.globl	channelListen.maxcores
	.set	channelListen.maxtimers,0
	.globl	channelListen.maxtimers
	.set	channelListen.maxchanends,0
	.globl	channelListen.maxchanends
.Ltmp5:
	.size	channelListen, .Ltmp5-channelListen

	.globl	channelSendWord
	.align	2
	.type	channelSendWord,@function
	.cc_top channelSendWord.function
channelSendWord:
.Lxtalabel10:
	#APP
	outct res[r0], 0x1
	#NO_APP
	#APP
	chkct res[r0], 0x1
	#NO_APP
	#APP
	out res[r0], r1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	#APP
	chkct res[r0], 0x1
	#NO_APP
	retsp 0
	.cc_bottom channelSendWord.function
	.set	channelSendWord.nstackwords,0
	.globl	channelSendWord.nstackwords
	.set	channelSendWord.maxcores,1
	.globl	channelSendWord.maxcores
	.set	channelSendWord.maxtimers,0
	.globl	channelSendWord.maxtimers
	.set	channelSendWord.maxchanends,0
	.globl	channelSendWord.maxchanends
.Ltmp6:
	.size	channelSendWord, .Ltmp6-channelSendWord

	.globl	channelReceiveWord
	.align	2
	.type	channelReceiveWord,@function
	.cc_top channelReceiveWord.function
channelReceiveWord:
.Lxtalabel11:
	#APP
	chkct res[r0], 0x1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	#APP
	in r1, res[r0] ; chkct res[r0], 0x1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	mov r0, r1
	retsp 0
	.cc_bottom channelReceiveWord.function
	.set	channelReceiveWord.nstackwords,0
	.globl	channelReceiveWord.nstackwords
	.set	channelReceiveWord.maxcores,1
	.globl	channelReceiveWord.maxcores
	.set	channelReceiveWord.maxtimers,0
	.globl	channelReceiveWord.maxtimers
	.set	channelReceiveWord.maxchanends,0
	.globl	channelReceiveWord.maxchanends
.Ltmp7:
	.size	channelReceiveWord, .Ltmp7-channelReceiveWord

	.globl	rowColToNodeId
	.align	2
	.type	rowColToNodeId,@function
	.cc_top rowColToNodeId.function
rowColToNodeId:
.Lxtalabel12:
	ldc r3, 20
	mul r0, r0, r3
	add r0, r0, r2
	lda16 r0, r0[r1]
	zext r0, 16
	ldw r1, dp[sw_ncols]
	remu r2, r0, r1
	ldc r3, 17
	shl r2, r2, r3
	divu r0, r0, r1
	shl r0, r0, 24
	or r0, r2, r0
	shr r0, r0, 16
	retsp 0
	.cc_bottom rowColToNodeId.function
	.set	rowColToNodeId.nstackwords,0
	.globl	rowColToNodeId.nstackwords
	.set	rowColToNodeId.maxcores,1
	.globl	rowColToNodeId.maxcores
	.set	rowColToNodeId.maxtimers,0
	.globl	rowColToNodeId.maxtimers
	.set	rowColToNodeId.maxchanends,0
	.globl	rowColToNodeId.maxchanends
.Ltmp8:
	.size	rowColToNodeId, .Ltmp8-rowColToNodeId

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI9_0.data
	.align	4
.LCPI9_0:
	.long	2147550466
	.cc_bottom .LCPI9_0.data
	.text
	.globl	printMany
	.align	2
	.type	printMany,@function
	.cc_top printMany.function
printMany:
.Lxtalabel13:
	entsp 8
	stw r4, sp[7]
	stw r5, sp[6]
	stw r6, sp[5]
	stw r7, sp[4]
	stw r8, sp[3]
	stw r9, sp[2]
	stw r10, sp[1]
	mov r4, r2
	mov r5, r1
	mov r7, r0
	getr r8, 1
	#APP
	getr r6, 2
	#NO_APP
.LBB9_1:
.Lxtalabel14:
.Lxta.loop_labels2:
	# LOOPMARKER 0
	bf r6, .LBB9_1
.Lxtalabel15:
	bf r7, .LBB9_5
	ldc r9, 0
.LBB9_4:
.Lxtalabel16:
	setc res[r8], 1
.Lxta.endpoint_labels0:
	in r0, res[r8]
	ldc r1, 16384
	add r0, r0, r1
	setd res[r8], r0
	setc res[r8], 9
.Lxta.endpoint_labels1:
	in r0, res[r8]
	mov r0, r6
	ldw r1, cp[.LCPI9_0]
	ldc r2, 4
	mkmsk r3, 1
.Lxta.call_labels1:
	bl startnOSBurstClient
	lsu r0, r9, r4
	ecallf r0
	ldw r0, r5[r9]
	#APP
	out res[r6],r0
	#NO_APP
	add r9, r9, 1
	lsu r10, r9, r7
	mov r0, r6
.Lxta.call_labels2:
	bl endnOSBurstClient
.Lxta.loop_labels3:
	# LOOPMARKER 1
	bt r10, .LBB9_4
.LBB9_5:
.Lxtalabel17:
	#APP
	freer res[r6]
	#NO_APP
	freer res[r8]
	ldw r10, sp[1]
	ldw r9, sp[2]
	ldw r8, sp[3]
	ldw r7, sp[4]
	ldw r6, sp[5]
	ldw r5, sp[6]
	ldw r4, sp[7]
	retsp 8
	.cc_bottom printMany.function
	.set	printMany.nstackwords,((startnOSBurstClient.nstackwords $M endnOSBurstClient.nstackwords) + 8)
	.globl	printMany.nstackwords
	.set	printMany.maxcores,endnOSBurstClient.maxcores $M startnOSBurstClient.maxcores $M 1
	.globl	printMany.maxcores
	.set	printMany.maxtimers,(1 + endnOSBurstClient.maxtimers) $M (1 + startnOSBurstClient.maxtimers) $M 1
	.globl	printMany.maxtimers
	.set	printMany.maxchanends,endnOSBurstClient.maxchanends $M startnOSBurstClient.maxchanends $M 0
	.globl	printMany.maxchanends
.Ltmp9:
	.size	printMany, .Ltmp9-printMany

	.globl	connectChanend
	.align	2
	.type	connectChanend,@function
	.cc_top connectChanend.function
connectChanend:
.Lxtalabel18:
	#APP
	setd res[r0], r1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	#APP
	out res[r0], r0
	#NO_APP
	#APP
	chkct res[r0], 0x1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	retsp 0
	.cc_bottom connectChanend.function
	.set	connectChanend.nstackwords,0
	.globl	connectChanend.nstackwords
	.set	connectChanend.maxcores,1
	.globl	connectChanend.maxcores
	.set	connectChanend.maxtimers,0
	.globl	connectChanend.maxtimers
	.set	connectChanend.maxchanends,0
	.globl	connectChanend.maxchanends
.Ltmp10:
	.size	connectChanend, .Ltmp10-connectChanend

	.globl	freeChanend_sjh
	.align	2
	.type	freeChanend_sjh,@function
	.cc_top freeChanend_sjh.function
freeChanend_sjh:
.Lxtalabel19:
	#APP
	freer res[r0]
	#NO_APP
	retsp 0
	.cc_bottom freeChanend_sjh.function
	.set	freeChanend_sjh.nstackwords,0
	.globl	freeChanend_sjh.nstackwords
	.set	freeChanend_sjh.maxcores,1
	.globl	freeChanend_sjh.maxcores
	.set	freeChanend_sjh.maxtimers,0
	.globl	freeChanend_sjh.maxtimers
	.set	freeChanend_sjh.maxchanends,0
	.globl	freeChanend_sjh.maxchanends
.Ltmp11:
	.size	freeChanend_sjh, .Ltmp11-freeChanend_sjh

	.globl	chanendListen
	.align	2
	.type	chanendListen,@function
	.cc_top chanendListen.function
chanendListen:
.Lxtalabel20:
	#APP
	chkct res[r0], 0x1
	#NO_APP
	#APP
	in r1, res[r0]
	#NO_APP
	#APP
	setd res[r0], r1
	#NO_APP
	#APP
	outct res[r0], 0x1
	#NO_APP
	#APP
	chkct res[r0], 0x1
	#NO_APP
	mov r0, r1
	retsp 0
	.cc_bottom chanendListen.function
	.set	chanendListen.nstackwords,0
	.globl	chanendListen.nstackwords
	.set	chanendListen.maxcores,1
	.globl	chanendListen.maxcores
	.set	chanendListen.maxtimers,0
	.globl	chanendListen.maxtimers
	.set	chanendListen.maxchanends,0
	.globl	chanendListen.maxchanends
.Ltmp12:
	.size	chanendListen, .Ltmp12-chanendListen

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI13_0.data
	.align	4
.LCPI13_0:
	.long	2147550210
	.cc_bottom .LCPI13_0.data
	.text
	.globl	coreSendWords
	.align	2
	.type	coreSendWords,@function
	.cc_top coreSendWords.function
coreSendWords:
.Lxtalabel21:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	stw r7, sp[1]
	mov r4, r3
	mov r6, r2
	mov r7, r1
	mov r5, r0
	ldw r1, cp[.LCPI13_0]
	ldc r2, 4
	mov r0, r5
	mov r3, r6
.Lxta.call_labels3:
	bl startTransactionClient
	bf r6, .LBB13_3
	ldc r0, 0
.LBB13_2:
.Lxtalabel22:
	lsu r1, r0, r4
	ecallf r1
	ldw r1, r7[r0]
.Lxta.endpoint_labels2:
	out res[r5], r1
	add r0, r0, 1
	lsu r1, r0, r6
.Lxta.loop_labels4:
	# LOOPMARKER 0
	bt r1, .LBB13_2
.LBB13_3:
.Lxtalabel23:
	mov r0, r5
.Lxta.call_labels4:
	bl endTransactionClient
	ldw r7, sp[1]
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom coreSendWords.function
	.set	coreSendWords.nstackwords,((startTransactionClient.nstackwords $M endTransactionClient.nstackwords) + 5)
	.globl	coreSendWords.nstackwords
	.set	coreSendWords.maxcores,endTransactionClient.maxcores $M startTransactionClient.maxcores $M 1
	.globl	coreSendWords.maxcores
	.set	coreSendWords.maxtimers,endTransactionClient.maxtimers $M startTransactionClient.maxtimers $M 0
	.globl	coreSendWords.maxtimers
	.set	coreSendWords.maxchanends,endTransactionClient.maxchanends $M startTransactionClient.maxchanends $M 0
	.globl	coreSendWords.maxchanends
.Ltmp13:
	.size	coreSendWords, .Ltmp13-coreSendWords

	.globl	coreReceiveWords
	.align	2
	.type	coreReceiveWords,@function
	.cc_top coreReceiveWords.function
coreReceiveWords:
.Lxtalabel24:
	entsp 8
	stw r4, sp[7]
	stw r5, sp[6]
	stw r6, sp[5]
	stw r7, sp[4]
	mov r5, r2
	mov r6, r1
	mov r4, r0
	ldaw r1, sp[3]
	ldaw r2, sp[2]
	ldaw r3, sp[1]
	mov r0, r4
.Lxta.call_labels5:
	bl startTransactionServer
	ldw r7, sp[1]
	bf r7, .LBB14_3
	ldc r0, 0
.LBB14_2:
.Lxtalabel25:
	lsu r1, r0, r5
	ecallf r1
.Lxta.endpoint_labels3:
	in r1, res[r4]
	stw r1, r6[r0]
	add r0, r0, 1
	lsu r1, r0, r7
.Lxta.loop_labels5:
	# LOOPMARKER 0
	bt r1, .LBB14_2
.LBB14_3:
.Lxtalabel26:
	mov r0, r4
.Lxta.call_labels6:
	bl endTransactionServer
	mov r0, r7
	ldw r7, sp[4]
	ldw r6, sp[5]
	ldw r5, sp[6]
	ldw r4, sp[7]
	retsp 8
	.cc_bottom coreReceiveWords.function
	.set	coreReceiveWords.nstackwords,((startTransactionServer.nstackwords $M endTransactionServer.nstackwords) + 8)
	.globl	coreReceiveWords.nstackwords
	.set	coreReceiveWords.maxcores,endTransactionServer.maxcores $M startTransactionServer.maxcores $M 1
	.globl	coreReceiveWords.maxcores
	.set	coreReceiveWords.maxtimers,endTransactionServer.maxtimers $M startTransactionServer.maxtimers $M 0
	.globl	coreReceiveWords.maxtimers
	.set	coreReceiveWords.maxchanends,endTransactionServer.maxchanends $M startTransactionServer.maxchanends $M 0
	.globl	coreReceiveWords.maxchanends
.Ltmp14:
	.size	coreReceiveWords, .Ltmp14-coreReceiveWords

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI15_0.data
	.align	4
.LCPI15_0:
	.long	2147550210
	.cc_bottom .LCPI15_0.data
	.text
	.globl	coreSendBytes
	.align	2
	.type	coreSendBytes,@function
	.cc_top coreSendBytes.function
coreSendBytes:
.Lxtalabel27:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	stw r7, sp[1]
	mov r4, r3
	mov r6, r2
	mov r7, r1
	mov r5, r0
	ldw r1, cp[.LCPI15_0]
	mkmsk r2, 1
	mov r0, r5
	mov r3, r6
.Lxta.call_labels7:
	bl startTransactionClient
	bf r6, .LBB15_3
	ldc r0, 0
.LBB15_2:
.Lxtalabel28:
	lsu r1, r0, r4
	ecallf r1
	ld8u r1, r7[r0]
.Lxta.endpoint_labels4:
	outt res[r5], r1
	add r0, r0, 1
	lsu r1, r0, r6
.Lxta.loop_labels6:
	# LOOPMARKER 0
	bt r1, .LBB15_2
.LBB15_3:
.Lxtalabel29:
	mov r0, r5
.Lxta.call_labels8:
	bl endTransactionClient
	ldw r7, sp[1]
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom coreSendBytes.function
	.set	coreSendBytes.nstackwords,((startTransactionClient.nstackwords $M endTransactionClient.nstackwords) + 5)
	.globl	coreSendBytes.nstackwords
	.set	coreSendBytes.maxcores,endTransactionClient.maxcores $M startTransactionClient.maxcores $M 1
	.globl	coreSendBytes.maxcores
	.set	coreSendBytes.maxtimers,endTransactionClient.maxtimers $M startTransactionClient.maxtimers $M 0
	.globl	coreSendBytes.maxtimers
	.set	coreSendBytes.maxchanends,endTransactionClient.maxchanends $M startTransactionClient.maxchanends $M 0
	.globl	coreSendBytes.maxchanends
.Ltmp15:
	.size	coreSendBytes, .Ltmp15-coreSendBytes

	.globl	SwPrintUnsigned
	.align	2
	.type	SwPrintUnsigned,@function
	.cc_top SwPrintUnsigned.function
SwPrintUnsigned:
.Lxtalabel30:
	entsp 2
	stw r1, sp[1]
	ldaw r1, sp[1]
	mkmsk r3, 1
	mov r2, r3
.Lxta.call_labels9:
	bl coreSendWords
	retsp 2
	.cc_bottom SwPrintUnsigned.function
	.set	SwPrintUnsigned.nstackwords,(coreSendWords.nstackwords + 2)
	.globl	SwPrintUnsigned.nstackwords
	.set	SwPrintUnsigned.maxcores,coreSendWords.maxcores $M 1
	.globl	SwPrintUnsigned.maxcores
	.set	SwPrintUnsigned.maxtimers,coreSendWords.maxtimers $M 0
	.globl	SwPrintUnsigned.maxtimers
	.set	SwPrintUnsigned.maxchanends,coreSendWords.maxchanends $M 0
	.globl	SwPrintUnsigned.maxchanends
.Ltmp16:
	.size	SwPrintUnsigned, .Ltmp16-SwPrintUnsigned

	.globl	SwPrintString
	.align	2
	.type	SwPrintString,@function
	.cc_top SwPrintString.function
SwPrintString:
.Lxtalabel31:
	entsp 260
	stw r4, sp[259]
	stw r5, sp[258]
	stw r6, sp[257]
	mov r5, r0
	ldaw r6, sp[1]
	ldc r4, 1024
	mov r0, r1
	mov r1, r6
	mov r3, r4
.Lxta.call_labels10:
	bl stringToChars
	mov r2, r0
	mov r0, r5
	mov r1, r6
	mov r3, r4
.Lxta.call_labels11:
	bl coreSendBytes
	ldw r6, sp[257]
	ldw r5, sp[258]
	ldw r4, sp[259]
	retsp 260
	.cc_bottom SwPrintString.function
	.set	SwPrintString.nstackwords,((stringToChars.nstackwords $M coreSendBytes.nstackwords) + 260)
	.globl	SwPrintString.nstackwords
	.set	SwPrintString.maxcores,coreSendBytes.maxcores $M stringToChars.maxcores $M 1
	.globl	SwPrintString.maxcores
	.set	SwPrintString.maxtimers,coreSendBytes.maxtimers $M stringToChars.maxtimers $M 0
	.globl	SwPrintString.maxtimers
	.set	SwPrintString.maxchanends,coreSendBytes.maxchanends $M stringToChars.maxchanends $M 0
	.globl	SwPrintString.maxchanends
.Ltmp17:
	.size	SwPrintString, .Ltmp17-SwPrintString

	.globl	stringToChars
	.align	2
	.type	stringToChars,@function
	.cc_top stringToChars.function
stringToChars:
.Lxtalabel32:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
	stw r6, sp[0]
	mov r11, r0
	ecallf r2
	ldc r0, 0
	ld8u r5, r11[r0]
	bf r5, .LBB18_4
	ldc r4, 1024
.LBB18_2:
.Lxtalabel33:
	lsu r6, r0, r3
	ecallf r6
	lsu r6, r0, r2
	ecallf r6
	st8 r5, r1[r0]
	add r0, r0, 1
	lsu r5, r0, r2
	ecallf r5
	ld8u r5, r11[r0]
	bf r5, .LBB18_4
	lsu r6, r0, r4
	bt r6, .LBB18_2
.LBB18_4:
.Lxtalabel34:
	ldw r6, sp[0]
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom stringToChars.function
	.set	stringToChars.nstackwords,3
	.globl	stringToChars.nstackwords
	.set	stringToChars.maxcores,1
	.globl	stringToChars.maxcores
	.set	stringToChars.maxtimers,0
	.globl	stringToChars.maxtimers
	.set	stringToChars.maxchanends,0
	.globl	stringToChars.maxchanends
.Ltmp18:
	.size	stringToChars, .Ltmp18-stringToChars


	.typestring get_local_tile_id, "f{ui}()"
	.typestring nodeIndexToId, "f{ui}(ui)"
	.typestring buildChanId, "f{ui}(ui,ui)"
	.typestring getNewChannel, "f{ui}()"
	.typestring connectChannel, "f{0}(ui,ui)"
	.typestring getSpecificLocalChannel, "f{ui}(ui)"
	.typestring channelListen, "f{ui}(ui)"
	.typestring channelSendWord, "f{0}(ui,ui)"
	.typestring channelReceiveWord, "f{ui}(ui)"
	.typestring rowColToNodeId, "f{ui}(ui,ui,ui)"
	.typestring printMany, "f{0}(ui,&(a(:ui)))"
	.typestring connectChanend, "f{0}(chd,ui)"
	.typestring freeChanend_sjh, "f{0}(chd)"
	.typestring chanendListen, "f{ui}(chd)"
	.typestring coreSendWords, "f{0}(m:chd,&(a(:ui)),ui)"
	.typestring coreReceiveWords, "f{ui}(m:chd,&(a(:ui)))"
	.typestring coreSendBytes, "f{0}(m:chd,&(a(:uc)),ui)"
	.typestring SwPrintUnsigned, "f{0}(m:chd,ui)"
	.typestring SwPrintString, "f{0}(m:chd,&(a(:c:uc)))"
	.typestring startTransactionClient, "f{si}(m:chd,ui,uc,ui)"
	.typestring endTransactionClient, "f{0}(m:chd)"
	.typestring startTransactionServer, "f{0}(m:chd,&(ui),&(ui),&(ui))"
	.typestring endTransactionServer, "f{0}(m:chd)"
	.typestring startnOSBurstClient, "f{si}(ui,ui,uc,ui)"
	.typestring endnOSBurstClient, "f{0}(ui)"
	.typestring stringToChars, "f{ui}(&(a(:c:uc)),&(a(:uc)))"
	.typestring sw_ncols, "ui"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels1
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	62
	.long	.Lxta.call_labels1
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels2
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	64
	.long	.Lxta.call_labels2
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels0
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	190
	.long	.Lxta.call_labels0
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels3
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	218
	.long	.Lxta.call_labels3
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels4
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	223
	.long	.Lxta.call_labels4
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels5
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	234
	.long	.Lxta.call_labels5
.cc_bottom cc_5
.cc_top cc_6,.Lxta.call_labels6
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	245
	.long	.Lxta.call_labels6
.cc_bottom cc_6
.cc_top cc_7,.Lxta.call_labels7
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	255
	.long	.Lxta.call_labels7
.cc_bottom cc_7
.cc_top cc_8,.Lxta.call_labels8
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	260
	.long	.Lxta.call_labels8
.cc_bottom cc_8
.cc_top cc_9,.Lxta.call_labels9
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	271
	.long	.Lxta.call_labels9
.cc_bottom cc_9
.cc_top cc_10,.Lxta.call_labels10
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	291
	.long	.Lxta.call_labels10
.cc_bottom cc_10
.cc_top cc_11,.Lxta.call_labels11
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	292
	.long	.Lxta.call_labels11
.cc_bottom cc_11
.Lentries_end1:
	.section	.xtaendpointtable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_12,.Lxta.endpoint_labels0
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	58
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_12
.cc_top cc_13,.Lxta.endpoint_labels1
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	60
	.long	.Lxta.endpoint_labels1
.cc_bottom cc_13
.cc_top cc_14,.Lxta.endpoint_labels2
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	221
	.long	.Lxta.endpoint_labels2
.cc_bottom cc_14
.cc_top cc_15,.Lxta.endpoint_labels3
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	241
	.long	.Lxta.endpoint_labels3
.cc_bottom cc_15
.cc_top cc_16,.Lxta.endpoint_labels4
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	258
	.long	.Lxta.endpoint_labels4
.cc_bottom cc_16
.Lentries_end3:
	.section	.xtalabeltable,"",@progbits
.Lentries_start4:
	.long	.Lentries_end5-.Lentries_start4
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_17,.Lxtalabel12
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	31
	.long	40
	.long	.Lxtalabel12
.cc_bottom cc_17
.cc_top cc_18,.Lxtalabel13
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	43
	.long	49
	.long	.Lxtalabel13
.cc_bottom cc_18
.cc_top cc_19,.Lxtalabel14
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	50
	.long	52
	.long	.Lxtalabel14
.cc_bottom cc_19
.cc_top cc_20,.Lxtalabel15
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel15
.cc_bottom cc_20
.cc_top cc_21,.Lxtalabel16
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	57
	.long	66
	.long	.Lxtalabel16
.cc_bottom cc_21
.cc_top cc_22,.Lxtalabel17
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	67
	.long	68
	.long	.Lxtalabel17
.cc_bottom cc_22
.cc_top cc_23,.Lxtalabel0
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	72
	.long	74
	.long	.Lxtalabel0
.cc_bottom cc_23
.cc_top cc_24,.Lxtalabel1
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	72
	.long	74
	.long	.Lxtalabel1
.cc_bottom cc_24
.cc_top cc_25,.Lxtalabel1
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	79
	.long	82
	.long	.Lxtalabel1
.cc_bottom cc_25
.cc_top cc_26,.Lxtalabel2
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	89
	.long	93
	.long	.Lxtalabel2
.cc_bottom cc_26
.cc_top cc_27,.Lxtalabel18
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	98
	.long	104
	.long	.Lxtalabel18
.cc_bottom cc_27
.cc_top cc_28,.Lxtalabel3
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	108
	.long	114
	.long	.Lxtalabel3
.cc_bottom cc_28
.cc_top cc_29,.Lxtalabel19
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	129
	.long	131
	.long	.Lxtalabel19
.cc_bottom cc_29
.cc_top cc_30,.Lxtalabel20
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	135
	.long	143
	.long	.Lxtalabel20
.cc_bottom cc_30
.cc_top cc_31,.Lxtalabel9
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	147
	.long	155
	.long	.Lxtalabel9
.cc_bottom cc_31
.cc_top cc_32,.Lxtalabel10
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	158
	.long	164
	.long	.Lxtalabel10
.cc_bottom cc_32
.cc_top cc_33,.Lxtalabel11
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	168
	.long	178
	.long	.Lxtalabel11
.cc_bottom cc_33
.cc_top cc_34,.Lxtalabel4
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	183
	.long	193
	.long	.Lxtalabel4
.cc_bottom cc_34
.cc_top cc_35,.Lxtalabel5
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	194
	.long	195
	.long	.Lxtalabel5
.cc_bottom cc_35
.cc_top cc_36,.Lxtalabel5
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	197
	.long	200
	.long	.Lxtalabel5
.cc_bottom cc_36
.cc_top cc_37,.Lxtalabel6
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	201
	.long	206
	.long	.Lxtalabel6
.cc_bottom cc_37
.cc_top cc_38,.Lxtalabel7
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	207
	.long	210
	.long	.Lxtalabel7
.cc_bottom cc_38
.cc_top cc_39,.Lxtalabel8
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	211
	.long	213
	.long	.Lxtalabel8
.cc_bottom cc_39
.cc_top cc_40,.Lxtalabel21
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	217
	.long	219
	.long	.Lxtalabel21
.cc_bottom cc_40
.cc_top cc_41,.Lxtalabel22
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	220
	.long	222
	.long	.Lxtalabel22
.cc_bottom cc_41
.cc_top cc_42,.Lxtalabel23
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	223
	.long	225
	.long	.Lxtalabel23
.cc_bottom cc_42
.cc_top cc_43,.Lxtalabel24
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	230
	.long	237
	.long	.Lxtalabel24
.cc_bottom cc_43
.cc_top cc_44,.Lxtalabel25
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	238
	.long	244
	.long	.Lxtalabel25
.cc_bottom cc_44
.cc_top cc_45,.Lxtalabel26
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	245
	.long	250
	.long	.Lxtalabel26
.cc_bottom cc_45
.cc_top cc_46,.Lxtalabel27
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	254
	.long	256
	.long	.Lxtalabel27
.cc_bottom cc_46
.cc_top cc_47,.Lxtalabel28
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	257
	.long	259
	.long	.Lxtalabel28
.cc_bottom cc_47
.cc_top cc_48,.Lxtalabel29
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	260
	.long	261
	.long	.Lxtalabel29
.cc_bottom cc_48
.cc_top cc_49,.Lxtalabel30
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	268
	.long	272
	.long	.Lxtalabel30
.cc_bottom cc_49
.cc_top cc_50,.Lxtalabel32
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	276
	.long	278
	.long	.Lxtalabel32
.cc_bottom cc_50
.cc_top cc_51,.Lxtalabel33
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	279
	.long	282
	.long	.Lxtalabel33
.cc_bottom cc_51
.cc_top cc_52,.Lxtalabel34
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	283
	.long	284
	.long	.Lxtalabel34
.cc_bottom cc_52
.cc_top cc_53,.Lxtalabel31
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	288
	.long	293
	.long	.Lxtalabel31
.cc_bottom cc_53
.Lentries_end5:
	.section	.xtalooplabeltable,"",@progbits
.Lentries_start6:
	.long	.Lentries_end7-.Lentries_start6
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_54,.Lxta.loop_labels2
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	50
	.long	52
	.long	.Lxta.loop_labels2
.cc_bottom cc_54
.cc_top cc_55,.Lxta.loop_labels3
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	57
	.long	66
	.long	.Lxta.loop_labels3
.cc_bottom cc_55
.cc_top cc_56,.Lxta.loop_labels0
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	194
	.long	195
	.long	.Lxta.loop_labels0
.cc_bottom cc_56
.cc_top cc_57,.Lxta.loop_labels0
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	197
	.long	200
	.long	.Lxta.loop_labels0
.cc_bottom cc_57
.cc_top cc_58,.Lxta.loop_labels1
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	207
	.long	210
	.long	.Lxta.loop_labels1
.cc_bottom cc_58
.cc_top cc_59,.Lxta.loop_labels4
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	220
	.long	222
	.long	.Lxta.loop_labels4
.cc_bottom cc_59
.cc_top cc_60,.Lxta.loop_labels5
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	238
	.long	244
	.long	.Lxta.loop_labels5
.cc_bottom cc_60
.cc_top cc_61,.Lxta.loop_labels6
	.ascii	 "Swallow-helpers.xc"
	.byte	0
	.long	257
	.long	259
	.long	.Lxta.loop_labels6
.cc_bottom cc_61
.Lentries_end7:
