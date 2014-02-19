	.file	"scmain_15.xc"

	.set usage.anon.0,0
	.globread main,sw_ncols,"scmain_15.xc:74: error: previously used here"
	.globwrite __initLinks,sw_ncols,"scmain_15.xc:31: error: previously used here"
	.globwrite __initLinks,sw_nrows,"scmain_15.xc:30: error: previously used here"
	.call main,nOS_start
	.call main,__initLinks
	.call __initLinks,io_redirect
	.call __initLinks,getChanend
	.set main.locnoside, 1
	.set __initLinks.locnochandec, 1
	.set main.locnochandec, 1


	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI0_0.data
	.align	4
.LCPI0_0:
	.long	2147614466
	.cc_bottom .LCPI0_0.data
	.text
	.globl	__initLinks
	.align	2
	.type	__initLinks,@function
	.cc_top __initLinks.function
__initLinks:
.Lxtalabel0:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
.Lxta.call_labels0:
	bl io_redirect
	ldw r0, cp[.LCPI0_0]
.Lxta.call_labels1:
	bl getChanend
	mov r4, r0
	#APP
	in r0,res[r4]
	#NO_APP
	stw r0, dp[sw_nrows]
	#APP
	in r0,res[r4]
	#NO_APP
	stw r0, dp[sw_ncols]
	ldc r1, 14
	remu r2, r1, r0
	ldc r5, 17
	shl r2, r2, r5
	divu r0, r1, r0
	shl r0, r0, 24
	or r0, r0, r2
	ldc r1, 514
	or r0, r0, r1
.Lxta.call_labels2:
	bl getChanend
	#APP
	ecallf r0
	#NO_APP
	ldc r0, 16
	ldw r2, dp[sw_ncols]
	remu r1, r0, r2
	shl r1, r1, r5
	divu r0, r0, r2
	shl r0, r0, 24
	or r0, r0, r1
	ldc r1, 258
	or r0, r0, r1
.Lxta.call_labels3:
	bl getChanend
	#APP
	ecallf r0
	#NO_APP
	#APP
	chkct res[r4],1
	#NO_APP
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom __initLinks.function
	.set	__initLinks.nstackwords,((io_redirect.nstackwords $M getChanend.nstackwords) + 3)
	.globl	__initLinks.nstackwords
	.set	__initLinks.maxcores,getChanend.maxcores $M io_redirect.maxcores $M 1
	.globl	__initLinks.maxcores
	.set	__initLinks.maxtimers,getChanend.maxtimers $M io_redirect.maxtimers $M 0
	.globl	__initLinks.maxtimers
	.set	__initLinks.maxchanends,getChanend.maxchanends $M io_redirect.maxchanends $M 0
	.globl	__initLinks.maxchanends
.Ltmp0:
	.size	__initLinks, .Ltmp0-__initLinks

	.globl	main
	.align	2
	.type	main,@function
	.cc_top main.function
main:
.Lxtalabel1:
	entsp 2
	stw r4, sp[1]
.Lxta.call_labels4:
	bl __initLinks
	mkmsk r0, 4
	ldw r1, dp[sw_ncols]
	remu r2, r0, r1
	ldc r3, 17
	shl r2, r2, r3
	divu r0, r0, r1
	shl r0, r0, 24
	or r1, r2, r0
	ldc r0, 258
	or r0, r1, r0
	ldc r2, 514
	or r1, r1, r2
	ldc r4, 0
	mov r2, r4
.Lxta.call_labels5:
	bl nOS_start
	#APP
	freet
	#NO_APP
	mov r0, r4
	ldw r4, sp[1]
	retsp 2
	.cc_bottom main.function
	.set	main.nstackwords,((__initLinks.nstackwords $M nOS_start.nstackwords) + 2)
	.globl	main.nstackwords
	.set	main.maxcores,__initLinks.maxcores $M nOS_start.maxcores $M 1
	.globl	main.maxcores
	.set	main.maxtimers,__initLinks.maxtimers $M nOS_start.maxtimers $M 0
	.globl	main.maxtimers
	.set	main.maxchanends,__initLinks.maxchanends $M nOS_start.maxchanends $M 0
	.globl	main.maxchanends
.Ltmp1:
	.size	main, .Ltmp1-main


	.typestring nOS_start, "f{0}(ui,ui,ui)"
	.typestring io_redirect, "f{0}()"
	.typestring getChanend, "f{ui}(ui)"
	.typestring __initLinks, "f{0}()"
	.typestring main, "f{si}()"
	.typestring sw_nrows, "ui"
	.typestring sw_ncols, "ui"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels0
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	26
	.long	.Lxta.call_labels0
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels1
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	28
	.long	.Lxta.call_labels1
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels2
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	35
	.long	.Lxta.call_labels2
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels3
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	37
	.long	.Lxta.call_labels3
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels4
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	55
	.long	.Lxta.call_labels4
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels5
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	74
	.long	.Lxta.call_labels5
.cc_bottom cc_5
.Lentries_end1:
	.section	.xtalabeltable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_6,.Lxtalabel0
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	23
	.long	42
	.long	.Lxtalabel0
.cc_bottom cc_6
.cc_top cc_7,.Lxtalabel1
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	53
	.long	56
	.long	.Lxtalabel1
.cc_bottom cc_7
.cc_top cc_8,.Lxtalabel1
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	72
	.long	77
	.long	.Lxtalabel1
.cc_bottom cc_8
.cc_top cc_9,.Lxtalabel1
	.ascii	 "scmain_15.xc"
	.byte	0
	.long	93
	.long	95
	.long	.Lxtalabel1
.cc_bottom cc_9
.Lentries_end3:
