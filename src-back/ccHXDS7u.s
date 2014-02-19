	.file	"/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c"

.set freeChanend.locnoside, 1

.set freeChanend.locnochandec, 1

.set write_sswitch_reg_clean.locnoside, 1

.set write_sswitch_reg_clean.locnochandec, 1

.set write_sswitch_reg_no_ack_clean.locnoside, 1

.set write_sswitch_reg_no_ack_clean.locnochandec, 1


	.text
	.globl	write_sswitch_reg_no_ack_clean
	.align	2
	.type	write_sswitch_reg_no_ack_clean,@function
	.cc_top write_sswitch_reg_no_ack_clean.function
write_sswitch_reg_no_ack_clean:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	stw r7, sp[1]
	mov r5, r2
	mov r6, r1
	mov r7, r0
	bl getLocalAnonChanend
	mov r4, r0
	bf r4, .LBB0_2
	#APP
	freer res[r4]
	#NO_APP
.LBB0_2:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl write_sswitch_reg_no_ack
	mov r5, r0
	bl getLocalAnonChanend
	eq r1, r0, r4
	bt r1, .LBB0_5
	bf r4, .LBB0_5
	#APP
	freer res[r4]
	#NO_APP
.LBB0_5:
	bf r0, .LBB0_7
	#APP
	freer res[r0]
	#NO_APP
.LBB0_7:
	mov r0, r5
	ldw r7, sp[1]
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom write_sswitch_reg_no_ack_clean.function
	.set	write_sswitch_reg_no_ack_clean.nstackwords,((write_sswitch_reg_no_ack.nstackwords $M getLocalAnonChanend.nstackwords) + 5)
	.globl	write_sswitch_reg_no_ack_clean.nstackwords
	.set	write_sswitch_reg_no_ack_clean.maxcores,getLocalAnonChanend.maxcores $M write_sswitch_reg_no_ack.maxcores $M 1
	.globl	write_sswitch_reg_no_ack_clean.maxcores
	.set	write_sswitch_reg_no_ack_clean.maxtimers,getLocalAnonChanend.maxtimers $M write_sswitch_reg_no_ack.maxtimers $M 0
	.globl	write_sswitch_reg_no_ack_clean.maxtimers
	.set	write_sswitch_reg_no_ack_clean.maxchanends,getLocalAnonChanend.maxchanends $M write_sswitch_reg_no_ack.maxchanends $M 0
	.globl	write_sswitch_reg_no_ack_clean.maxchanends
.Ltmp0:
	.size	write_sswitch_reg_no_ack_clean, .Ltmp0-write_sswitch_reg_no_ack_clean

	.globl	freeChanend
	.align	2
	.type	freeChanend,@function
	.cc_top freeChanend.function
freeChanend:
	bf r0, .LBB1_2
	#APP
	freer res[r0]
	#NO_APP
.LBB1_2:
	retsp 0
	.cc_bottom freeChanend.function
	.set	freeChanend.nstackwords,0
	.globl	freeChanend.nstackwords
	.set	freeChanend.maxcores,1
	.globl	freeChanend.maxcores
	.set	freeChanend.maxtimers,0
	.globl	freeChanend.maxtimers
	.set	freeChanend.maxchanends,0
	.globl	freeChanend.maxchanends
.Ltmp1:
	.size	freeChanend, .Ltmp1-freeChanend

	.globl	write_sswitch_reg_clean
	.align	2
	.type	write_sswitch_reg_clean,@function
	.cc_top write_sswitch_reg_clean.function
write_sswitch_reg_clean:
	entsp 5
	stw r4, sp[4]
	stw r5, sp[3]
	stw r6, sp[2]
	stw r7, sp[1]
	mov r5, r2
	mov r6, r1
	mov r7, r0
	bl getLocalAnonChanend
	mov r4, r0
	bf r4, .LBB2_2
	#APP
	freer res[r4]
	#NO_APP
.LBB2_2:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl write_sswitch_reg
	mov r5, r0
	bl getLocalAnonChanend
	eq r1, r0, r4
	bt r1, .LBB2_5
	bf r4, .LBB2_5
	#APP
	freer res[r4]
	#NO_APP
.LBB2_5:
	bf r0, .LBB2_7
	#APP
	freer res[r0]
	#NO_APP
.LBB2_7:
	mov r0, r5
	ldw r7, sp[1]
	ldw r6, sp[2]
	ldw r5, sp[3]
	ldw r4, sp[4]
	retsp 5
	.cc_bottom write_sswitch_reg_clean.function
	.set	write_sswitch_reg_clean.nstackwords,((write_sswitch_reg.nstackwords $M getLocalAnonChanend.nstackwords) + 5)
	.globl	write_sswitch_reg_clean.nstackwords
	.set	write_sswitch_reg_clean.maxcores,getLocalAnonChanend.maxcores $M write_sswitch_reg.maxcores $M 1
	.globl	write_sswitch_reg_clean.maxcores
	.set	write_sswitch_reg_clean.maxtimers,getLocalAnonChanend.maxtimers $M write_sswitch_reg.maxtimers $M 0
	.globl	write_sswitch_reg_clean.maxtimers
	.set	write_sswitch_reg_clean.maxchanends,getLocalAnonChanend.maxchanends $M write_sswitch_reg.maxchanends $M 0
	.globl	write_sswitch_reg_clean.maxchanends
.Ltmp2:
	.size	write_sswitch_reg_clean, .Ltmp2-write_sswitch_reg_clean


	.typestring write_sswitch_reg_no_ack_clean, "f{ui}(ui,ui,ui)"
	.typestring freeChanend, "f{0}(ui)"
	.typestring write_sswitch_reg_clean, "f{ui}(ui,ui,ui)"
	.typestring getLocalAnonChanend, "f{ui}()"
	.typestring write_sswitch_reg, "f{si}(ui,ui,ui)"
	.typestring write_sswitch_reg_no_ack, "f{si}(ui,ui,ui)"
	.ident	"GCC: (GNU) 4.2.1 (LLVM build) XMOS 12.2.0 (build 7741)"
