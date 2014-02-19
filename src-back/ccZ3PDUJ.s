# 1 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.S"
# 15 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.S"
.section .text

.cc_top xmp16Assert.elim, xmp16Assert
.globl xmp16Assert
.global xmp16Assert.nstackwords
.linkset xmp16Assert.nstackwords, 0
.global xmp16Assert.maxtimers
.linkset xmp16Assert.maxtimers, 0
.global xmp16Assert.maxchanends
.linkset xmp16Assert.maxchanends, 0
.global xmp16Assert.maxthreads
.linkset xmp16Assert.maxthreads, 1
.align 4
xmp16Assert:
  ecallf r0
	retsp 0x0
.cc_bottom xmp16Assert.elim

.cc_top getChanend.elim, getChanend
.globl getChanend
.global getChanend.nstackwords
.linkset getChanend.nstackwords, 0
.global getChanend.maxtimers
.linkset getChanend.maxtimers, 0
.global getChanend.maxchanends
.linkset getChanend.maxchanends, 1
.global getChanend.maxthreads
.linkset getChanend.maxthreads, 1
.align 4
getChanend:
	getr r1,2
	bf r1,retGetChanend
	setd res[r1],r0
retGetChanend:
	mov r0,r1
	retsp 0
.cc_bottom getChanend.elim

.cc_top setDestination.elim, setDestination
.globl setDestination
.global setDestination.nstackwords
.linkset setDestination.nstackwords, 0
.global setDestination.maxtimers
.linkset setDestination.maxtimers, 0
.global setDestination.maxchanends
.linkset setDestination.maxchanends, 0
.global setDestination.maxthreads
.linkset setDestination.maxthreads, 1
.align 4
setDestination:
	setd res[r0],r1
	retsp 0
.cc_bottom setDestination.elim

.cc_top getRemoteChanendId.elim, getRemoteChanendId
.globl getRemoteChanendId
.global getRemoteChanendId.nstackwords
.linkset getRemoteChanendId.nstackwords, 0
.global getRemoteChanendId.maxtimers
.linkset getRemoteChanendId.maxtimers, 0
.global getRemoteChanendId.maxchanends
.linkset getRemoteChanendId.maxchanends, 0
.global getRemoteChanendId.maxthreads
.linkset getRemoteChanendId.maxthreads, 1
.align 4
getRemoteChanendId:
	getd r0,res[r0]
	retsp 0
.cc_bottom getRemoteChanendId.elim

.cc_top getRemoteStreamingChanendId.elim, getRemoteStreamingChanendId
.globl getRemoteStreamingChanendId
.global getRemoteStreamingChanendId.nstackwords
.linkset getRemoteStreamingChanendId.nstackwords, 0
.global getRemoteStreamingChanendId.maxtimers
.linkset getRemoteStreamingChanendId.maxtimers, 0
.global getRemoteStreamingChanendId.maxchanends
.linkset getRemoteStreamingChanendId.maxchanends, 0
.global getRemoteStreamingChanendId.maxthreads
.linkset getRemoteStreamingChanendId.maxthreads, 1
.align 4
getRemoteStreamingChanendId:
	getd r0,res[r0]
	retsp 0
.cc_bottom getRemoteStreamingChanendId.elim

.cc_top getLocalChanendId.elim, getLocalChanendId
.globl getLocalChanendId
.global getLocalChanendId.nstackwords
.linkset getLocalChanendId.nstackwords, 0
.global getLocalChanendId.maxtimers
.linkset getLocalChanendId.maxtimers, 0
.global getLocalChanendId.maxchanends
.linkset getLocalChanendId.maxchanends, 0
.global getLocalChanendId.maxthreads
.linkset getLocalChanendId.maxthreads, 1
.align 4
getLocalChanendId:
	retsp 0
.cc_bottom getLocalChanendId.elim

.cc_top getLocalStreamingChanendId.elim, getLocalStreamingChanendId
.globl getLocalStreamingChanendId
.global getLocalStreamingChanendId.nstackwords
.linkset getLocalStreamingChanendId.nstackwords, 0
.global getLocalStreamingChanendId.maxtimers
.linkset getLocalStreamingChanendId.maxtimers, 0
.global getLocalStreamingChanendId.maxchanends
.linkset getLocalStreamingChanendId.maxchanends, 0
.global getLocalStreamingChanendId.maxthreads
.linkset getLocalStreamingChanendId.maxthreads, 1
.align 4
getLocalStreamingChanendId:
	retsp 0
.cc_bottom getLocalStreamingChanendId.elim

.cc_top outUint.elim, outUint
.globl outUint
.global outUint.nstackwords
.linkset outUint.nstackwords, 0
.global outUint.maxtimers
.linkset outUint.maxtimers, 0
.global outUint.maxchanends
.linkset outUint.maxchanends, 0
.global outUint.maxthreads
.linkset outUint.maxthreads, 1
.align 4
outUint:



	out res[r0],r1
	outct res[r0],2



	retsp 0x0
.cc_bottom outUint.elim

.cc_top outByte.elim, outByte
.globl outByte
.global outByte.nstackwords
.linkset outByte.nstackwords, 0
.global outByte.maxtimers
.linkset outByte.maxtimers, 0
.global outByte.maxchanends
.linkset outByte.maxchanends, 0
.global outByte.maxthreads
.linkset outByte.maxthreads, 1
.align 4
outByte:



	outt res[r0],r1



	retsp 0x0
.cc_bottom outByte.elim

.cc_top inUint.elim, inUint
.globl inUint
.global inUint.nstackwords
.linkset inUint.nstackwords, 0
.global inUint.maxtimers
.linkset inUint.maxtimers, 0
.global inUint.maxchanends
.linkset inUint.maxchanends, 0
.global inUint.maxthreads
.linkset inUint.maxthreads, 1
.align 4
inUint:


	in r1,res[r0]


	mov r0,r1
	retsp 0x0
.cc_bottom inUint.elim

.cc_top inByte.elim, inByte
.globl inByte
.global inByte.nstackwords
.linkset inByte.nstackwords, 0
.global inByte.maxtimers
.linkset inByte.maxtimers, 0
.global inByte.maxchanends
.linkset inByte.maxchanends, 0
.global inByte.maxthreads
.linkset inByte.maxthreads, 1
.align 4
inByte:


	int r1,res[r0]


	mov r0,r1
	retsp 0x0
.cc_bottom inByte.elim

.cc_top closeChanend.elim, closeChanend
.globl closeChanend
.global closeChanend.nstackwords
.linkset closeChanend.nstackwords, 0
.global closeChanend.maxtimers
.linkset closeChanend.maxtimers, 0
.global closeChanend.maxchanends
.linkset closeChanend.maxchanends, 0
.global closeChanend.maxthreads
.linkset closeChanend.maxthreads, 1
.align 4

closeChanend:
	getd r1,res[r0]
	lsu r2,r1,r0
	bt r2,closeMeSecond
	outct res[r0],1
	chkct res[r0],1
	bu closeEnd
closeMeSecond:
	chkct res[r0],1
	outct res[r0],1
closeEnd:
	retsp 0x0
.cc_bottom closeChanend.elim

.cc_top getLocalAnonChanend.elim, getLocalAnonChanend
.globl getLocalAnonChanend
.global getLocalAnonChanend.nstackwords
.linkset getLocalAnonChanend.nstackwords, 0
.global getLocalAnonChanend.maxtimers
.linkset getLocalAnonChanend.maxtimers, 0
.global getLocalAnonChanend.maxchanends
.linkset getLocalAnonChanend.maxchanends, 0
.global getLocalAnonChanend.maxthreads
.linkset getLocalAnonChanend.maxthreads, 1
.align 4
getLocalAnonChanend:
	getr r0,0x2
	retsp 0x0
.cc_bottom getLocalAnonChanend.elim

.cc_top startTransactionClient.elim, startTransactionClient
.globl startTransactionClient
.global startTransactionClient.nstackwords
.linkset startTransactionClient.nstackwords, 3
.global startTransactionClient.maxtimers
.linkset startTransactionClient.maxtimers, 0
.global startTransactionClient.maxchanends
.linkset startTransactionClient.maxchanends, 0
.global startTransactionClient.maxthreads
.linkset startTransactionClient.maxthreads, 1
.align 4
startTransactionClient:
  entsp 0x2
	stw r4,sp[1]
	setd res[r0],r1
	out res[r0],r0
# 278 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.S"
	in r4,res[r0]
	eq r1,r4,r1
	ecallf r1
	outt res[r0],r2
	out res[r0],r3
	ldw r4,sp[1]
	ldc r0,1
	retsp 0x2
transactionClientShouldBackoff:
  chkct res[r0],0x1
  outct res[r0],0x1
	ldw r4,sp[1]
	ldc r0,0
	retsp 0x2
.cc_bottom startTransactionClient.elim

.cc_top pauseTransactionClient.elim, pauseTransactionClient
.globl pauseTransactionClient
.global pauseTransactionClient.nstackwords
.linkset pauseTransactionClient.nstackwords, 0
.global pauseTransactionClient.maxtimers
.linkset pauseTransactionClient.maxtimers, 0
.global pauseTransactionClient.maxchanends
.linkset pauseTransactionClient.maxchanends, 0
.global pauseTransactionClient.maxthreads
.linkset pauseTransactionClient.maxthreads, 1
.align 4
pauseTransactionClient:
	outct res[r0],0x1
	chkct res[r0],0x1
	retsp 0x0
.cc_bottom pauseTransactionClient.elim

.cc_top resumeTransactionClient.elim, resumeTransactionClient
.globl resumeTransactionClient
.global resumeTransactionClient.nstackwords
.linkset resumeTransactionClient.nstackwords, 0
.global resumeTransactionClient.maxtimers
.linkset resumeTransactionClient.maxtimers, 0
.global resumeTransactionClient.maxchanends
.linkset resumeTransactionClient.maxchanends, 0
.global resumeTransactionClient.maxthreads
.linkset resumeTransactionClient.maxthreads, 1
.align 4
resumeTransactionClient:
	setd res[r0],r1
	out res[r0],r0
	in r2,res[r0]
	eq r1,r2,r1
	ecallf r1
	retsp 0x0
.cc_bottom resumeTransactionClient.elim

.cc_top endTransactionClient.elim, endTransactionClient
.globl endTransactionClient
.global endTransactionClient.nstackwords
.linkset endTransactionClient.nstackwords, 0
.global endTransactionClient.maxtimers
.linkset endTransactionClient.maxtimers, 0
.global endTransactionClient.maxchanends
.linkset endTransactionClient.maxchanends, 0
.global endTransactionClient.maxthreads
.linkset endTransactionClient.maxthreads, 1
.align 4
endTransactionClient:
	outct res[r0],0x1
	chkct res[r0],0x1
	retsp 0x0
.cc_bottom endTransactionClient.elim

.cc_top startBurstClient.elim, startBurstClient
.globl startBurstClient
.global startBurstClient.nstackwords
.linkset startBurstClient.nstackwords, 0
.global startBurstClient.maxtimers
.linkset startBurstClient.maxtimers, 0
.global startBurstClient.maxchanends
.linkset startBurstClient.maxchanends, 0
.global startBurstClient.maxthreads
.linkset startBurstClient.maxthreads, 1
.align 4
startBurstClient:
	setd res[r0],r1
	out res[r0],r0
	out res[r0],r2
	out res[r0],r3
	retsp 0x0
.cc_bottom startBurstClient.elim

.cc_top endBurstClient.elim, endBurstClient
.globl endBurstClient
.global endBurstClient.nstackwords
.linkset endBurstClient.nstackwords, 0
.global endBurstClient.maxtimers
.linkset endBurstClient.maxtimers, 0
.global endBurstClient.maxchanends
.linkset endBurstClient.maxchanends, 0
.global endBurstClient.maxthreads
.linkset endBurstClient.maxthreads, 1
.align 4
endBurstClient:
	outct res[r0],0x1
	retsp 0x0
.cc_bottom endBurstClient.elim

.cc_top startBurstServer.elim, startBurstServer
.globl startBurstServer
.global startBurstServer.nstackwords
.linkset startBurstServer.nstackwords, 2
.global startBurstServer.maxtimers
.linkset startBurstServer.maxtimers, 0
.global startBurstServer.maxchanends
.linkset startBurstServer.maxchanends, 0
.global startBurstServer.maxthreads
.linkset startBurstServer.maxthreads, 1
.align 4
startBurstServer:
  entsp 0x1
  stw r3,sp[0]
  in r3,res[r0]
  stw r3,r1[0]
  in r3,res[r0]
  stw r3,r2[0]
  in r0,res[r0]
  ldw r3,sp[0]
  stw r0,r3[0]
	retsp 0x1
.cc_bottom startBurstServer.elim

.cc_top endBurstServer.elim, endBurstServer
.globl endBurstServer
.global endBurstServer.nstackwords
.linkset endBurstServer.nstackwords, 0
.global endBurstServer.maxtimers
.linkset endBurstServer.maxtimers, 0
.global endBurstServer.maxchanends
.linkset endBurstServer.maxchanends, 0
.global endBurstServer.maxthreads
.linkset endBurstServer.maxthreads, 1
.align 4
endBurstServer:
	chkct res[r0],0x1
	retsp 0x0
.cc_bottom endBurstServer.elim


.cc_top startnOSBurstClient.elim, startnOSBurstClient
.globl startnOSBurstClient
.global startnOSBurstClient.nstackwords
.linkset startnOSBurstClient.nstackwords, 0
.global startnOSBurstClient.maxtimers
.linkset startnOSBurstClient.maxtimers, 0
.global startnOSBurstClient.maxchanends
.linkset startnOSBurstClient.maxchanends, 0
.global startnOSBurstClient.maxthreads
.linkset startnOSBurstClient.maxthreads, 1
.align 4
startnOSBurstClient:
	setd res[r0],r1
	out res[r0],r0
	out res[r0],r2
	out res[r0],r3
	retsp 0x0
.cc_bottom startnOSBurstClient.elim

