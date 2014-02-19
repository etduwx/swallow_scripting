	.file	"Power_Measure_Lib.xc"

	.globalresource 0x10900,"sclk"
	.globalresource 0x10700,"cs_n"
	.globalresource 0x80200,"adc_address"
	.globalresource 0x10600,"din_a"
	.globalresource 0x10200,"din_b"
	.globalresource 0x106,"sclk_clk"
	.globalresource 0x10800,"r_wn"
	.globalresource 0x10a00,"core2led"
	.globwrite powerMeasure,sclk_clk,"Power_Measure_Lib.xc:60: error: previously used here"
	.globwrite powerMeasure,din_b,"Power_Measure_Lib.xc:64: error: previously used here"
	.globwrite powerMeasure,din_a,"Power_Measure_Lib.xc:63: error: previously used here"
	.globwrite powerMeasure,adc_address,"Power_Measure_Lib.xc:62: error: previously used here"
	.globwrite powerMeasure,cs_n,"Power_Measure_Lib.xc:61: error: previously used here"
	.globwrite powerMeasure,sclk,"Power_Measure_Lib.xc:66: error: previously used here"
	.call doIdle,write_pswitch_reg
	.call doIdle,get_local_tile_id
	.call doWorkDiv,write_pswitch_reg
	.call doWorkDiv,get_local_tile_id
	.call powerMeasureClient,printuintln
	.call powerMeasureClient,printstrln
	.call powerMeasureClient,printstr
	.call powerMeasure,printstrln
	.call powerMeasure,configure_port_clock_output
	.call powerMeasure,configure_out_port
	.call powerMeasure,configure_in_port
	.call powerMeasure,configure_clock_rate
	.set doWorkDiv.locnoside, 1
	.set doWork.locnoside, 1
	.set powerMeasure.locnochandec, 1
	.set powerMeasureClient.locnochandec, 1
	.set doWorkDiv.locnochandec, 1
	.set doWork.locnochandec, 1
	.set doIdle.locnochandec, 1
	.globpassesref configure_port_clock_output, sclk_clk,"Power_Measure_Lib.xc:66: error: call to `configure_port_clock_output' in `powerMeasure' makes alias of global 'sclk_clk'"
	.globpassesref configure_port_clock_output, sclk,"Power_Measure_Lib.xc:66: error: call to `configure_port_clock_output' in `powerMeasure' makes alias of global 'sclk'"
	.globpassesref configure_in_port, sclk_clk,"Power_Measure_Lib.xc:64: error: call to `configure_in_port' in `powerMeasure' makes alias of global 'sclk_clk'"
	.globpassesref configure_in_port, din_b,"Power_Measure_Lib.xc:64: error: call to `configure_in_port' in `powerMeasure' makes alias of global 'din_b'"
	.globpassesref configure_in_port, sclk_clk,"Power_Measure_Lib.xc:63: error: call to `configure_in_port' in `powerMeasure' makes alias of global 'sclk_clk'"
	.globpassesref configure_in_port, din_a,"Power_Measure_Lib.xc:63: error: call to `configure_in_port' in `powerMeasure' makes alias of global 'din_a'"
	.globpassesref configure_out_port, sclk_clk,"Power_Measure_Lib.xc:62: error: call to `configure_out_port' in `powerMeasure' makes alias of global 'sclk_clk'"
	.globpassesref configure_out_port, adc_address,"Power_Measure_Lib.xc:62: error: call to `configure_out_port' in `powerMeasure' makes alias of global 'adc_address'"
	.globpassesref configure_out_port, sclk_clk,"Power_Measure_Lib.xc:61: error: call to `configure_out_port' in `powerMeasure' makes alias of global 'sclk_clk'"
	.globpassesref configure_out_port, cs_n,"Power_Measure_Lib.xc:61: error: call to `configure_out_port' in `powerMeasure' makes alias of global 'cs_n'"
	.globpassesref configure_clock_rate, sclk_clk,"Power_Measure_Lib.xc:60: error: call to `configure_clock_rate' in `powerMeasure' makes alias of global 'sclk_clk'"


	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI0_0.data
	.align	4
.LCPI0_0:
	.long	67840
	.cc_bottom .LCPI0_0.data
	.text
	.align	2
	.type	sclk.ctor,@function
	.cc_top sclk.ctor.function
sclk.ctor:
	ldw r0, cp[.LCPI0_0]
	setc res[r0], 8
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom sclk.ctor.function
	.set	sclk.ctor.nstackwords,0
	.set	sclk.ctor.maxcores,1
	.set	sclk.ctor.maxtimers,0
	.set	sclk.ctor.maxchanends,0
.Ltmp0:
	.size	sclk.ctor, .Ltmp0-sclk.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI1_0.data
	.align	4
.LCPI1_0:
	.long	67840
	.cc_bottom .LCPI1_0.data
	.text
	.align	2
	.type	sclk.dtor,@function
	.cc_top sclk.dtor.function
sclk.dtor:
	ldw r0, cp[.LCPI1_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom sclk.dtor.function
	.set	sclk.dtor.nstackwords,0
	.set	sclk.dtor.maxcores,1
	.set	sclk.dtor.maxtimers,0
	.set	sclk.dtor.maxchanends,0
.Ltmp1:
	.size	sclk.dtor, .Ltmp1-sclk.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI2_0.data
	.align	4
.LCPI2_0:
	.long	67328
	.cc_bottom .LCPI2_0.data
	.text
	.align	2
	.type	cs_n.ctor,@function
	.cc_top cs_n.ctor.function
cs_n.ctor:
	ldw r0, cp[.LCPI2_0]
	setc res[r0], 8
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom cs_n.ctor.function
	.set	cs_n.ctor.nstackwords,0
	.set	cs_n.ctor.maxcores,1
	.set	cs_n.ctor.maxtimers,0
	.set	cs_n.ctor.maxchanends,0
.Ltmp2:
	.size	cs_n.ctor, .Ltmp2-cs_n.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI3_0.data
	.align	4
.LCPI3_0:
	.long	67328
	.cc_bottom .LCPI3_0.data
	.text
	.align	2
	.type	cs_n.dtor,@function
	.cc_top cs_n.dtor.function
cs_n.dtor:
	ldw r0, cp[.LCPI3_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom cs_n.dtor.function
	.set	cs_n.dtor.nstackwords,0
	.set	cs_n.dtor.maxcores,1
	.set	cs_n.dtor.maxtimers,0
	.set	cs_n.dtor.maxchanends,0
.Ltmp3:
	.size	cs_n.dtor, .Ltmp3-cs_n.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI4_0.data
	.align	4
.LCPI4_0:
	.long	524800
	.cc_bottom .LCPI4_0.data
	.text
	.align	2
	.type	adc_address.ctor,@function
	.cc_top adc_address.ctor.function
adc_address.ctor:
	ldw r0, cp[.LCPI4_0]
	setc res[r0], 8
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom adc_address.ctor.function
	.set	adc_address.ctor.nstackwords,0
	.set	adc_address.ctor.maxcores,1
	.set	adc_address.ctor.maxtimers,0
	.set	adc_address.ctor.maxchanends,0
.Ltmp4:
	.size	adc_address.ctor, .Ltmp4-adc_address.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI5_0.data
	.align	4
.LCPI5_0:
	.long	524800
	.cc_bottom .LCPI5_0.data
	.text
	.align	2
	.type	adc_address.dtor,@function
	.cc_top adc_address.dtor.function
adc_address.dtor:
	ldw r0, cp[.LCPI5_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom adc_address.dtor.function
	.set	adc_address.dtor.nstackwords,0
	.set	adc_address.dtor.maxcores,1
	.set	adc_address.dtor.maxtimers,0
	.set	adc_address.dtor.maxchanends,0
.Ltmp5:
	.size	adc_address.dtor, .Ltmp5-adc_address.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI6_0.data
	.align	4
.LCPI6_0:
	.long	67072
	.cc_bottom .LCPI6_0.data
	.text
	.align	2
	.type	din_a.ctor,@function
	.cc_top din_a.ctor.function
din_a.ctor:
	ldw r0, cp[.LCPI6_0]
	setc res[r0], 8
	setc res[r0], 8207
	ldc r1, 32
	settw res[r0], r1
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom din_a.ctor.function
	.set	din_a.ctor.nstackwords,0
	.set	din_a.ctor.maxcores,1
	.set	din_a.ctor.maxtimers,0
	.set	din_a.ctor.maxchanends,0
.Ltmp6:
	.size	din_a.ctor, .Ltmp6-din_a.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI7_0.data
	.align	4
.LCPI7_0:
	.long	67072
	.cc_bottom .LCPI7_0.data
	.text
	.align	2
	.type	din_a.dtor,@function
	.cc_top din_a.dtor.function
din_a.dtor:
	ldw r0, cp[.LCPI7_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom din_a.dtor.function
	.set	din_a.dtor.nstackwords,0
	.set	din_a.dtor.maxcores,1
	.set	din_a.dtor.maxtimers,0
	.set	din_a.dtor.maxchanends,0
.Ltmp7:
	.size	din_a.dtor, .Ltmp7-din_a.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI8_0.data
	.align	4
.LCPI8_0:
	.long	66048
	.cc_bottom .LCPI8_0.data
	.text
	.align	2
	.type	din_b.ctor,@function
	.cc_top din_b.ctor.function
din_b.ctor:
	ldw r0, cp[.LCPI8_0]
	setc res[r0], 8
	setc res[r0], 8207
	ldc r1, 32
	settw res[r0], r1
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom din_b.ctor.function
	.set	din_b.ctor.nstackwords,0
	.set	din_b.ctor.maxcores,1
	.set	din_b.ctor.maxtimers,0
	.set	din_b.ctor.maxchanends,0
.Ltmp8:
	.size	din_b.ctor, .Ltmp8-din_b.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI9_0.data
	.align	4
.LCPI9_0:
	.long	66048
	.cc_bottom .LCPI9_0.data
	.text
	.align	2
	.type	din_b.dtor,@function
	.cc_top din_b.dtor.function
din_b.dtor:
	ldw r0, cp[.LCPI9_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom din_b.dtor.function
	.set	din_b.dtor.nstackwords,0
	.set	din_b.dtor.maxcores,1
	.set	din_b.dtor.maxtimers,0
	.set	din_b.dtor.maxchanends,0
.Ltmp9:
	.size	din_b.dtor, .Ltmp9-din_b.dtor

	.align	2
	.type	sclk_clk.ctor,@function
	.cc_top sclk_clk.ctor.function
sclk_clk.ctor:
	ldc r0, 262
	setc res[r0], 8
	retsp 0
	.cc_bottom sclk_clk.ctor.function
	.set	sclk_clk.ctor.nstackwords,0
	.set	sclk_clk.ctor.maxcores,1
	.set	sclk_clk.ctor.maxtimers,0
	.set	sclk_clk.ctor.maxchanends,0
.Ltmp10:
	.size	sclk_clk.ctor, .Ltmp10-sclk_clk.ctor

	.align	2
	.type	sclk_clk.dtor,@function
	.cc_top sclk_clk.dtor.function
sclk_clk.dtor:
	ldc r0, 262
	setc res[r0], 0
	retsp 0
	.cc_bottom sclk_clk.dtor.function
	.set	sclk_clk.dtor.nstackwords,0
	.set	sclk_clk.dtor.maxcores,1
	.set	sclk_clk.dtor.maxtimers,0
	.set	sclk_clk.dtor.maxchanends,0
.Ltmp11:
	.size	sclk_clk.dtor, .Ltmp11-sclk_clk.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI12_0.data
	.align	4
.LCPI12_0:
	.long	67584
	.cc_bottom .LCPI12_0.data
	.text
	.align	2
	.type	r_wn.ctor,@function
	.cc_top r_wn.ctor.function
r_wn.ctor:
	ldw r0, cp[.LCPI12_0]
	setc res[r0], 8
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom r_wn.ctor.function
	.set	r_wn.ctor.nstackwords,0
	.set	r_wn.ctor.maxcores,1
	.set	r_wn.ctor.maxtimers,0
	.set	r_wn.ctor.maxchanends,0
.Ltmp12:
	.size	r_wn.ctor, .Ltmp12-r_wn.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI13_0.data
	.align	4
.LCPI13_0:
	.long	67584
	.cc_bottom .LCPI13_0.data
	.text
	.align	2
	.type	r_wn.dtor,@function
	.cc_top r_wn.dtor.function
r_wn.dtor:
	ldw r0, cp[.LCPI13_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom r_wn.dtor.function
	.set	r_wn.dtor.nstackwords,0
	.set	r_wn.dtor.maxcores,1
	.set	r_wn.dtor.maxtimers,0
	.set	r_wn.dtor.maxchanends,0
.Ltmp13:
	.size	r_wn.dtor, .Ltmp13-r_wn.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI14_0.data
	.align	4
.LCPI14_0:
	.long	68096
	.cc_bottom .LCPI14_0.data
	.text
	.align	2
	.type	core2led.ctor,@function
	.cc_top core2led.ctor.function
core2led.ctor:
	ldw r0, cp[.LCPI14_0]
	setc res[r0], 8
	#APP
	ldc r1, _default_clkblk
	#NO_APP
	setclk res[r0], r1
	retsp 0
	.cc_bottom core2led.ctor.function
	.set	core2led.ctor.nstackwords,0
	.set	core2led.ctor.maxcores,1
	.set	core2led.ctor.maxtimers,0
	.set	core2led.ctor.maxchanends,0
.Ltmp14:
	.size	core2led.ctor, .Ltmp14-core2led.ctor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI15_0.data
	.align	4
.LCPI15_0:
	.long	68096
	.cc_bottom .LCPI15_0.data
	.text
	.align	2
	.type	core2led.dtor,@function
	.cc_top core2led.dtor.function
core2led.dtor:
	ldw r0, cp[.LCPI15_0]
	setc res[r0], 0
	retsp 0
	.cc_bottom core2led.dtor.function
	.set	core2led.dtor.nstackwords,0
	.set	core2led.dtor.maxcores,1
	.set	core2led.dtor.maxtimers,0
	.set	core2led.dtor.maxchanends,0
.Ltmp15:
	.size	core2led.dtor, .Ltmp15-core2led.dtor

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI16_0.data
	.align	4
.LCPI16_0:
	.long	67328
	.cc_bottom .LCPI16_0.data
	.cc_top .LCPI16_1.data
	.align	4
.LCPI16_1:
	.long	524800
	.cc_bottom .LCPI16_1.data
	.cc_top .LCPI16_2.data
	.align	4
.LCPI16_2:
	.long	67072
	.cc_bottom .LCPI16_2.data
	.cc_top .LCPI16_3.data
	.align	4
.LCPI16_3:
	.long	66048
	.cc_bottom .LCPI16_3.data
	.cc_top .LCPI16_4.data
	.align	4
.LCPI16_4:
	.long	67840
	.cc_bottom .LCPI16_4.data
	.text
	.globl	powerMeasure
	.align	2
	.type	powerMeasure,@function
	.cc_top powerMeasure.function
powerMeasure:
.Lxtalabel0:
	entsp 29
	stw r4, sp[28]
	stw r5, sp[27]
	stw r6, sp[26]
	stw r7, sp[25]
	stw r8, sp[24]
	stw r9, sp[23]
	stw r10, sp[22]
	mov r4, r0
	ldc r8, 262
	ldc r1, 5
	mkmsk r5, 1
	mov r0, r8
	mov r2, r5
.Lxta.call_labels0:
	bl configure_clock_rate
	ldw r7, cp[.LCPI16_0]
	mov r0, r7
	mov r1, r8
	mov r2, r5
.Lxta.call_labels1:
	bl configure_out_port
	ldw r0, cp[.LCPI16_1]
	ldc r2, 2
	mov r1, r8
.Lxta.call_labels2:
	bl configure_out_port
	ldw r0, cp[.LCPI16_2]
	mov r1, r8
.Lxta.call_labels3:
	bl configure_in_port
	ldw r0, cp[.LCPI16_3]
	mov r1, r8
.Lxta.call_labels4:
	bl configure_in_port
	ldw r0, cp[.LCPI16_4]
	mov r1, r8
.Lxta.call_labels5:
	bl configure_port_clock_output
	setc res[r8], 15
	ldc r1, 0
	ldc r10, 4095
	ldc r5, 10
	stw r0, sp[13]
	stw r0, sp[8]
	stw r0, sp[11]
	stw r0, sp[10]
	stw r0, sp[21]
	stw r0, sp[20]
	stw r0, sp[19]
	stw r0, sp[18]
	stw r0, sp[17]
	stw r0, sp[16]
	stw r0, sp[15]
	mov r3, r1
	mov r2, r1
	mov r6, r1
	stw r1, sp[9]
	stw r1, sp[12]
	bu .LBB16_1
.LBB16_13:
	stw r9, sp[8]
	mov r9, r1
	ldw r6, sp[6]
.LBB16_14:
	mov r0, r8
	zext r0, 8
	eq r11, r0, 10
	ldw r0, sp[14]
	mov r3, r9
	mov r2, r8
	mov r1, r6
	bf r11, .LBB16_1
.LBB16_15:
.Lxtalabel1:
	outct res[r4], 1
	chkct res[r4], 1
	ldw r2, sp[9]
.Lxta.endpoint_labels0:
	out res[r4], r2
	ldc r3, 625
	ldw r2, sp[15]
	mul r2, r2, r3
	shr r2, r2, r5
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels1:
	out res[r4], r2
	ldw r2, sp[21]
	mul r2, r2, r3
	ldc r11, 11
	shr r2, r2, r11
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels2:
	out res[r4], r2
	ldw r2, sp[16]
	mul r2, r2, r3
	shr r2, r2, r5
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels3:
	out res[r4], r2
	ldw r2, sp[10]
	mul r2, r2, r3
	shr r2, r2, r11
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels4:
	out res[r4], r2
	ldw r2, sp[17]
	mul r2, r2, r3
	shr r2, r2, r5
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels5:
	out res[r4], r2
	ldw r2, sp[11]
	mul r2, r2, r3
	shr r2, r2, r11
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels6:
	out res[r4], r2
	ldw r2, sp[18]
	mul r2, r2, r3
	shr r2, r2, r5
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels7:
	out res[r4], r2
	ldw r2, sp[8]
	mul r2, r2, r3
	shr r2, r2, r11
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels8:
	out res[r4], r2
	ldw r2, sp[19]
	mul r2, r2, r3
	shr r2, r2, r5
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels9:
	out res[r4], r2
	ldw r2, sp[13]
	mul r2, r2, r3
	shr r2, r2, r11
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels10:
	out res[r4], r2
	ldw r2, sp[20]
	mul r2, r2, r3
	shr r2, r2, r5
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels11:
	out res[r4], r2
	ldw r2, sp[12]
	mul r2, r2, r3
	shr r2, r2, r11
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
.Lxta.endpoint_labels12:
	out res[r4], r2
	outct res[r4], 1
	chkct res[r4], 1
	ldc r2, 0
	mov r3, r9
	mov r6, r1
.LBB16_1:
	stw r6, sp[6]
	clre
	eeu res[r4]
	ldap r11, .Ltmp16
	setv res[r4], r11
	ldw r9, sp[8]
	bu .LBB16_2
.LBB16_5:
	stw r0, sp[13]
	mov r9, r0
	stw r0, sp[11]
	stw r0, sp[10]
	stw r0, sp[21]
	stw r0, sp[20]
	stw r0, sp[19]
	stw r0, sp[18]
	stw r0, sp[17]
	stw r0, sp[16]
	stw r0, sp[15]
	mkmsk r3, 1
	mov r2, r8
	stw r0, sp[9]
	stw r0, sp[12]
.LBB16_2:
	stw r0, sp[14]
	mov r6, r3
	mov r8, r2
.LBB16_3:
.Lxtalabel2:
	setsr 1
	clrsr 1
	bu .Ltmp17
.Ltmp16:
.LBB16_4:
.Lxtalabel3:
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels13:
	int r8, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	eq r1, r8, 1
	ldc r0, 0
	bt r1, .LBB16_5
.Lxtalabel4:
	eq r1, r8, 2
	mov r3, r0
	mov r2, r5
	bt r1, .LBB16_2
.Lxtalabel5:
	eq r0, r8, 3
	bf r0, .LBB16_3
.Lxtalabel6:
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels14:
	in r6, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	ldc r1, 0
	stw r1, sp[13]
	mkmsk r0, 1
	stw r1, sp[8]
	stw r1, sp[11]
	stw r1, sp[10]
	stw r1, sp[21]
	stw r1, sp[20]
	stw r1, sp[19]
	stw r1, sp[18]
	stw r1, sp[17]
	stw r1, sp[16]
	stw r1, sp[15]
	mov r3, r1
	mov r2, r8
	stw r1, sp[9]
	stw r1, sp[12]
	bu .LBB16_1
.Ltmp17:
.LBB16_9:
.Lxtalabel7:
	mov r1, r6
	mov r0, r1
	zext r0, 8
	eq r0, r0, 1
	ldc r6, 0
	bf r0, .LBB16_11
	stw r1, sp[7]
	bu .LBB16_22
.LBB16_11:
.Lxtalabel8:
	ldw r0, sp[14]
	zext r0, 8
	eq r0, r0, 1
	bf r0, .LBB16_13
	stw r1, sp[7]
	bu .LBB16_22
.LBB16_16:
.Lxtalabel9:
	ldw r2, sp[11]
	add r2, r1, r2
	stw r2, sp[11]
	ldw r1, sp[10]
	add r1, r0, r1
	stw r1, sp[10]
.LBB16_17:
.Lxtalabel10:
	stw r9, sp[8]
	ldw r0, sp[14]
	zext r0, 8
	ldc r1, 0
	ldw r2, sp[6]
	bf r0, .LBB16_19
	mkmsk r0, 32
	bu .LBB16_20
.LBB16_19:
.Lxtalabel11:
	mov r0, r1
.LBB16_20:
.Lxtalabel12:
	add r2, r2, r0
	ldw r0, sp[9]
	add r0, r0, 1
	stw r0, sp[9]
	mov r0, r1
	ldw r9, sp[7]
	mov r6, r2
	bf r6, .LBB16_15
	bu .LBB16_14
.LBB16_21:
.Lxtalabel13:
	ldw r2, sp[20]
	lda16 r2, r2[r1]
	stw r2, sp[20]
	ldw r1, sp[19]
	lda16 r1, r1[r0]
	stw r1, sp[19]
	mkmsk r6, 1
.LBB16_22:
.Lxtalabel14:
	ldw r0, cp[.LCPI16_1]
.Lxta.endpoint_labels15:
	out res[r0], r6
	ldc r0, 5
	lsu r0, r0, r6
	mkmsk r3, 1
.Lxta.endpoint_labels16:
	out res[r7], r3
	syncr res[r7]
	getts r2, res[r7]
	add r1, r2, 10
	setpt res[r7], r1
	ldc r1, 0
.Lxta.endpoint_labels17:
	out res[r7], r1
	ldc r1, 26
	add r1, r2, r1
	setpt res[r7], r1
.Lxta.endpoint_labels18:
	out res[r7], r3
	ldaw r2, r2[6]
	ldw r3, cp[.LCPI16_2]
	setpt res[r3], r2
	setc res[r3], 1
.Lxta.endpoint_labels19:
	in r2, res[r3]
	ldw r3, cp[.LCPI16_3]
	setpt res[r3], r1
	setc res[r3], 1
.Lxta.endpoint_labels20:
	in r1, res[r3]
	bt r0, .LBB16_28
.Lxtalabel15:
	bitrev r0, r2
	and r0, r0, r10
	shl r1, r1, 2
	bitrev r1, r1
	and r1, r1, r10
	
	.xtabranch .Ljumptable0+2,.Ljumptable0+4,.Ljumptable0+6,.Ljumptable0+8,.Ljumptable0+10,.Ljumptable0+12
.Ljumptable0:
		bru r6
	.jmptable .LBB16_21,.LBB16_24,.LBB16_25,.LBB16_26,.LBB16_27,.LBB16_16
.LBB16_24:
.Lxtalabel16:
	ldw r2, sp[12]
	add r2, r1, r2
	stw r2, sp[12]
	ldw r1, sp[13]
	add r1, r0, r1
	stw r1, sp[13]
	ldc r6, 2
	bu .LBB16_22
.LBB16_25:
.Lxtalabel17:
	ldw r2, sp[18]
	add r2, r1, r2
	stw r2, sp[18]
	ldw r1, sp[15]
	add r1, r0, r1
	stw r1, sp[15]
	mkmsk r6, 2
	bu .LBB16_22
.LBB16_26:
.Lxtalabel18:
	add r9, r1, r9
	ldw r1, sp[21]
	add r1, r0, r1
	stw r1, sp[21]
	ldc r6, 4
	bu .LBB16_22
.LBB16_27:
.Lxtalabel19:
	ldw r2, sp[17]
	add r2, r1, r2
	stw r2, sp[17]
	ldw r1, sp[16]
	add r1, r0, r1
	stw r1, sp[16]
	ldc r6, 5
	bu .LBB16_22
.LBB16_28:
.Lxtalabel20:
	ldaw r0, dp[.str]
	ldc r1, 39
.Lxta.call_labels6:
	bl printstrln
	add r6, r6, 1
	ldc r0, 6
	lsu r0, r6, r0
.Lxta.loop_labels0:
	# LOOPMARKER 0
	bt r0, .LBB16_22
	bu .LBB16_17
	.cc_bottom powerMeasure.function
	.set	powerMeasure.nstackwords,((configure_clock_rate.nstackwords $M configure_out_port.nstackwords $M configure_in_port.nstackwords $M configure_port_clock_output.nstackwords $M printstrln.nstackwords) + 29)
	.globl	powerMeasure.nstackwords
	.set	powerMeasure.maxcores,configure_clock_rate.maxcores $M configure_in_port.maxcores $M configure_out_port.maxcores $M configure_port_clock_output.maxcores $M printstrln.maxcores $M 1
	.globl	powerMeasure.maxcores
	.set	powerMeasure.maxtimers,configure_clock_rate.maxtimers $M configure_in_port.maxtimers $M configure_out_port.maxtimers $M configure_port_clock_output.maxtimers $M printstrln.maxtimers $M 0
	.globl	powerMeasure.maxtimers
	.set	powerMeasure.maxchanends,configure_clock_rate.maxchanends $M configure_in_port.maxchanends $M configure_out_port.maxchanends $M configure_port_clock_output.maxchanends $M printstrln.maxchanends $M 0
	.globl	powerMeasure.maxchanends
.Ltmp18:
	.size	powerMeasure, .Ltmp18-powerMeasure

	.section	.cp.rodata.cst4,"aMc",@progbits,4
	.cc_top .LCPI17_0.data
	.align	4
.LCPI17_0:
	.long	274877907
	.cc_bottom .LCPI17_0.data
	.text
	.globl	powerMeasureClient
	.align	2
	.type	powerMeasureClient,@function
	.cc_top powerMeasureClient.function
powerMeasureClient:
.Lxtalabel21:
	entsp 24
	stw r4, sp[23]
	stw r5, sp[22]
	stw r6, sp[21]
	stw r7, sp[20]
	stw r8, sp[19]
	stw r9, sp[18]
	stw r10, sp[17]
	mov r4, r0
	ldc r0, 0
	mov r1, r0
.LBB17_1:
.Lxtalabel22:
	stw r1, sp[16]
	outct res[r4], 1
	chkct res[r4], 1
	mkmsk r0, 2
.Lxta.endpoint_labels21:
	outt res[r4], r0
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	ldc r0, 1024
.Lxta.endpoint_labels22:
	out res[r4], r0
	outct res[r4], 1
	chkct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels23:
	in r9, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels24:
	in r5, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels25:
	in r0, res[r4]
	stw r0, sp[14]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels26:
	in r0, res[r4]
	stw r0, sp[15]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels27:
	in r0, res[r4]
	stw r0, sp[13]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels28:
	in r0, res[r4]
	stw r0, sp[12]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels29:
	in r0, res[r4]
	stw r0, sp[11]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels30:
	in r10, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels31:
	in r0, res[r4]
	stw r0, sp[10]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels32:
	in r8, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels33:
	in r0, res[r4]
	stw r0, sp[8]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels34:
	in r6, res[r4]
	chkct res[r4], 1
	outct res[r4], 1
	chkct res[r4], 1
	outct res[r4], 1
.Lxta.endpoint_labels35:
	in r0, res[r4]
	stw r0, sp[6]
	chkct res[r4], 1
	outct res[r4], 1
	ldaw r0, dp[.str1]
	mkmsk r1, 4
.Lxta.call_labels7:
	bl printstr
	mov r0, r9
.Lxta.call_labels8:
	bl printuintln
	ldaw r0, dp[.str2]
	ldc r7, 26
	mov r1, r7
.Lxta.call_labels9:
	bl printstrln
	divu r5, r5, r9
	mov r0, r5
.Lxta.call_labels10:
	bl printuintln
	ldw r0, sp[15]
	divu r0, r0, r9
	stw r0, sp[5]
.Lxta.call_labels11:
	bl printuintln
	ldw r0, sp[12]
	divu r0, r0, r9
	stw r0, sp[7]
.Lxta.call_labels12:
	bl printuintln
	divu r0, r10, r9
	stw r0, sp[9]
.Lxta.call_labels13:
	bl printuintln
	divu r0, r8, r9
	stw r0, sp[12]
.Lxta.call_labels14:
	bl printuintln
	divu r0, r6, r9
	stw r0, sp[15]
.Lxta.call_labels15:
	bl printuintln
	ldaw r0, dp[.str3]
	mov r1, r7
.Lxta.call_labels16:
	bl printstrln
	ldw r0, sp[14]
	divu r6, r0, r9
	mov r0, r6
.Lxta.call_labels17:
	bl printuintln
	mul r0, r6, r5
	ldc r10, 0
	ldw r8, cp[.LCPI17_0]
	lmul r5, r0, r0, r8, r10, r10
	ldw r0, sp[13]
	divu r7, r0, r9
	mov r0, r7
.Lxta.call_labels18:
	bl printuintln
	ldw r0, sp[11]
	divu r6, r0, r9
	mov r0, r6
.Lxta.call_labels19:
	bl printuintln
	ldw r0, sp[10]
	divu r0, r0, r9
	stw r0, sp[11]
.Lxta.call_labels20:
	bl printuintln
	ldw r0, sp[8]
	divu r0, r0, r9
	stw r0, sp[13]
.Lxta.call_labels21:
	bl printuintln
	ldw r0, sp[6]
	divu r0, r0, r9
	stw r0, sp[14]
.Lxta.call_labels22:
	bl printuintln
	ldaw r0, dp[.str4]
	ldc r1, 24
.Lxta.call_labels23:
	bl printstrln
	ldaw r0, dp[.str5]
	mkmsk r9, 3
	mov r1, r9
.Lxta.call_labels24:
	bl printstr
	shr r0, r5, 6
.Lxta.call_labels25:
	bl printuintln
	ldw r0, sp[5]
	mul r0, r7, r0
	lmul r7, r0, r0, r8, r10, r10
	ldaw r0, dp[.str6]
	ldc r5, 8
	mov r1, r5
.Lxta.call_labels26:
	bl printstr
	shr r0, r7, 6
.Lxta.call_labels27:
	bl printuintln
	ldw r0, sp[7]
	mul r0, r6, r0
	lmul r7, r0, r0, r8, r10, r10
	ldaw r0, dp[.str7]
	mov r1, r5
.Lxta.call_labels28:
	bl printstr
	shr r0, r7, 6
.Lxta.call_labels29:
	bl printuintln
	ldw r0, sp[9]
	ldw r1, sp[11]
	mul r0, r1, r0
	lmul r6, r0, r0, r8, r10, r10
	ldaw r0, dp[.str8]
	mov r1, r9
.Lxta.call_labels30:
	bl printstr
	shr r0, r6, 6
.Lxta.call_labels31:
	bl printuintln
	ldw r0, sp[12]
	ldw r1, sp[13]
	mul r0, r1, r0
	lmul r6, r0, r0, r8, r10, r10
	ldaw r0, dp[.str9]
	mov r1, r5
.Lxta.call_labels32:
	bl printstr
	shr r0, r6, 6
.Lxta.call_labels33:
	bl printuintln
	ldw r0, sp[15]
	ldw r1, sp[14]
	mul r0, r1, r0
	lmul r5, r0, r0, r8, r10, r10
	ldaw r0, dp[.str10]
	ldc r1, 10
.Lxta.call_labels34:
	bl printstr
	shr r0, r5, 6
.Lxta.call_labels35:
	bl printuintln
	ldw r1, sp[16]
	add r1, r1, 1
	ldc r0, 1000
	eq r0, r1, r0
.xtaloop 1000
	# LOOPMARKER 1
.Lxta.loop_labels1:
	# LOOPMARKER 0
	bf r0, .LBB17_1
.Lxtalabel23:
	ldw r10, sp[17]
	ldw r9, sp[18]
	ldw r8, sp[19]
	ldw r7, sp[20]
	ldw r6, sp[21]
	ldw r5, sp[22]
	ldw r4, sp[23]
	retsp 24
	.cc_bottom powerMeasureClient.function
	.set	powerMeasureClient.nstackwords,((printstrln.nstackwords $M printstr.nstackwords $M printuintln.nstackwords) + 24)
	.globl	powerMeasureClient.nstackwords
	.set	powerMeasureClient.maxcores,printstr.maxcores $M printstrln.maxcores $M printuintln.maxcores $M 1
	.globl	powerMeasureClient.maxcores
	.set	powerMeasureClient.maxtimers,printstr.maxtimers $M printstrln.maxtimers $M printuintln.maxtimers $M 0
	.globl	powerMeasureClient.maxtimers
	.set	powerMeasureClient.maxchanends,printstr.maxchanends $M printstrln.maxchanends $M printuintln.maxchanends $M 0
	.globl	powerMeasureClient.maxchanends
.Ltmp19:
	.size	powerMeasureClient, .Ltmp19-powerMeasureClient

	.globl	doWorkDiv
	.align	2
	.type	doWorkDiv,@function
	.cc_top doWorkDiv.function
doWorkDiv:
.Lxtalabel24:
	entsp 2
	stw r4, sp[1]
	mov r4, r0
	bl get_local_tile_id
	ldc r1, 6
	mov r2, r4
.Lxta.call_labels36:
	bl write_pswitch_reg
	ldc r0, 16
	ldc r1, 523
	set ps[r1], r0
.LBB18_1:
.Lxtalabel25:
	bu .LBB18_1
	.cc_bottom doWorkDiv.function
	.set	doWorkDiv.nstackwords,((get_local_tile_id.nstackwords $M write_pswitch_reg.nstackwords) + 2)
	.globl	doWorkDiv.nstackwords
	.set	doWorkDiv.maxcores,get_local_tile_id.maxcores $M write_pswitch_reg.maxcores $M 1
	.globl	doWorkDiv.maxcores
	.set	doWorkDiv.maxtimers,get_local_tile_id.maxtimers $M write_pswitch_reg.maxtimers $M 0
	.globl	doWorkDiv.maxtimers
	.set	doWorkDiv.maxchanends,get_local_tile_id.maxchanends $M write_pswitch_reg.maxchanends $M 0
	.globl	doWorkDiv.maxchanends
.Ltmp20:
	.size	doWorkDiv, .Ltmp20-doWorkDiv

	.globl	doWork
	.align	2
	.type	doWork,@function
	.cc_top doWork.function
doWork:
.Lxtalabel26:
.LBB19_1:
.Lxtalabel27:
	bu .LBB19_1
	.cc_bottom doWork.function
	.set	doWork.nstackwords,0
	.globl	doWork.nstackwords
	.set	doWork.maxcores,1
	.globl	doWork.maxcores
	.set	doWork.maxtimers,0
	.globl	doWork.maxtimers
	.set	doWork.maxchanends,0
	.globl	doWork.maxchanends
.Ltmp21:
	.size	doWork, .Ltmp21-doWork

	.globl	doIdle
	.align	2
	.type	doIdle,@function
	.cc_top doIdle.function
doIdle:
.Lxtalabel28:
	entsp 3
	stw r4, sp[2]
	stw r5, sp[1]
	mov r4, r1
	mov r5, r0
	bl get_local_tile_id
	ldc r1, 6
	mov r2, r5
.Lxta.call_labels37:
	bl write_pswitch_reg
	ldc r0, 16
	ldc r1, 523
	set ps[r1], r0
.Lxta.endpoint_labels36:
	out res[r4], r5
	#APP
	waiteu
	#NO_APP
	ldw r5, sp[1]
	ldw r4, sp[2]
	retsp 3
	.cc_bottom doIdle.function
	.set	doIdle.nstackwords,((get_local_tile_id.nstackwords $M write_pswitch_reg.nstackwords) + 3)
	.globl	doIdle.nstackwords
	.set	doIdle.maxcores,get_local_tile_id.maxcores $M write_pswitch_reg.maxcores $M 1
	.globl	doIdle.maxcores
	.set	doIdle.maxtimers,get_local_tile_id.maxtimers $M write_pswitch_reg.maxtimers $M 0
	.globl	doIdle.maxtimers
	.set	doIdle.maxchanends,get_local_tile_id.maxchanends $M write_pswitch_reg.maxchanends $M 0
	.globl	doIdle.maxchanends
.Ltmp22:
	.size	doIdle, .Ltmp22-doIdle

	.section	.dp.rodata,"awd",@progbits
	.cc_top sclk.data
	.globl	sclk
	.align	4
	.type	sclk,@object
	.size sclk,4
sclk:
	.long	67840
	.cc_bottom sclk.data
	.cc_top cs_n.data
	.globl	cs_n
	.align	4
	.type	cs_n,@object
	.size cs_n,4
cs_n:
	.long	67328
	.cc_bottom cs_n.data
	.cc_top adc_address.data
	.globl	adc_address
	.align	4
	.type	adc_address,@object
	.size adc_address,4
adc_address:
	.long	524800
	.cc_bottom adc_address.data
	.cc_top din_a.data
	.globl	din_a
	.align	4
	.type	din_a,@object
	.size din_a,4
din_a:
	.long	67072
	.cc_bottom din_a.data
	.cc_top din_b.data
	.globl	din_b
	.align	4
	.type	din_b,@object
	.size din_b,4
din_b:
	.long	66048
	.cc_bottom din_b.data
	.cc_top sclk_clk.data
	.globl	sclk_clk
	.align	4
	.type	sclk_clk,@object
	.size sclk_clk,4
sclk_clk:
	.long	262
	.cc_bottom sclk_clk.data
	.cc_top r_wn.data
	.globl	r_wn
	.align	4
	.type	r_wn,@object
	.size r_wn,4
r_wn:
	.long	67584
	.cc_bottom r_wn.data
	.cc_top core2led.data
	.globl	core2led
	.align	4
	.type	core2led,@object
	.size core2led,4
core2led:
	.long	68096
	.cc_bottom core2led.data
	.cc_top .str.data
	.align	4
	.type	.str,@object
	.size .str,39
.str:
.asciiz "Error! Invalid ADC address being used!"
	.cc_bottom .str.data
	.cc_top .str1.data
	.align	4
	.type	.str1,@object
	.size .str1,15
.str1:
.asciiz "Samples taken:"
	.cc_bottom .str1.data
	.cc_top .str2.data
	.align	4
	.type	.str2,@object
	.size .str2,26
.str2:
.asciiz "Voltage measurements (mV)"
	.cc_bottom .str2.data
	.cc_top .str3.data
	.align	4
	.type	.str3,@object
	.size .str3,26
.str3:
.asciiz "Current measurements (mA)"
	.cc_bottom .str3.data
	.cc_top .str4.data
	.align	4
	.type	.str4,@object
	.size .str4,24
.str4:
.asciiz "Power measurements (mW)"
	.cc_bottom .str4.data
	.cc_top .str5.data
	.align	4
	.type	.str5,@object
	.size .str5,7
.str5:
.asciiz "P_T = "
	.cc_bottom .str5.data
	.cc_top .str6.data
	.align	4
	.type	.str6,@object
	.size .str6,8
.str6:
.asciiz "P_MT = "
	.cc_bottom .str6.data
	.cc_top .str7.data
	.align	4
	.type	.str7,@object
	.size .str7,8
.str7:
.asciiz "P_MB = "
	.cc_bottom .str7.data
	.cc_top .str8.data
	.align	4
	.type	.str8,@object
	.size .str8,7
.str8:
.asciiz "P_B = "
	.cc_bottom .str8.data
	.cc_top .str9.data
	.align	4
	.type	.str9,@object
	.size .str9,8
.str9:
.asciiz "P_IO = "
	.cc_bottom .str9.data
	.cc_top .str10.data
	.align	4
	.type	.str10,@object
	.size .str10,10
.str10:
.asciiz "P_DRAM = "
	.cc_bottom .str10.data
	.section	.ctors,"aw",@progbits
	.align	4
	.long	sclk.ctor
	.long	cs_n.ctor
	.long	adc_address.ctor
	.long	din_a.ctor
	.long	din_b.ctor
	.long	sclk_clk.ctor
	.long	r_wn.ctor
	.long	core2led.ctor
	.section	.dtors,"aw",@progbits
	.align	4
	.long	sclk.dtor
	.long	cs_n.dtor
	.long	adc_address.dtor
	.long	din_a.dtor
	.long	din_b.dtor
	.long	sclk_clk.dtor
	.long	r_wn.dtor
	.long	core2led.dtor

	.typestring configure_in_port, "f{0}(w:p,:ck)"
	.typestring configure_out_port, "f{0}(w:p,:ck,ui)"
	.typestring configure_port_clock_output, "f{0}(w:p,:ck)"
	.typestring configure_clock_rate, "f{0}(ck,ui,ui)"
	.typestring write_pswitch_reg, "f{si}(ui,ui,ui)"
	.typestring get_local_tile_id, "f{ui}()"
	.typestring printuintln, "f{si}(ui)"
	.typestring printstr, "f{si}(&(a(:c:uc)))"
	.typestring printstrln, "f{si}(&(a(:c:uc)))"
	.typestring powerMeasure, "f{0}(chd)"
	.typestring powerMeasureClient, "f{0}(chd)"
	.typestring doWorkDiv, "f{0}(ui)"
	.typestring doWork, "f{0}()"
	.typestring doIdle, "f{0}(ui,o:p)"
	.typestring sclk, "o:p"
	.typestring cs_n, "o:p"
	.typestring adc_address, "o:p"
	.typestring din_a, "bi:p:32"
	.typestring din_b, "bi:p:32"
	.typestring sclk_clk, "ck"
	.typestring r_wn, "o:p"
	.typestring core2led, "o:p"
	.section	.xtacalltable,"",@progbits
.Lentries_start0:
	.long	.Lentries_end1-.Lentries_start0
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_0,.Lxta.call_labels0
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	60
	.long	.Lxta.call_labels0
.cc_bottom cc_0
.cc_top cc_1,.Lxta.call_labels1
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	61
	.long	.Lxta.call_labels1
.cc_bottom cc_1
.cc_top cc_2,.Lxta.call_labels2
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	62
	.long	.Lxta.call_labels2
.cc_bottom cc_2
.cc_top cc_3,.Lxta.call_labels3
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	63
	.long	.Lxta.call_labels3
.cc_bottom cc_3
.cc_top cc_4,.Lxta.call_labels4
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	64
	.long	.Lxta.call_labels4
.cc_bottom cc_4
.cc_top cc_5,.Lxta.call_labels5
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	66
	.long	.Lxta.call_labels5
.cc_bottom cc_5
.cc_top cc_6,.Lxta.call_labels6
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	261
	.long	.Lxta.call_labels6
.cc_bottom cc_6
.cc_top cc_7,.Lxta.call_labels7
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	346
	.long	.Lxta.call_labels7
.cc_bottom cc_7
.cc_top cc_8,.Lxta.call_labels8
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	347
	.long	.Lxta.call_labels8
.cc_bottom cc_8
.cc_top cc_9,.Lxta.call_labels9
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	350
	.long	.Lxta.call_labels9
.cc_bottom cc_9
.cc_top cc_10,.Lxta.call_labels10
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	351
	.long	.Lxta.call_labels10
.cc_bottom cc_10
.cc_top cc_11,.Lxta.call_labels11
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	352
	.long	.Lxta.call_labels11
.cc_bottom cc_11
.cc_top cc_12,.Lxta.call_labels12
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	353
	.long	.Lxta.call_labels12
.cc_bottom cc_12
.cc_top cc_13,.Lxta.call_labels13
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	354
	.long	.Lxta.call_labels13
.cc_bottom cc_13
.cc_top cc_14,.Lxta.call_labels14
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	355
	.long	.Lxta.call_labels14
.cc_bottom cc_14
.cc_top cc_15,.Lxta.call_labels15
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	356
	.long	.Lxta.call_labels15
.cc_bottom cc_15
.cc_top cc_16,.Lxta.call_labels16
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	358
	.long	.Lxta.call_labels16
.cc_bottom cc_16
.cc_top cc_17,.Lxta.call_labels17
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	359
	.long	.Lxta.call_labels17
.cc_bottom cc_17
.cc_top cc_18,.Lxta.call_labels18
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	360
	.long	.Lxta.call_labels18
.cc_bottom cc_18
.cc_top cc_19,.Lxta.call_labels19
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	361
	.long	.Lxta.call_labels19
.cc_bottom cc_19
.cc_top cc_20,.Lxta.call_labels20
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	362
	.long	.Lxta.call_labels20
.cc_bottom cc_20
.cc_top cc_21,.Lxta.call_labels21
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	363
	.long	.Lxta.call_labels21
.cc_bottom cc_21
.cc_top cc_22,.Lxta.call_labels22
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	364
	.long	.Lxta.call_labels22
.cc_bottom cc_22
.cc_top cc_23,.Lxta.call_labels23
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	367
	.long	.Lxta.call_labels23
.cc_bottom cc_23
.cc_top cc_24,.Lxta.call_labels24
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	369
	.long	.Lxta.call_labels24
.cc_bottom cc_24
.cc_top cc_25,.Lxta.call_labels25
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	370
	.long	.Lxta.call_labels25
.cc_bottom cc_25
.cc_top cc_26,.Lxta.call_labels26
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	371
	.long	.Lxta.call_labels26
.cc_bottom cc_26
.cc_top cc_27,.Lxta.call_labels27
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	372
	.long	.Lxta.call_labels27
.cc_bottom cc_27
.cc_top cc_28,.Lxta.call_labels28
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	373
	.long	.Lxta.call_labels28
.cc_bottom cc_28
.cc_top cc_29,.Lxta.call_labels29
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	374
	.long	.Lxta.call_labels29
.cc_bottom cc_29
.cc_top cc_30,.Lxta.call_labels30
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	375
	.long	.Lxta.call_labels30
.cc_bottom cc_30
.cc_top cc_31,.Lxta.call_labels31
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	376
	.long	.Lxta.call_labels31
.cc_bottom cc_31
.cc_top cc_32,.Lxta.call_labels32
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	377
	.long	.Lxta.call_labels32
.cc_bottom cc_32
.cc_top cc_33,.Lxta.call_labels33
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	378
	.long	.Lxta.call_labels33
.cc_bottom cc_33
.cc_top cc_34,.Lxta.call_labels34
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	379
	.long	.Lxta.call_labels34
.cc_bottom cc_34
.cc_top cc_35,.Lxta.call_labels35
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	380
	.long	.Lxta.call_labels35
.cc_bottom cc_35
.cc_top cc_36,.Lxta.call_labels36
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	389
	.long	.Lxta.call_labels36
.cc_bottom cc_36
.cc_top cc_37,.Lxta.call_labels37
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	413
	.long	.Lxta.call_labels37
.cc_bottom cc_37
.Lentries_end1:
	.section	.xtaendpointtable,"",@progbits
.Lentries_start2:
	.long	.Lentries_end3-.Lentries_start2
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_38,.Lxta.endpoint_labels13
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	78
	.long	.Lxta.endpoint_labels13
.cc_bottom cc_38
.cc_top cc_39,.Lxta.endpoint_labels14
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	98
	.long	.Lxta.endpoint_labels14
.cc_bottom cc_39
.cc_top cc_40,.Lxta.endpoint_labels15
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	119
	.long	.Lxta.endpoint_labels15
.cc_bottom cc_40
.cc_top cc_41,.Lxta.endpoint_labels16
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	120
	.long	.Lxta.endpoint_labels16
.cc_bottom cc_41
.cc_top cc_42,.Lxta.endpoint_labels17
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	123
	.long	.Lxta.endpoint_labels17
.cc_bottom cc_42
.cc_top cc_43,.Lxta.endpoint_labels18
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	212
	.long	.Lxta.endpoint_labels18
.cc_bottom cc_43
.cc_top cc_44,.Lxta.endpoint_labels19
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	213
	.long	.Lxta.endpoint_labels19
.cc_bottom cc_44
.cc_top cc_45,.Lxta.endpoint_labels20
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	214
	.long	.Lxta.endpoint_labels20
.cc_bottom cc_45
.cc_top cc_46,.Lxta.endpoint_labels0
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	281
	.long	.Lxta.endpoint_labels0
.cc_bottom cc_46
.cc_top cc_47,.Lxta.endpoint_labels1
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	282
	.long	.Lxta.endpoint_labels1
.cc_bottom cc_47
.cc_top cc_48,.Lxta.endpoint_labels2
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	283
	.long	.Lxta.endpoint_labels2
.cc_bottom cc_48
.cc_top cc_49,.Lxta.endpoint_labels3
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	284
	.long	.Lxta.endpoint_labels3
.cc_bottom cc_49
.cc_top cc_50,.Lxta.endpoint_labels4
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	285
	.long	.Lxta.endpoint_labels4
.cc_bottom cc_50
.cc_top cc_51,.Lxta.endpoint_labels5
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	286
	.long	.Lxta.endpoint_labels5
.cc_bottom cc_51
.cc_top cc_52,.Lxta.endpoint_labels6
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	287
	.long	.Lxta.endpoint_labels6
.cc_bottom cc_52
.cc_top cc_53,.Lxta.endpoint_labels7
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	288
	.long	.Lxta.endpoint_labels7
.cc_bottom cc_53
.cc_top cc_54,.Lxta.endpoint_labels8
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	289
	.long	.Lxta.endpoint_labels8
.cc_bottom cc_54
.cc_top cc_55,.Lxta.endpoint_labels9
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	290
	.long	.Lxta.endpoint_labels9
.cc_bottom cc_55
.cc_top cc_56,.Lxta.endpoint_labels10
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	291
	.long	.Lxta.endpoint_labels10
.cc_bottom cc_56
.cc_top cc_57,.Lxta.endpoint_labels11
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	292
	.long	.Lxta.endpoint_labels11
.cc_bottom cc_57
.cc_top cc_58,.Lxta.endpoint_labels12
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	293
	.long	.Lxta.endpoint_labels12
.cc_bottom cc_58
.cc_top cc_59,.Lxta.endpoint_labels21
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	328
	.long	.Lxta.endpoint_labels21
.cc_bottom cc_59
.cc_top cc_60,.Lxta.endpoint_labels22
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	329
	.long	.Lxta.endpoint_labels22
.cc_bottom cc_60
.cc_top cc_61,.Lxta.endpoint_labels23
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	331
	.long	.Lxta.endpoint_labels23
.cc_bottom cc_61
.cc_top cc_62,.Lxta.endpoint_labels24
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	332
	.long	.Lxta.endpoint_labels24
.cc_bottom cc_62
.cc_top cc_63,.Lxta.endpoint_labels25
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	333
	.long	.Lxta.endpoint_labels25
.cc_bottom cc_63
.cc_top cc_64,.Lxta.endpoint_labels26
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	334
	.long	.Lxta.endpoint_labels26
.cc_bottom cc_64
.cc_top cc_65,.Lxta.endpoint_labels27
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	335
	.long	.Lxta.endpoint_labels27
.cc_bottom cc_65
.cc_top cc_66,.Lxta.endpoint_labels28
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	336
	.long	.Lxta.endpoint_labels28
.cc_bottom cc_66
.cc_top cc_67,.Lxta.endpoint_labels29
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	337
	.long	.Lxta.endpoint_labels29
.cc_bottom cc_67
.cc_top cc_68,.Lxta.endpoint_labels30
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	338
	.long	.Lxta.endpoint_labels30
.cc_bottom cc_68
.cc_top cc_69,.Lxta.endpoint_labels31
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	339
	.long	.Lxta.endpoint_labels31
.cc_bottom cc_69
.cc_top cc_70,.Lxta.endpoint_labels32
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	340
	.long	.Lxta.endpoint_labels32
.cc_bottom cc_70
.cc_top cc_71,.Lxta.endpoint_labels33
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	341
	.long	.Lxta.endpoint_labels33
.cc_bottom cc_71
.cc_top cc_72,.Lxta.endpoint_labels34
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	342
	.long	.Lxta.endpoint_labels34
.cc_bottom cc_72
.cc_top cc_73,.Lxta.endpoint_labels35
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	343
	.long	.Lxta.endpoint_labels35
.cc_bottom cc_73
.cc_top cc_74,.Lxta.endpoint_labels36
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	415
	.long	.Lxta.endpoint_labels36
.cc_bottom cc_74
.Lentries_end3:
	.section	.xtalabeltable,"",@progbits
.Lentries_start4:
	.long	.Lentries_end5-.Lentries_start4
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_75,.Lxtalabel0
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	48
	.long	76
	.long	.Lxtalabel0
.cc_bottom cc_75
.cc_top cc_76,.Lxtalabel2
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	77
	.long	80
	.long	.Lxtalabel2
.cc_bottom cc_76
.cc_top cc_77,.Lxtalabel3
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	81
	.long	82
	.long	.Lxtalabel3
.cc_bottom cc_77
.cc_top cc_78,.Lxtalabel5
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	81
	.long	82
	.long	.Lxtalabel5
.cc_bottom cc_78
.cc_top cc_79,.Lxtalabel4
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	81
	.long	82
	.long	.Lxtalabel4
.cc_bottom cc_79
.cc_top cc_80,.Lxtalabel5
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	83
	.long	91
	.long	.Lxtalabel5
.cc_bottom cc_80
.cc_top cc_81,.Lxtalabel4
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	83
	.long	91
	.long	.Lxtalabel4
.cc_bottom cc_81
.cc_top cc_82,.Lxtalabel3
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	83
	.long	91
	.long	.Lxtalabel3
.cc_bottom cc_82
.cc_top cc_83,.Lxtalabel6
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	93
	.long	101
	.long	.Lxtalabel6
.cc_bottom cc_83
.cc_top cc_84,.Lxtalabel7
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	116
	.long	117
	.long	.Lxtalabel7
.cc_bottom cc_84
.cc_top cc_85,.Lxtalabel8
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	116
	.long	117
	.long	.Lxtalabel8
.cc_bottom cc_85
.cc_top cc_86,.Lxtalabel14
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	118
	.long	124
	.long	.Lxtalabel14
.cc_bottom cc_86
.cc_top cc_87,.Lxtalabel15
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	118
	.long	124
	.long	.Lxtalabel15
.cc_bottom cc_87
.cc_top cc_88,.Lxtalabel14
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	212
	.long	215
	.long	.Lxtalabel14
.cc_bottom cc_88
.cc_top cc_89,.Lxtalabel15
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	212
	.long	215
	.long	.Lxtalabel15
.cc_bottom cc_89
.cc_top cc_90,.Lxtalabel14
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	223
	.long	229
	.long	.Lxtalabel14
.cc_bottom cc_90
.cc_top cc_91,.Lxtalabel15
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	223
	.long	229
	.long	.Lxtalabel15
.cc_bottom cc_91
.cc_top cc_92,.Lxtalabel13
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	230
	.long	235
	.long	.Lxtalabel13
.cc_bottom cc_92
.cc_top cc_93,.Lxtalabel16
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	236
	.long	240
	.long	.Lxtalabel16
.cc_bottom cc_93
.cc_top cc_94,.Lxtalabel17
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	241
	.long	245
	.long	.Lxtalabel17
.cc_bottom cc_94
.cc_top cc_95,.Lxtalabel18
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	246
	.long	250
	.long	.Lxtalabel18
.cc_bottom cc_95
.cc_top cc_96,.Lxtalabel19
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	251
	.long	255
	.long	.Lxtalabel19
.cc_bottom cc_96
.cc_top cc_97,.Lxtalabel9
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	256
	.long	260
	.long	.Lxtalabel9
.cc_bottom cc_97
.cc_top cc_98,.Lxtalabel20
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	261
	.long	264
	.long	.Lxtalabel20
.cc_bottom cc_98
.cc_top cc_99,.Lxtalabel9
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	265
	.long	265
	.long	.Lxtalabel9
.cc_bottom cc_99
.cc_top cc_100,.Lxtalabel20
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	265
	.long	265
	.long	.Lxtalabel20
.cc_bottom cc_100
.cc_top cc_101,.Lxtalabel11
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	266
	.long	268
	.long	.Lxtalabel11
.cc_bottom cc_101
.cc_top cc_102,.Lxtalabel10
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	266
	.long	268
	.long	.Lxtalabel10
.cc_bottom cc_102
.cc_top cc_103,.Lxtalabel12
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	266
	.long	268
	.long	.Lxtalabel12
.cc_bottom cc_103
.cc_top cc_104,.Lxtalabel12
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	269
	.long	269
	.long	.Lxtalabel12
.cc_bottom cc_104
.cc_top cc_105,.Lxtalabel11
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	269
	.long	269
	.long	.Lxtalabel11
.cc_bottom cc_105
.cc_top cc_106,.Lxtalabel10
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	269
	.long	269
	.long	.Lxtalabel10
.cc_bottom cc_106
.cc_top cc_107,.Lxtalabel12
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	270
	.long	272
	.long	.Lxtalabel12
.cc_bottom cc_107
.cc_top cc_108,.Lxtalabel11
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	270
	.long	272
	.long	.Lxtalabel11
.cc_bottom cc_108
.cc_top cc_109,.Lxtalabel10
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	270
	.long	272
	.long	.Lxtalabel10
.cc_bottom cc_109
.cc_top cc_110,.Lxtalabel8
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	275
	.long	276
	.long	.Lxtalabel8
.cc_bottom cc_110
.cc_top cc_111,.Lxtalabel7
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	275
	.long	276
	.long	.Lxtalabel7
.cc_bottom cc_111
.cc_top cc_112,.Lxtalabel1
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	277
	.long	296
	.long	.Lxtalabel1
.cc_bottom cc_112
.cc_top cc_113,.Lxtalabel21
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	305
	.long	313
	.long	.Lxtalabel21
.cc_bottom cc_113
.cc_top cc_114,.Lxtalabel22
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	314
	.long	315
	.long	.Lxtalabel22
.cc_bottom cc_114
.cc_top cc_115,.Lxtalabel22
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	328
	.long	381
	.long	.Lxtalabel22
.cc_bottom cc_115
.cc_top cc_116,.Lxtalabel23
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	382
	.long	382
	.long	.Lxtalabel23
.cc_bottom cc_116
.cc_top cc_117,.Lxtalabel24
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	388
	.long	392
	.long	.Lxtalabel24
.cc_bottom cc_117
.cc_top cc_118,.Lxtalabel25
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	393
	.long	397
	.long	.Lxtalabel25
.cc_bottom cc_118
.cc_top cc_119,.Lxtalabel26
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	402
	.long	403
	.long	.Lxtalabel26
.cc_bottom cc_119
.cc_top cc_120,.Lxtalabel27
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	404
	.long	408
	.long	.Lxtalabel27
.cc_bottom cc_120
.cc_top cc_121,.Lxtalabel28
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	412
	.long	417
	.long	.Lxtalabel28
.cc_bottom cc_121
.Lentries_end5:
	.section	.xtalooplabeltable,"",@progbits
.Lentries_start6:
	.long	.Lentries_end7-.Lentries_start6
	.long	0
	.ascii	 "/home/sld-user/swallow/swallow_scripting/src-back"
	.byte	0
.cc_top cc_122,.Lxta.loop_labels0
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	118
	.long	124
	.long	.Lxta.loop_labels0
.cc_bottom cc_122
.cc_top cc_123,.Lxta.loop_labels0
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	212
	.long	215
	.long	.Lxta.loop_labels0
.cc_bottom cc_123
.cc_top cc_124,.Lxta.loop_labels0
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	223
	.long	265
	.long	.Lxta.loop_labels0
.cc_bottom cc_124
.cc_top cc_125,.Lxta.loop_labels1
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	314
	.long	315
	.long	.Lxta.loop_labels1
.cc_bottom cc_125
.cc_top cc_126,.Lxta.loop_labels1
	.ascii	 "Power_Measure_Lib.xc"
	.byte	0
	.long	328
	.long	381
	.long	.Lxta.loop_labels1
.cc_bottom cc_126
.Lentries_end7:
