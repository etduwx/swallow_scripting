	.file	"/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"

	.call fixupStreamingChanNode,get_local_tile_id
	.call fixupStreamingChanNode,getLocalStreamingChanendId
	.call fixupChanNode,get_local_tile_id
	.call fixupChanNode,getLocalChanendId
	.call _write_intercept,startTransactionClient
	.call _write_intercept,endTransactionClient
	.set io_redirect.locnoside, 1
	.set _write_intercept.locnochandec, 1
	.set io_redirect.locnochandec, 1
	.set fixupChanNode.locnochandec, 1
	.set fixupStreamingChanNode.locnochandec, 1


	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI0_0.data
	.align	4
.LCPI0_0:
	.long	4294901760
	.cc_bottom .LCPI0_0.data
	.text
	.globl	fixupStreamingChanNode
	.align	2
	.type	fixupStreamingChanNode,@function
	.cc_top fixupStreamingChanNode.function
fixupStreamingChanNode:
.Lxtalabel0:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
	mov r4, r0
	mov r0, r4
.Lxta.call_labels0:
	bl getLocalStreamingChanendId
	shr r5, r0, 16
.Lxta.call_labels1:
	bl get_local_tile_id
	shr r1, r0, 16
	eq r1, r5, r1
	bt r1, .LBB0_3
.Lxtalabel1:
	#APP
	getd r1,res[r4]
	#NO_APP
	shr r2, r1, 16
	eq r2, r2, r5
	bf r2, .LBB0_3
.Lxtalabel2:
	ldw r2, cp[.LCPI0_0]
	and r0, r0, r2
	zext r1, 16
	or r0, r1, r0
	#APP
	setd res[r4],r0
	#NO_APP
.LBB0_3:
.Lxtalabel3:
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom fixupStreamingChanNode.function
	.set	fixupStreamingChanNode.nstackwords,((getLocalStreamingChanendId.nstackwords $M get_local_tile_id.nstackwords) + 3)
	.globl	fixupStreamingChanNode.nstackwords
	.set	fixupStreamingChanNode.maxcores,getLocalStreamingChanendId.maxcores $M get_local_tile_id.maxcores $M 1
	.globl	fixupStreamingChanNode.maxcores
	.set	fixupStreamingChanNode.maxtimers,getLocalStreamingChanendId.maxtimers $M get_local_tile_id.maxtimers $M 0
	.globl	fixupStreamingChanNode.maxtimers
	.set	fixupStreamingChanNode.maxchanends,getLocalStreamingChanendId.maxchanends $M get_local_tile_id.maxchanends $M 0
	.globl	fixupStreamingChanNode.maxchanends
.Ltmp0:
	.size	fixupStreamingChanNode, .Ltmp0-fixupStreamingChanNode

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI1_0.data
	.align	4
.LCPI1_0:
	.long	67043328
	.cc_bottom .LCPI1_0.data
	.cc_top .LCPI1_1.data
	.align	4
.LCPI1_1:
	.long	4026562304
	.cc_bottom .LCPI1_1.data
	.cc_top .LCPI1_2.data
	.align	4
.LCPI1_2:
	.long	4026561280
	.cc_bottom .LCPI1_2.data
	.text
	.globl	io_redirect
	.align	2
	.type	io_redirect,@function
	.cc_top io_redirect.function
io_redirect:
.Lxtalabel4:
	entsp 1
	stw r4, sp[0]
	#APP
	ldap r11,_write
mov r0,r11
ldap r11,_write_intercept_asm
mov r1,r11

	#NO_APP
	sub r3, r1, r0
	sub r11, r3, 4
	ldc r1, 0
	lss r2, r1, r11
	bt r2, .LBB1_2
.Lxtalabel5:
	ldc r11, 4
	sub r11, r11, r3
.LBB1_2:
.Lxtalabel6:
	ldc r3, 9
	shl r3, r11, r3
	ldw r4, cp[.LCPI1_0]
	and r3, r3, r4
	shr r11, r11, 1
	zext r11, 6
	bf r2, .LBB1_4
	ldw r2, cp[.LCPI1_2]
	bu .LBB1_5
.LBB1_4:
.Lxtalabel7:
	ldw r2, cp[.LCPI1_1]
.LBB1_5:
.Lxtalabel8:
	or r2, r11, r2
	or r2, r2, r3
	shr r3, r2, 16
	mkmsk r11, 1
	#APP
	st16 r3,r0[r1]
st16 r2,r0[r11]

	#NO_APP
	ldw r4, sp[0]
	retsp 1
	.cc_bottom io_redirect.function
	.set	io_redirect.nstackwords,1
	.globl	io_redirect.nstackwords
	.set	io_redirect.maxcores,1
	.globl	io_redirect.maxcores
	.set	io_redirect.maxtimers,0
	.globl	io_redirect.maxtimers
	.set	io_redirect.maxchanends,0
	.globl	io_redirect.maxchanends
.Ltmp1:
	.size	io_redirect, .Ltmp1-io_redirect

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI2_0.data
	.align	4
.LCPI2_0:
	.long	2147549954
	.cc_bottom .LCPI2_0.data
	.cc_top .LCPI2_1.data
	.align	4
.LCPI2_1:
	.long	4294967168
	.cc_bottom .LCPI2_1.data
	.text
	.globl	_write_intercept
	.align	2
	.type	_write_intercept,@function
	.cc_top _write_intercept.function
_write_intercept:
.Lxtalabel9:
	entsp 8
	stw r4, sp[7]
	stw r5, sp[6]
	stw r6, sp[5]
	stw r7, sp[4]
	stw r8, sp[3]
	stw r9, sp[2]
	stw r10, sp[1]
	mov r5, r2
	mov r6, r1
	mov r4, r0
	#APP
	getr r4,0x2
	#NO_APP
	bf r5, .LBB2_2
	ldc r10, 0
	ldw r7, cp[.LCPI2_0]
	mkmsk r8, 1
	bu .LBB2_8
.LBB2_2:
.Lxtalabel10:
	#APP
	freer res[r4]
	#NO_APP
	ldc r0, 0
	ldw r10, sp[1]
	ldw r9, sp[2]
	ldw r8, sp[3]
	ldw r7, sp[4]
	ldw r6, sp[5]
	ldw r5, sp[6]
	ldw r4, sp[7]
	retsp 8
.LBB2_3:
	neg r0, r5
	ldw r1, cp[.LCPI2_1]
	lsu r1, r1, r0
	mov r0, r5
	bt r1, .LBB2_5
	ldc r0, 128
.LBB2_5:
	ldc r9, 0
.LBB2_6:
.Lxtalabel11:
	add r1, r9, r10
	ld8u r1, r6[r1]
.Lxta.endpoint_labels0:
	outt res[r4], r1
	add r9, r9, 1
	eq r1, r9, r0
	sub r5, r5, 1
	bf r1, .LBB2_6
.Lxtalabel12:
	mov r0, r4
.Lxta.call_labels2:
	bl endTransactionClient
.Lxta.loop_labels0:
	# LOOPMARKER 0
	mov r10, r9
	bf r5, .LBB2_2
.LBB2_8:
	ldc r9, 128
	lsu r0, r9, r5
	bt r0, .LBB2_10
	mov r9, r5
.LBB2_10:
	mov r0, r4
	mov r1, r7
	mov r2, r8
	mov r3, r9
.Lxta.call_labels3:
	bl startTransactionClient
	bt r5, .LBB2_3
	ldw r5, cp[.LCPI2_0]
	mkmsk r6, 1
.LBB2_12:
.Lxtalabel13:
	mov r0, r4
.Lxta.call_labels4:
	bl endTransactionClient
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r9
.Lxta.call_labels5:
	bl startTransactionClient
	bu .LBB2_12
	.cc_bottom _write_intercept.function
	.set	_write_intercept.nstackwords,((endTransactionClient.nstackwords $M startTransactionClient.nstackwords) + 8)
	.globl	_write_intercept.nstackwords
	.set	_write_intercept.maxcores,endTransactionClient.maxcores $M startTransactionClient.maxcores $M 1
	.globl	_write_intercept.maxcores
	.set	_write_intercept.maxtimers,endTransactionClient.maxtimers $M startTransactionClient.maxtimers $M 0
	.globl	_write_intercept.maxtimers
	.set	_write_intercept.maxchanends,endTransactionClient.maxchanends $M startTransactionClient.maxchanends $M 0
	.globl	_write_intercept.maxchanends
.Ltmp2:
	.size	_write_intercept, .Ltmp2-_write_intercept

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI3_0.data
	.align	4
.LCPI3_0:
	.long	4294901760
	.cc_bottom .LCPI3_0.data
	.text
	.globl	fixupChanNode
	.align	2
	.type	fixupChanNode,@function
	.cc_top fixupChanNode.function
fixupChanNode:
.Lxtalabel14:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
	mov r4, r0
	mov r0, r4
.Lxta.call_labels6:
	bl getLocalChanendId
	shr r5, r0, 16
.Lxta.call_labels7:
	bl get_local_tile_id
	shr r1, r0, 16
	eq r1, r5, r1
	bt r1, .LBB3_3