.cc_top endnOSBurstClient.elim, endnOSBurstClient
.globl endnOSBurstClient
.global endnOSBurstClient.nstackwords
.linkset endnOSBurstClient.nstackwords, 0
.global endnOSBurstClient.maxtimers
.linkset endnOSBurstClient.maxtimers, 0
.global endnOSBurstClient.maxchanends
.linkset endnOSBurstClient.maxchanends, 0
.global endnOSBurstClient.maxthreads
.linkset endnOSBurstClient.maxthreads, 1
.align 4
endnOSBurstClient:
	outct res[r0],0x1
	retsp 0x0
.cc_bottom endnOSBurstClient.elim



.cc_top startTransactionServer.elim, startTransactionServer
.globl startTransactionServer
.global startTransactionServer.nstackwords
.linkset startTransactionServer.nstackwords, 3
.global startTransactionServer.maxtimers
.linkset startTransactionServer.maxtimers, 0
.global startTransactionServer.maxchanends
.linkset startTransactionServer.maxchanends, 0
.global startTransactionServer.maxthreads
.linkset startTransactionServer.maxthreads, 1
.align 4
startTransactionServer:
  entsp 0x2
  stw r4,sp[1]
  in r4,res[r0]
  setd res[r0],r4
  out res[r0],r0
  stw r4,r1[0]
  int r4,res[r0]
  stw r4,r2[0]
  in r4,res[r0]
  stw r4,r3[0]
  ldw r4,sp[1]
	retsp 0x2
.cc_bottom startTransactionServer.elim


.cc_top endTransactionServer.elim, endTransactionServer
.globl endTransactionServer
.global endTransactionServer.nstackwords
.linkset endTransactionServer.nstackwords, 0
.global endTransactionServer.maxtimers
.linkset endTransactionServer.maxtimers, 0
.global endTransactionServer.maxchanends
.linkset endTransactionServer.maxchanends, 0
.global endTransactionServer.maxthreads
.linkset endTransactionServer.maxthreads, 1
.align 4
endTransactionServer:
	chkct res[r0],0x1
	outct res[r0],0x1
	retsp 0x0
.cc_bottom endTransactionServer.elim

.cc_top _write_intercept_asm.elim, _write_intercept_asm
.globl _write_intercept_asm
.global _write_intercept_asm.nstackwords
.linkset _write_intercept_asm.nstackwords, 0
.global _write_intercept_asm.maxtimers
.linkset _write_intercept_asm.maxtimers, 0
.global _write_intercept_asm.maxchanends
.linkset _write_intercept_asm.maxchanends, 0
.global _write_intercept_asm.maxthreads
.linkset _write_intercept_asm.maxthreads, 1
.align 4
_write_intercept_asm:
  stw r0,dp[_write_intercept_heap+4]
  stw r1,dp[_write_intercept_heap+8]
  stw r2,dp[_write_intercept_heap+12]
  stw r3,dp[_write_intercept_heap+16]
  stw r4,dp[_write_intercept_heap+20]
  stw r5,dp[_write_intercept_heap+24]
  stw r6,dp[_write_intercept_heap+28]
  stw r7,dp[_write_intercept_heap+32]
  stw r8,dp[_write_intercept_heap+36]
  stw r9,dp[_write_intercept_heap+40]
  stw r10,dp[_write_intercept_heap+44]
  stw r11,dp[_write_intercept_heap+48]
  ldc r3,0x8001
  ldc r4,0x0302
  shl r3,r3,16
  or r3,r3,r4
  getr r0,2
  setd res[r0],r3
  out res[r0],r0
	in r4,res[r0]
	eq r3,r4,r3
	ecallf r3
	ldc r3,1
	outt res[r0],r3
	out res[r0],r2
	ldc r3,0
_write_intercept_loop:
  ld8u r4,r1[r3]
  outt res[r0],r4
  add r3,r3,1
  lsu r4,r3,r2
  bt r4,_write_intercept_loop
_write_intercept_end:
  outct res[r0],0x1
	chkct res[r0],0x1
	freer res[r0]
  ldw r0,dp[_write_intercept_heap+4]
  ldw r1,dp[_write_intercept_heap+8]
  ldw r2,dp[_write_intercept_heap+12]
  ldw r3,dp[_write_intercept_heap+16]
  ldw r4,dp[_write_intercept_heap+20]
  ldw r5,dp[_write_intercept_heap+24]
  ldw r6,dp[_write_intercept_heap+28]
  ldw r7,dp[_write_intercept_heap+32]
  ldw r8,dp[_write_intercept_heap+36]
  ldw r9,dp[_write_intercept_heap+40]
  ldw r10,dp[_write_intercept_heap+44]
  ldw r11,dp[_write_intercept_heap+48]
  ldc r0,0
  retsp 0x0
.cc_bottom _write_intercept_asm.elim




.section .dp.data, "awd", @progbits
.globl _write_intercept_heap
.align 128
_write_intercept_heap:
.word 0xbabecafe
.align 128
