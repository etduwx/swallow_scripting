	.file	"Swallow-nOS_initialFunctions.c"

.set getStartAddress.locnoside, 1

.set getStartAddress.locnochandec, 1

.set allocateChanByRef.locnoside, 1

.set allocateChanByRef.locnochandec, 1

.set select1A.locnoside, 1

.set select1A.locnochandec, 1

.set installHandlerToFoo.locnoside, 1

.set installHandlerToFoo.locnochandec, 1

.set fooEventHandler.locnoside, 1

.set fooEventHandler.locnochandec, 1


	.text
	.globl	getStartAddress
	.align	2
	.type	getStartAddress,@function
	.cc_top getStartAddress.function
getStartAddress:
	entsp 1
	ldap r11, sobel_child
	stw r11, sp[0]
	ldaw r1, sp[0]
	ldw r0, r1[r0]
	retsp 1
	.cc_bottom getStartAddress.function
	.set	getStartAddress.nstackwords,1
	.globl	getStartAddress.nstackwords
	.set	getStartAddress.maxcores,1
	.globl	getStartAddress.maxcores
	.set	getStartAddress.maxtimers,0
	.globl	getStartAddress.maxtimers
	.set	getStartAddress.maxchanends,0
	.globl	getStartAddress.maxchanends
.Ltmp0:
	.size	getStartAddress, .Ltmp0-getStartAddress

	.globl	allocateChanByRef
	.align	2
	.type	allocateChanByRef,@function
	.cc_top allocateChanByRef.function
allocateChanByRef:
	ldc r1, 2
	stw r1, r0[0]
	retsp 0
	.cc_bottom allocateChanByRef.function
	.set	allocateChanByRef.nstackwords,0
	.globl	allocateChanByRef.nstackwords
	.set	allocateChanByRef.maxcores,1
	.globl	allocateChanByRef.maxcores
	.set	allocateChanByRef.maxtimers,0
	.globl	allocateChanByRef.maxtimers
	.set	allocateChanByRef.maxchanends,0
	.globl	allocateChanByRef.maxchanends
.Ltmp1:
	.size	allocateChanByRef, .Ltmp1-allocateChanByRef

	.globl	select1A
	.align	2
	.type	select1A,@function
	.cc_top select1A.function
select1A:
	entsp 1
	bl select1B
	retsp 1
	.cc_bottom select1A.function
	.set	select1A.nstackwords,(select1B.nstackwords + 1)
	.globl	select1A.nstackwords
	.set	select1A.maxcores,select1B.maxcores $M 1
	.globl	select1A.maxcores
	.set	select1A.maxtimers,select1B.maxtimers $M 0
	.globl	select1A.maxtimers
	.set	select1A.maxchanends,select1B.maxchanends $M 0
	.globl	select1A.maxchanends
.Ltmp2:
	.size	select1A, .Ltmp2-select1A

	.globl	installHandlerToFoo
	.align	2
	.type	installHandlerToFoo,@function
	.cc_top installHandlerToFoo.function
installHandlerToFoo:
	entsp 1
	ldap r11, fooEventHandler
	mov r1, r11
	bl nOS_addEventHandler
	retsp 1
	.cc_bottom installHandlerToFoo.function
	.set	installHandlerToFoo.nstackwords,(nOS_addEventHandler.nstackwords + 1)
	.globl	installHandlerToFoo.nstackwords
	.set	installHandlerToFoo.maxcores,nOS_addEventHandler.maxcores $M 1
	.globl	installHandlerToFoo.maxcores
	.set	installHandlerToFoo.maxtimers,nOS_addEventHandler.maxtimers $M 0
	.globl	installHandlerToFoo.maxtimers
	.set	installHandlerToFoo.maxchanends,nOS_addEventHandler.maxchanends $M 0
	.globl	installHandlerToFoo.maxchanends
.Ltmp3:
	.size	installHandlerToFoo, .Ltmp3-installHandlerToFoo

	.globl	fooEventHandler
	.align	2
	.type	fooEventHandler,@function
	.cc_top fooEventHandler.function
fooEventHandler:
	entsp 1
	bl nOS_getEventID
	bl channelReceiveWord
	retsp 1
	.cc_bottom fooEventHandler.function
	.set	fooEventHandler.nstackwords,((nOS_getEventID.nstackwords $M channelReceiveWord.nstackwords) + 1)
	.globl	fooEventHandler.nstackwords
	.set	fooEventHandler.maxcores,channelReceiveWord.maxcores $M nOS_getEventID.maxcores $M 1
	.globl	fooEventHandler.maxcores
	.set	fooEventHandler.maxtimers,channelReceiveWord.maxtimers $M nOS_getEventID.maxtimers $M 0
	.globl	fooEventHandler.maxtimers
	.set	fooEventHandler.maxchanends,channelReceiveWord.maxchanends $M nOS_getEventID.maxchanends $M 0
	.globl	fooEventHandler.maxchanends
.Ltmp4:
	.size	fooEventHandler, .Ltmp4-fooEventHandler


	.typestring getStartAddress, "f{ui}(ui)"
	.typestring sobel_child, "f{0}(ui,ui)"
	.typestring allocateChanByRef, "f{0}(p(ui))"
	.typestring select1A, "f{0}(ui,ui)"
	.typestring select1B, "f{0}(ui,ui)"
	.typestring installHandlerToFoo, "f{0}(ui)"
	.typestring nOS_addEventHandler, "f{0}(ui,ui)"
	.typestring fooEventHandler, "f{0}()"
	.typestring nOS_getEventID, "f{ui}()"
	.typestring channelReceiveWord, "f{ui}(ui)"
	.ident	"GCC: (GNU) 4.2.1 (LLVM build) XMOS 12.2.0 (build 7741)"