.Lxtalabel15:
	#APP
	getd r1,res[r4]
	#NO_APP
	shr r2, r1, 16
	eq r2, r2, r5
	bf r2, .LBB3_3
.Lxtalabel16:
	ldw r2, cp[.LCPI3_0]
	and r0, r0, r2
	zext r1, 16
	or r0, r1, r0
	#APP
	setd res[r4],r0
	#NO_APP
.LBB3_3:
.Lxtalabel17:
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom fixupChanNode.function
	.set	fixupChanNode.nstackwords,((getLocalChanendId.nstackwords $M get_local_tile_id.nstackwords) + 3)
	.globl	fixupChanNode.nstackwords
	.set	fixupChanNode.maxcores,getLocalChanendId.maxcores $M get_local_tile_id.maxcores $M 1
	.globl	fixupChanNode.maxcores
	.set	fixupChanNode.maxtimers,getLocalChanendId.maxtimers $M get_local_tile_id.maxtimers $M 0
	.globl	fixupChanNode.maxtimers
	.set	fixupChanNode.maxchanends,getLocalChanendId.maxchanends $M get_local_tile_id.maxchanends $M 0
	.globl	fixupChanNode.maxchanends
.Ltmp3:
	.size	fixupChanNode, .Ltmp3-fixupChanNode

	.section	.dp.bss,"awd",@nobits
	.cc_top sw_nrows.data
	.globl	sw_nrows
	.align	4
	.type	sw_nrows,@object
	.size sw_nrows,4
sw_nrows:
	.long	0
	.cc_bottom sw_nrows.data
	.cc_top sw_ncols.data
	.globl	sw_ncols
	.align	4
	.type	sw_ncols,@object
	.size sw_ncols,4
sw_ncols:
	.long	0
	.cc_bottom sw_ncols.data

	.typestring get_local_tile_id, "f{ui}()"
	.typestring startTransactionClient, "f{si}(m:chd,ui,uc,ui)"
	.typestring endTransactionClient, "f{0}(m:chd)"
	.typestring fixupStreamingChanNode, "f{0}(m:chd)"
	.typestring getLocalStreamingChanendId, "f{ui}(m:chd)"
	.typestring io_redirect, "f{0}()"
	.typestring getLocalChanendId, "f{ui}(chd)"
	.typestring _write_intercept, "f{ui}(m:chd,&(a(:uc)),ui)"
	.typestring fixupChanNode, "f{0}(chd)"
	.typestring sw_nrows, "ui"
	.typestring sw_ncols, "ui"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels3
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	28
	.long	.Lxta.call_labels3
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels5
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	28
	.long	.Lxta.call_labels5
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels2
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	34
	.long	.Lxta.call_labels2
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels4
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	34
	.long	.Lxta.call_labels4
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels6
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	72
	.long	.Lxta.call_labels6
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels7
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	73
	.long	.Lxta.call_labels7
.cc_bottom cc_5
.cc_top cc_6,.Lxta.call_labels0
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	88
	.long	.Lxta.call_labels0
.cc_bottom cc_6
.cc_top cc_7,.Lxta.call_labels1
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	89
	.long	.Lxta.call_labels1
.cc_bottom cc_7
.Lentries_end1:
	.section	.xtaendpointtable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_8,.Lxta.endpoint_labels0
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	31
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_8
.Lentries_end3:
	.section	.xtalabeltable,"",@progbits
.Lentries_start4:
	.long	.Lentries_end5-.Lentries_start4
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_9,.Lxtalabel9
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	22
	.long	26
	.long	.Lxtalabel9
.cc_bottom cc_9
.cc_top cc_10,.Lxtalabel13
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	27
	.long	29
	.long	.Lxtalabel13
.cc_bottom cc_10
.cc_top cc_11,.Lxtalabel11
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	30
	.long	32
	.long	.Lxtalabel11
.cc_bottom cc_11
.cc_top cc_12,.Lxtalabel13
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	33
	.long	35
	.long	.Lxtalabel13
.cc_bottom cc_12
.cc_top cc_13,.Lxtalabel12
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	33
	.long	35
	.long	.Lxtalabel12
.cc_bottom cc_13
.cc_top cc_14,.Lxtalabel10
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	36
	.long	38
	.long	.Lxtalabel10
.cc_bottom cc_14
.cc_top cc_15,.Lxtalabel4
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	41
	.long	46
	.long	.Lxtalabel4
.cc_bottom cc_15
.cc_top cc_16,.Lxtalabel5
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	41
	.long	46
	.long	.Lxtalabel5
.cc_bottom cc_16
.cc_top cc_17,.Lxtalabel7
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	41
	.long	46
	.long	.Lxtalabel7
.cc_bottom cc_17
.cc_top cc_18,.Lxtalabel8
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	41
	.long	46
	.long	.Lxtalabel8
.cc_bottom cc_18
.cc_top cc_19,.Lxtalabel6
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	41
	.long	46
	.long	.Lxtalabel6
.cc_bottom cc_19
.cc_top cc_20,.Lxtalabel4
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	51
	.long	52
	.long	.Lxtalabel4
.cc_bottom cc_20
.cc_top cc_21,.Lxtalabel5
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	51
	.long	52
	.long	.Lxtalabel5
.cc_bottom cc_21
.cc_top cc_22,.Lxtalabel7
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	51
	.long	52
	.long	.Lxtalabel7
.cc_bottom cc_22
.cc_top cc_23,.Lxtalabel6
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	51
	.long	52
	.long	.Lxtalabel6
.cc_bottom cc_23
.cc_top cc_24,.Lxtalabel8
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	51
	.long	52
	.long	.Lxtalabel8
.cc_bottom cc_24
.cc_top cc_25,.Lxtalabel7
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel7
.cc_bottom cc_25
.cc_top cc_26,.Lxtalabel6
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel6
.cc_bottom cc_26
.cc_top cc_27,.Lxtalabel8
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel8
.cc_bottom cc_27
.cc_top cc_28,.Lxtalabel5
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel5
.cc_bottom cc_28
.cc_top cc_29,.Lxtalabel4
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel4
.cc_bottom cc_29
.cc_top cc_30,.Lxtalabel8
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	63
	.long	64
	.long	.Lxtalabel8
.cc_bottom cc_30
.cc_top cc_31,.Lxtalabel7
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	63
	.long	64
	.long	.Lxtalabel7
.cc_bottom cc_31
.cc_top cc_32,.Lxtalabel6
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	63
	.long	64
	.long	.Lxtalabel6
.cc_bottom cc_32
.cc_top cc_33,.Lxtalabel5
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	63
	.long	64
	.long	.Lxtalabel5
.cc_bottom cc_33
.cc_top cc_34,.Lxtalabel4
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	63
	.long	64
	.long	.Lxtalabel4
.cc_bottom cc_34
.cc_top cc_35,.Lxtalabel7
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	66
	.long	67
	.long	.Lxtalabel7
.cc_bottom cc_35
.cc_top cc_36,.Lxtalabel6
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	66
	.long	67
	.long	.Lxtalabel6
.cc_bottom cc_36
.cc_top cc_37,.Lxtalabel5
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	66
	.long	67
	.long	.Lxtalabel5
.cc_bottom cc_37
.cc_top cc_38,.Lxtalabel8
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	66
	.long	67
	.long	.Lxtalabel8
.cc_bottom cc_38
.cc_top cc_39,.Lxtalabel4
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	66
	.long	67
	.long	.Lxtalabel4
.cc_bottom cc_39
.cc_top cc_40,.Lxtalabel14
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	71
	.long	74
	.long	.Lxtalabel14
.cc_bottom cc_40
.cc_top cc_41,.Lxtalabel15
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	75
	.long	78
	.long	.Lxtalabel15
.cc_bottom cc_41
.cc_top cc_42,.Lxtalabel16
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	79
	.long	82
	.long	.Lxtalabel16
.cc_bottom cc_42
.cc_top cc_43,.Lxtalabel17
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	84
	.long	84
	.long	.Lxtalabel17
.cc_bottom cc_43
.cc_top cc_44,.Lxtalabel0
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	87
	.long	90
	.long	.Lxtalabel0
.cc_bottom cc_44
.cc_top cc_45,.Lxtalabel1
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	91
	.long	94
	.long	.Lxtalabel1
.cc_bottom cc_45
.cc_top cc_46,.Lxtalabel2
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	95
	.long	98
	.long	.Lxtalabel2
.cc_bottom cc_46
.cc_top cc_47,.Lxtalabel3
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	100
	.long	100
	.long	.Lxtalabel3
.cc_bottom cc_47
.Lentries_end5:
	.section	.xtalooplabeltable,"",@progbits
.Lentries_start6:
	.long	.Lentries_end7-.Lentries_start6
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_48,.Lxta.loop_labels0
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	27
	.long	29
	.long	.Lxta.loop_labels0
.cc_bottom cc_48
.cc_top cc_49,.Lxta.loop_labels0
	.ascii	 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.xc"
	.byte	0
	.long	33
	.long	35
	.long	.Lxta.loop_labels0
.cc_bottom cc_49
.Lentries_end7:
