#include <xs1.h>
# from http://www.xmos.com/discuss/viewtopic.php?f=6&t=370

.globl ChanIntHandler.nstackwords
.globl ChanIntHandler.maxthreads
.globl ChanIntHandler.maxtimers
.globl ChanIntHandler.maxchanends

.linkset ChanIntHandler.nstackwords, 0
.linkset ChanIntHandler.maxchanends, 0
.linkset ChanIntHandler.maxtimers, 0
.linkset ChanIntHandler.maxthreads, 0

.globl ChanIntHandler
.text

#On an exception, the processor will save the pc and sr in spc and ssr ,
#disable events and interrupts, and start executing an exception handler. The
#program counter that is saved normally points to the instruction that raised the
#exception. Two registers are also set. The exception-data (ed) and exception-
#type (et) will be set to reflect the cause of the exception. The exception handler
#can choose how to deal with the exception.

ChanIntHandler:
	ldc   r0, 0xb00a
    bl    printhexln
    .syntax architectural
    GETED   # Get environment into r11 (i.e. the resourceid that caused the interrupt). The instruction doesn't seem to compile in default mode (for some reason :(
    .syntax default
    ldc r0, 0x1 # end token value
    chkct  res[r11], r0  # clear interrupt by consuming token
    # to change return address, push address onto stack at offset 1, then do ldspc. Then kret
    ldap r11, ChanIntHandler # Recursive place-holder
    .syntax architectural
    STWSP r11, 0x1
    LDSPC
    .syntax default
    kret


.extern enableChanInterrupt
.globl enableChanInterrupt.nstackwords
.globl enableChanInterrupt.maxthreads
.globl enableChanInterrupt.maxtimers
.globl enableChanInterrupt.maxchanends

.linkset enableChanInterrupt.nstackwords, 0
.linkset enableChanInterrupt.maxchanends, 0
.linkset enableChanInterrupt.maxtimers, 0
.linkset enableChanInterrupt.maxthreads, 0

.globl enableChanInterrupt
.cc_top enableChanInterrupt.func, enableChanInterrupt
.text

enableChanInterrupt:
    ldap       r11, ChanIntHandler                       # Set Event vector
    setv       res[r0], r11
#    add        r11, r0, 0x0
  #  setev	   res[r0], r11                           # store the chanid as the event environment
    setc       res[r0], 0x000a                        # Set IE mode to interrupts
    eeu        res[r0]                                # Enable events/interupts on resource
    setsr      0x2                                    # Enable thread interupts


#Loop:
#    bu        Loop                                    # Loop....

    retsp     0
.cc_bottom enableChanInterrupt.func


# nOS routines
.extern nOS_setControlInterrupt
.globl nOS_setControlInterrupt.nstackwords
.globl nOS_setControlInterrupt.maxthreads
.globl nOS_setControlInterrupt.maxtimers
.globl nOS_setControlInterrupt.maxchanends

.linkset nOS_setControlInterrupt.nstackwords, 0
.linkset nOS_setControlInterrupt.maxchanends, 0
.linkset nOS_setControlInterrupt.maxtimers, 0
.linkset nOS_setControlInterrupt.maxthreads, 0

.globl nOS_setControlInterrupt
.cc_top nOS_setControlInterrupt.func, nOS_setControlInterrupt
.text

nOS_setControlInterrupt:
    ldap       r11, nOS_controlInterruptHandler             # Set Event vector
    setv       res[r0], r11
    setc       res[r0], 0x000a                        # Set IE mode to interrupts
    eeu        res[r0]                                # Enable events/interupts on resource
    setsr      0x2                                    # Enable thread interupts
    retsp      0
.cc_bottom nOS_setControlInterrupt.func

#-------------------------------------------------------

.globl nOS_controlInterruptHandler.nstackwords
.globl nOS_controlInterruptHandler.maxthreads
.globl nOS_controlInterruptHandler.maxtimers
.globl nOS_controlInterruptHandler.maxchanends

.linkset nOS_controlInterruptHandler.nstackwords, 0
.linkset nOS_controlInterruptHandler.maxchanends, 0
.linkset nOS_controlInterruptHandler.maxtimers, 0
.linkset nOS_controlInterruptHandler.maxthreads, 0

.globl nOS_controlInterruptHandler
.cc_top nOS_controlInterruptHandler.func, nOS_controlInterruptHandler
.text

#On an exception, the processor will save the pc and sr in spc and ssr ,
#disable events and interrupts, and start executing an exception handler. The
#program counter that is saved normally points to the instruction that raised the
#exception. Two registers are also set. The exception-data (ed) and exception-
#type (et) will be set to reflect the cause of the exception. The exception handler
#can choose how to deal with the exception.

# protocol for nOS control activity
# send end; wait for end to come back. then send four words of control information. Receive end, send end, done
nOS_controlInterruptHandler:
    get r11, ed # Get environment into r11 (i.e. the resourceid that caused the interrupt).
    # Throw an exception if the channel is not the expected one (31) (node independent)
    ldc r0, 0x1f02
    ldc r1, 0x0000ffff
    and r1, r11, r1
    sub r0, r1, r0
    ecallt r0
    # now do the channel communication
    chkct  res[r11], 0x1
    in	   r0, res[r11]
    setd   res[r11], r0
    outct  res[r11], 0x1
    in     r0, res[r11]
    in     r1, res[r11]
    in     r2, res[r11]
    outct  res[r11], 0x1
    chkct  res[r11], 0x1

    bl nOS_doAction
    # out    r[r11 # TODO!!! # reply to the sender
    # to change return address, push address onto stack at offset 1, then do ldspc. Then kret
    #ldap r11, nOS_doInterruptAction
    #.syntax architectural
    #STWSP r11, 0x1
    #LDSPC
    #.syntax default
    kret

.cc_bottom nOS_controlInterruptHandler.func



.globl nOS_requestAction.nstackwords
.globl nOS_requestAction.maxthreads
.globl nOS_requestAction.maxtimers
.globl nOS_requestAction.maxchanends

.linkset nOS_requestAction.nstackwords, 0
.linkset nOS_requestAction.maxchanends, 2
.linkset nOS_requestAction.maxtimers, 0
.linkset nOS_requestAction.maxthreads, 0

.globl nOS_requestAction
.cc_top nOS_requestAction.func, nOS_requestAction
.text


# protocol for nOS control activity
# send end; wait for end to come back. then send four words of control information. Receive end, send end, done
nOS_requestAction:
	entsp 0
    # get a free chanend
	getr r11, 0x02
	# trap if not available
	ecallf r11
    # now do the channel communication to the request channel (send my ID)
    setd   res[r11], r0
# DEBUG LINE NEXT
   # stw    r0, sp[0]
    out    res[r11], r11
    outct  res[r11], 0x1

    # receive the nOS response channel and communicate over it
    in r0, res[r11]
    chkct res[r11], 0x1
    setd res[r11], r0

    # send the action
    out    res[r11], r1
    out    res[r11], r2
    out    res[r11], r3
    ldw    r0, sp[1]
    out    res[r11], r0
    outct res[r11], 0x1 # close channel whilst OS processes action

    # receive the response
    # DEBUG LINE
    getd   r2, res[r11]
    in     r0, res[r11]
    chkct  res[r11], 0x1
    freer  res[r11]
    retsp 0

.cc_bottom nOS_requestAction.func



.globl nOS_listenForAction.nstackwords
.globl nOS_listenForAction.maxthreads
.globl nOS_listenForAction.maxtimers
.globl nOS_listenForAction.maxchanends

.linkset nOS_listenForAction.nstackwords, 5
.linkset nOS_listenForAction.maxchanends, 2
.linkset nOS_listenForAction.maxtimers, 0
.linkset nOS_listenForAction.maxthreads, 0

.globl nOS_listenForAction
.cc_top nOS_listenForAction.func, nOS_listenForAction
.text


# protocol for nOS control activity
# send end; wait for end to come back. then send four words of control information. Receive end, send end, done
# listenForAction has chanend in r0, chanMap in r1
nOS_listenForAction:
	entsp  5
	stw r1, sp[1] # store the stacks start address
	stw r2, sp[2] # store the chanMap

	# listen on the listen channel
    in	   r1, res[r0]
    # DEBUG: store on stack for later
    stw    r1, sp[4]
    chkct res[r0], 0x1

    # now create the response channel and process the request on it
    getr   r11, 0x2
    ecallf r11
    setd   res[r11], r1
    out    res[r11], r11
    outct  res[r11], 0x1 # close outward channel

    in     r0, res[r11]
    in     r1, res[r11]
    in     r2, res[r11]
    in     r3, res[r11]

	# close channel whilst OS processes action
	chkct  res[r11], 0x1

	#  r11 is not preserved across call
	# to make room for 1 var + lr, entsp 2 then first var is stored at sp[1]. lr will end up at sp[2].
	# Don't store anything permanent at sp[0], since callee will overwrite, according to ABI.
	stw r11, sp[3]
    # do the action, returning the result in r0
    bl nOS_doAction

    ldw r11, sp[3]
    #DEBUG TWO LINES
#    ldw r3, sp[4]
 #   setd  res[r11], r3
     getd  r3, res[r11]
     out   res[r11], r0  # send the result back to the requestor

	# close channel
    outct  res[r11], 0x1
    freer  res[r11]

    retsp 5

.cc_bottom nOS_listenForAction.func

#------------

#--------------

.globl nOS_createThread.nstackwords
.globl nOS_createThread.maxthreads
.globl nOS_createThread.maxtimers
.globl nOS_createThread.maxchanends

.linkset nOS_createThread.nstackwords, 2
.linkset nOS_createThread.maxchanends, 0
.linkset nOS_createThread.maxtimers, 0
.linkset nOS_createThread.maxthreads, 1

.globl nOS_createThread
.cc_top nOS_createThread.func, nOS_createThread
.text


    # coming in: r0 has parent thread ID, r1 has start address, r2 has child rank, r3 has stack base address
nOS_createThread:
	entsp 2

	# get a new thread
	stw r3, sp[1]
	getr r3, 0x4
	init t[r3]:pc, r1 # set start to the passed start address

	ldaw r11, cp[_cp]
	init t[r3]:cp, r11 # set constant pool
	ldaw r11, cp[_dp]
	init t[r3]:dp, r11 # set data pointer
	ldap r11, nOS_threadFree # free thread if it runs out of scope
	init t[r3]:lr, r11 # set return address to free
	# initialise the stack pointer into one of the OS's pre-allocated stack areas
	shr r1, r3, 0x8 # first get thread ID
	ldc r11, 0x000000ff
	and r1, r1, r11
	add r1, r1, 0x1 # let's get top of stack not bottom
	ldc r11, 2048   # This is the stack size. TODO: this value needs to be automated
	mul r1, r1, r11  # scale up offset by size of the stacks
	#ldaw r11, dp[nOS_threadStacks] # get base address of stack area // TODO: cp/dp
	ldw r11, sp[1] # get stack base address saved value

	add r1, r1, r11  # get this processes' stack location
#	stw r0, r1[0] # store the parent's ID on the child's stack
#	sub r1, r1, 0x4 # decrement the stack pointer
	set t[r3]:r0, r0 #  write the parent's ID to child's r0
	init t[r3]:sp, r1 # initialise stack pointer
	set t[r3]:r1, r2 # and write its rank to r1
	# now all there is to do is to run the thread!
	start t[r3]

	# increment no of threads in existence
	ldw r0, dp[noUserThreadsLock]
	bl ClaimLock
	ldw r1, dp[noUserThreads]
	add r1, r1, 0x1
	stw r1, dp[noUserThreads]
	bl FreeLock


 	# move new thread's ID in format {NODE_16, INDEX_16}to return register
	shr r1, r3, 0x8  # first grab the index
	ldc r0, 0x000000ff
	and r1, r1, r0
	ldc r0, 0x0000ffff # now select off the node id
	shl r0, r0, 0x10
	and r3, r3, r0
	or r0, r1, r3 # and re-combine parts
	retsp 2

.cc_bottom nOS_createThread.func

#----

#--------------

.globl nOS_threadFree.nstackwords
.globl nOS_threadFree.maxthreads
.globl nOS_threadFree.maxtimers
.globl nOS_threadFree.maxchanends

.linkset nOS_threadFree.nstackwords, 0
.linkset nOS_threadFree.maxchanends, 0
.linkset nOS_threadFree.maxtimers, 0
.linkset nOS_threadFree.maxthreads, 0

.globl nOS_threadFree
.cc_top nOS_threadFree.func, nOS_threadFree
.text

# free the running thread. Nice and simple!
nOS_threadFree:
	ldw r0, dp[noUserThreadsLock]
	bl ClaimLock
	ldw r1, dp[noUserThreads]
	sub r1, r1, 0x1
	stw r1, dp[noUserThreads]
	bl FreeLock
	freet

.cc_bottom nOS_threadFree.func


#-----
.globl nOS_getThreadStatus.nstackwords
.globl nOS_getThreadStatus.maxthreads
.globl nOS_getThreadStatus.maxtimers
.globl nOS_getThreadStatus.maxchanends

.linkset nOS_getThreadStatus.nstackwords, 0
.linkset nOS_getThreadStatus.maxchanends, 1
.linkset nOS_getThreadStatus.maxtimers, 0
.linkset nOS_getThreadStatus.maxthreads, 0

.globl nOS_getThreadStatus
.cc_top nOS_getThreadStatus.func, nOS_getThreadStatus
.text

# get running thread status
# takes Node ID to be checked in r0 {0x0000, NodeID}
# thread index to be checked in r1 (0--7)
# returns SR of the requested thread
nOS_getThreadStatus:
	entsp 0
	# sanity check input (range 0--7)
	shr r2, r1, 0x3
	ecallt r2

	# create configuration resource identifier
	# is {NodeID, <0xC2 (PSCTRL) or 0xC3  (SSCTRL)>, 0x0c}
	shl r0, r0, 16
	ldc r2, 0xc20c
	or r0, r0, r2
	# get a chanend to send on
	getr r3, 0x02
	# if no chanend available will be spotted setd exception behaviour
	# set destination as PSSwitch on destination
	setd res[r3], r0
	# send READC control token
	ldc r2, 0xc1
	outct res[r3], r2
	# send return address
	shr r2, r3, 24
	outt res[r3], r2
	shr r2, r3, 16
	outt res[r3], r2
	shr r2, r3, 8
	outt res[r3], r2

	# send requested register (two sets of 16 bits)
	ldc r2, 0x0
	outt res[r3], r2
	# base address of the PC copies
	#ldc r2, 0x40
	# base address of the SR copies
	ldc r2, 0x60

	# select the wanted thread
	add r2, r2, r1
	outt res[r3], r2

	# done for send
	outct res[r3], 0x01

	# now wait for response
	chkct res[r3], 0x3
	in r0, res[r3]
	chkct res[r3], 0x1
	# and free the chanend that was used
	freer res[r3]

	retsp 0

.cc_bottom nOS_getThreadStatus.func

#----------------------


.globl nOS_getThreadStatuses.nstackwords
.globl nOS_getThreadStatuses.maxthreads
.globl nOS_getThreadStatuses.maxtimers
.globl nOS_getThreadStatuses.maxchanends

.linkset nOS_getThreadStatuses.nstackwords, 0
.linkset nOS_getThreadStatuses.maxchanends, 1
.linkset nOS_getThreadStatuses.maxtimers, 0
.linkset nOS_getThreadStatuses.maxthreads, 0

.globl nOS_getThreadStatuses
.cc_top nOS_getThreadStatuses.func, nOS_getThreadStatuses
.text

# get running thread status
# takes Node ID to be checked in r0 {0x0000, NodeID}
# returns a bitmap of waiting threads in r0 ('1' = WAITING)

nOS_getThreadStatuses:
	entsp 0

	# create configuration resource identifier
	# is {NodeID, <0xC2 (PSCTRL) or 0xC3  (SSCTRL)>, 0x0c}
	shl r0, r0, 16
	ldc r2, 0xc20c
	or r0, r0, r2
	# get a chanend to send on
	getr r3, 0x02
	# set destination as PSSwitch on destination
	setd res[r3], r0

	# clear result
	ldc r0, 0x0
	# reset thread counter
	ldc r1, 0x8
nOS_getThreadStatusesLoop:
	# loop maintainance
	sub r1, r1, 0x1
	# move along the result accumulator
	shl r0, r0, 1
	# send READC control token
	ldc r2, 0xc1
	outct res[r3], r2
	# send return address
	shr r2, r3, 24
	outt res[r3], r2
	shr r2, r3, 16
	outt res[r3], r2
	shr r2, r3, 8
	outt res[r3], r2

	# send requested register (two sets of 16 bits)
	ldc r2, 0x0
	outt res[r3], r2
	# base address of the SR copies
	ldc r2, 0x60

	# select the wanted thread
	add r2, r2, r1
	outt res[r3], r2

	# done for send
	outct res[r3], 0x01

	# now wait for response
	chkct res[r3], 0x3
	in r2, res[r3]
	chkct res[r3], 0x1

	# mask off 'WAITING' bit
	# clear all bits to the left of the wanted
	shl r2, r2, 24
	shl r2, r2, 1

	# and to the right
	shr r2, r2, 24
	shr r2, r2, 7

	# or into result
	or r0, r0, r2

	# loop
	bt r1, nOS_getThreadStatusesLoop

	# and free the chanend that was used
	freer res[r3]

	retsp 0

.cc_bottom nOS_getThreadStatuses.func


#------------------


#------------------

.globl nOS_addEventHandler.nstackwords
.globl nOS_addEventHandler.maxthreads
.globl nOS_addEventHandler.maxtimers
.globl nOS_addEventHandler.maxchanends

.linkset nOS_addEventHandler.nstackwords, 0
.linkset nOS_addEventHandler.maxchanends, 0
.linkset nOS_addEventHandler.maxtimers, 0
.linkset nOS_addEventHandler.maxthreads, 0

.globl nOS_addEventHandler
.cc_top nOS_addEventHandler.func, nOS_addEventHandler
.text

# arguments: (channel c, <function pointer> f)
nOS_addEventHandler:
	entsp 0

	# add event vector in addition to others existing
	add r11, r1, 0
	setv res[r0], r11
	eeu res[r0]
	# event may be taken from this point

	retsp 0

.cc_bottom nOS_addEventHandler.func


#---------------------

.globl nOS_waitForEvent.nstackwords
.globl nOS_waitForEvent.maxthreads
.globl nOS_waitForEvent.maxtimers
.globl nOS_waitForEvent.maxchanends

.linkset nOS_waitForEvent.nstackwords, 0
.linkset nOS_waitForEvent.maxchanends, 0
.linkset nOS_waitForEvent.maxtimers, 0
.linkset nOS_waitForEvent.maxthreads, 0

.globl nOS_waitForEvent
.cc_top nOS_waitForEvent.func, nOS_waitForEvent
.text


nOS_waitForEvent:
	entsp 0
	# sleep thread and wait for event
	waiteu
	retsp 0

.cc_bottom nOS_waitForEvent.func

#---------------------

.globl nOS_disableEvent.nstackwords
.globl nOS_disableEvent.maxthreads
.globl nOS_disableEvent.maxtimersth
.globl nOS_disableEvent.maxchanends

.linkset nOS_disableEvent.nstackwords, 0
.linkset nOS_disableEvent.maxchanends, 0
.linkset nOS_disableEvent.maxtimers, 0
.linkset nOS_disableEvent.maxthreads, 0

.globl nOS_disableEvent
.cc_top nOS_disableEvent.func, nOS_disableEvent
.text


nOS_disableEvent:
	entsp 0
	# clear an event on the specified resource (r0)
	edu res[r0]
	retsp 0

.cc_bottom nOS_disableEvent.func



#---------------------

.globl nOS_disableAllEvents.nstackwords
.globl nOS_disableAllEvents.maxthreads
.globl nOS_disableAllEvents.maxtimers
.globl nOS_disableAllEvents.maxchanends

.linkset nOS_disableAllEvents.nstackwords, 0
.linkset nOS_disableAllEvents.maxchanends, 0
.linkset nOS_disableAllEvents.maxtimers, 0
.linkset nOS_disableAllEvents.maxthreads, 0

.globl nOS_disableAllEvents
.cc_top nOS_disableAllEvents.func, nOS_disableAllEvents
.text


nOS_disableAllEvents:
	entsp 0
	# clear all events
	clre
	retsp 0

.cc_bottom nOS_disableAllEvents.func


#---------------------

.globl nOS_setChannelDest.nstackwords
.globl nOS_setChannelDest.maxthreads
.globl nOS_setChannelDest.maxtimers
.globl nOS_setChannelDest.maxchanends

.linkset nOS_setChannelDest.nstackwords, 0
.linkset nOS_setChannelDest.maxchanends, 0
.linkset nOS_setChannelDest.maxtimers, 0
.linkset nOS_setChannelDest.maxthreads, 0

.globl nOS_setChannelDest
.cc_top nOS_setChannelDest.func, nOS_setChannelDest
.text


nOS_setChannelDest:
	entsp 0
	# set channel destination
	setd res[r0], r1
	retsp 0

.cc_bottom nOS_setChannelDest.func


#--------------------------------

.globl nOS_getCommsStats.nstackwords
.globl nOS_getCommsStats.maxthreads
.globl nOS_getCommsStats.maxtimers
.globl nOS_getCommsStats.maxchanends

.linkset nOS_getCommsStats.nstackwords, 0
.linkset nOS_getCommsStats.maxchanends, 0
.linkset nOS_getCommsStats.maxtimers, 0
.linkset nOS_getCommsStats.maxthreads, 0

.globl nOS_getCommsStats
.cc_top nOS_getCommsStats.func, nOS_getCommsStats
.text

# grab a global stats variable and return.
# If this goes wrong it's a) The addressing is incorrect;
# b) Due the need to lock the shared access.
nOS_getCommsStats:
	entsp 0
	# grab the address of the global array
	ldaw r11, dp[COMMS_STATS]
	# add in the offset supplied as an argument and load
	ldw r0, r11[r0]
	retsp 0

.cc_bottom nOS_getCommsStats.func



#---------------------

.globl nOS_getEventID.nstackwords
.globl nOS_getEventID.maxthreads
.globl nOS_getEventID.maxtimers
.globl nOS_getEventID.maxchanends

.linkset nOS_getEventID.nstackwords, 0
.linkset nOS_getEventID.maxchanends, 0
.linkset nOS_getEventID.maxtimers, 0
.linkset nOS_getEventID.maxthreads, 0

.globl nOS_getEventID
.cc_top nOS_getEventID.func, nOS_getEventID
.text


nOS_getEventID:
	entsp 0
	# set channel destination
	get r11, ed
	add r0, r11, 0
	retsp 0

.cc_bottom nOS_getEventID.func


# From http://www.xmos.com/discuss/viewtopic.php?f=7&t=383
# unsigned GetLock()
.extern GetLock
.globl GetLock.nstackwords
.linkset GetLock.nstackwords, 0
.globl GetLock
.text
GetLock:
  getr      r0, 0x5 # SJH Changed to constant 0x5
  retsp    0


# void ClaimLock(lock l)
.extern ClaimLock
.globl ClaimLock.nstackwords
.linkset ClaimLock.nstackwords, 0
.globl ClaimLock
.text
ClaimLock:
  in      r0, res[r0]
  retsp    0


# void FreeLock(lock l)
.extern FreeLock
.globl FreeLock.nstackwords
.linkset FreeLock.nstackwords, 0
.globl FreeLock
.text
FreeLock:
  out      res[r0], r0
  retsp    0


# void FreerLock(lock l)
.extern FreerLock
.globl FreerLock.nstackwords
.linkset FreerLock.nstackwords, 0
.globl FreerLock
.text
FreerLock:
  freer      res[r0]
  retsp    0

# end from http://www.xmos.com/discuss/viewtopic.php?f=7&t=383
