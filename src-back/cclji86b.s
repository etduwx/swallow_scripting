	.file	"Swallow-wait.xc"

	.set usage.anon.0,0
	.set delay_execution.locnochandec, 1


	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI0_0.data
	.align	4
.LCPI0_0:
	.long	100000000
	.cc_bottom .LCPI0_0.data
	.text
	.globl	delay_execution
	.align	2
	.type	delay_execution,@function
	.cc_top delay_execution.function
delay_execution:
.Lxtalabel0:
	getr r0, 1
	setc res[r0], 1
.Lxta.endpoint_labels0:
	in r1, res[r0]
	ldw r2, cp[.LCPI0_0]
	add r1, r1, r2
	setd res[r0], r1
	setc res[r0], 9
.Lxta.endpoint_labels1:
	in r1, res[r0]
	freer res[r0]
	retsp 0
	.cc_bottom delay_execution.function
	.set	delay_execution.nstackwords,0
	.globl	delay_execution.nstackwords
	.set	delay_execution.maxcores,1
	.globl	delay_execution.maxcores
	.set	delay_execution.maxtimers,1
	.globl	delay_execution.maxtimers
	.set	delay_execution.maxchanends,0
	.globl	delay_execution.maxchanends
.Ltmp0:
	.size	delay_execution, .Ltmp0-delay_execution


	.typestring delay_execution, "f{0}(ui)"
	.section	.xtaendpointtable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.endpoint_labels0
	.ascii	 "Swallow-wait.xc"
	.byte	0
	.long	15
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_0
.cc_top cc_1,.Lxta.endpoint_labels1
	.ascii	 "Swallow-wait.xc"
	.byte	0
	.long	19
	.long	.Lxta.endpoint_labels1
.cc_bottom cc_1
.Lentries_end1:
	.section	.xtalabeltable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_2,.Lxtalabel0
	.ascii	 "Swallow-wait.xc"
	.byte	0
	.long	11
	.long	23
	.long	.Lxtalabel0
.cc_bottom cc_2
.Lentries_end3:
