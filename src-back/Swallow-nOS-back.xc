#include <platform.h>
#include <xs1.h>
#include <print.h>
#include <math.h>
#include <stdlib.h> // for exit()

#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_client.h"
#include "Swallow-nOS_initialFunctions.h"
//#include "Swallow-sobel.h"
#include "Swallow-prim.h"
#include "swallow_comms.h"

#define LOCALnOSCHANEND 0x1f02 // hard-coded for core[0] only. TODO: generalise

void addNewChanMapEntry(chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS], channel c, unsigned owner, unsigned index)
{
	unsigned prints[5];
	owner = owner & 0xff ;
	prints[0] = 42;
	prints[1] = owner;
	prints[2] = index;
	prints[3] = c;
	prints[4] = get_local_tile_id();
	//printMany(5,prints);
	chanMap[owner-1][index].chanID = c ;
	
}

channel lookupChanMapEntry(chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS], unsigned owner, unsigned index)
{	
	unsigned prints[5];
	
	owner = owner & 0xff ;

	prints[0] = 69;
	prints[1] = owner;
	prints[2] = index;
	prints[3] = chanMap[owner-1][index].chanID ;
	prints[4] = get_local_tile_id();
	//printMany(5,prints);

	return chanMap[owner-1][index].chanID ;
}

void deleteChanMapEntry(chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS], unsigned owner, unsigned index)
{
	owner = owner & 0xff ;
	chanMap[owner-1][index].chanID = 0 ;
}
static inline void printOne(unsigned value)
{
        unsigned data[1];
        data[0] = value;

        printMany(1,data);

}
unsigned nOS_doAction(unsigned action, unsigned arg1, unsigned arg2, unsigned arg3, unsigned stacks[MAXLOCALTHREADS][THREADSTACKSIZE], chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS])
{
	channel c ;
	unsigned result ;
//	static unsigned startadr ;

//	startadr = arg2 ;

	switch(action) {

	// allocate a new channel of the given index and connect it
	// useful for active / outgoing connection channels
	// arg1 { connecting ThreadID_16 , connecting thread's channel Index_16}
	// arg2 destination chanend
	case nOS_connectNewChannel_action :
		c = getNewChannel() ;
		connectChannel(c, arg2) ;
		addNewChanMapEntry(chanMap, c, arg1 >> 16, arg1 & 0xffff) ;
		return c ;

	// allocate a new channel of provided index, but do not connect it
	// useful for listen channels
	// arg1 { connecting threadID_16 , connecting thread Index_16}
	// arg2 <unused>
	case nOS_allocateNewChannel_action :
		c = getNewChannel() ;
		addNewChanMapEntry(chanMap, c, arg1 >> 16, arg1 & 0xffff) ;
		return c ;

	// find the destintation of a (hopefully) in-use channel
	// arg1 requested channel's owner and index { threadID_16 , thread Index_16}
	// arg2 <unused>
	case nOS_getChannelDest_action :
		c = lookupChanMapEntry(chanMap, arg1 >> 16, arg1 & 0xffff) ;
		asm("getd %0, res[%1]" : "=r"(result) : "r"(c)) ;
		return result ;

	// update the destination of a channel based on the thread's ID and channel index
	// arg1 { connecting threadID_16 , connecting thread Index_16}
	// arg2 new destination chanend
	case nOS_updateChannelDest_action :
		c = lookupChanMapEntry(chanMap, arg1 >> 16, arg1 & 0xffff) ;
		asm("setd res[%0], %1" : : "r"(c), "r"(arg2)) ;
		return 0 ;

	// release control of a channel
	// arg1 { connecting threadID_16 , connecting thread Index_16}
	// arg2 <unused>
	case nOS_releaseChannel_action :
		c = lookupChanMapEntry(chanMap, arg1 >> 16, arg1 & 0xffff) ;
		asm("freer res[%0]" : : "r"(c)) ;
		deleteChanMapEntry(chanMap, arg1 >> 16, arg1 & 0xffff) ;
		return 0 ;

	// find out the chanend of a certain thread + index
	// useful for the remote clients to interrogate their parents about what channel to connect back on
	// arg1 { connecting threadID_16 , connecting thread Index_16}
	// arg2 <unused>
	case nOS_lookupChanend_action :
		c = lookupChanMapEntry(chanMap, arg1 >> 16, arg1 & 0xffff) ;
		return c ;

	// create a new thread of execution on this core
	// arg1 { connecting threadID_16 , connecting thread Index_16}
	// arg2 := PC start address for new thread
	// arg3 := child thread rank, passed from parent call
	// returns the globally unique node + thread identifier for the thread
	case nOS_createThread_action :
		arg2 = getStartAddress(arg2) ;
		result = nOS_createThread(arg1, arg2, arg3, stacks) ;
		return result ;
	}
}

// global stacks variable

//unsigned threadStacks[1][1] ;

//out port even_leds = XS1_PORT_4F;
//out port odd_leds = XS1_PORT_1J;

//out port ten_leds = XS1_PORT_1E;
//out port two_leds = XS1_PORT_1I;

void nOS_start(chanend c_in,chanend c_out)
{
	chan d ;
	char threadNoChildren[MAXLOCALTHREADS] ; // track its children so we know if we can migrate

	// declare the listen channel early so that it can try to receive all necessary messages
		unsigned listenChannel = getSpecificLocalChannel( (LOCALnOSCHANEND & 0xff00) >> 8) ;

//	unsigned listenChannel ;

	unsigned myID = get_logical_core_id() ;

	unsigned startAddress, stackSize ;

	unsigned nOS_threadStacks[MAXLOCALTHREADS][THREADSTACKSIZE] ;

	unsigned foo;

	chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS] ; // the table containing the channel to thread mapping and IDs
	//odd_leds <: 1;
  //      even_leds <: 1;
//	ten_leds <: 1;
//	two_leds <: 1;
	
/*	get_stackSize(nOS_start, stackSize) ;
	get_startAddress(nOS_start, startAddress) ;
//	odd_leds <: 0xf;

//	printhexln(startAddress) ;
//	printhexln(stackSize) ; */

	// synchronisation needed since messages sent before the local channel is acquired may be lost


	//unsigned res = 0x102 ;
	//unsigned dest = 0x202 ;
	//asm("setd res[%0], %1" : "=r"(res) : "r"(dest) ) ;

	unsigned dest ;
	c_in :> foo ;
	//unsigned myc = getNewChannel() ;
	//connectChannel(myc, 0x102) ;
	/*{
		unsigned dst;
		asm("getd %0,res[%1]":"=r"(dst):"r"(c));
		printhexln(dst);
		asm("mov %0,%1":"=r"(dst):"r"(c));
		printhexln(dst);
	}*/

	if (myID != 0) {
		//printstrln("nOS not running as Thread 0. Exiting") ;
		exit(-1) ;
	}
//	else printstrln("nOS initialising...") ;
	//asm("bu -0x1"::);
	// initialise chanMap to null values
	//printOne(get_local_tile_id());
	for (int i = 0 ; i < MAXLOCALTHREADS ; i++)
		{
		threadNoChildren[i] = 0 ;
		for (int j = 0 ; j < MAXTHREADCHANNELS ; j++)
			chanMap[i][j].chanID = 0 ;
		}

	// touch the stacks, so the compiler knows they're alive
	//threadStacks[0][0] = 0 ;

//	even_leds <: 2;

	c_out <: foo;
	while(1){
		nOS_listenForAction(listenChannel, nOS_threadStacks, chanMap) ;
	//	nOS_createThread(getStartAddress(p_begin1)) ;
	//	nOS_createThread(getStartAddress(p_begin2)) ;
	//	nOS_createThread(getStartAddress(p_begin3)) ;
//		break;
	}

}



void eventTestA()
{
	channel c, d ;
	c = getNewChannel() ;
	d = getNewChannel() ;

	nOS_setChannelDest(c, 0x2) ;
	nOS_setChannelDest(d, 0x2) ;

	installHandlerToFoo(c) ;
	installHandlerToFoo(d) ;

	nOS_waitForEvent() ; // wait for a transmission from eventTestB, which is handled in the Foo handler.

	nOS_disableEvent(c) ;
	nOS_disableEvent(d) ;


	select1A(c, d) ;

}

void select1B(chanend c1, chanend c2)
{
	unsigned a ;
	select
	{
		case c1 :> a :
		break ;

		case c2 :> a :
		break ;
	}
}



unsigned food ;

void eventTestB()
{
	channel e ;
	e = getNewChannel() ;
	for (int i = 0 ; i < 100 ; i++)  food ++ ;

	nOS_setChannelDest(e, 0x102) ;

	channelSendWord(e, 42) ;

}


void begin1(unsigned parentID, unsigned rank)
{
	printstrln("Begin1!") ;
	printintln(parentID) ;
	printintln(rank) ;
}

void begin2(unsigned parentID, unsigned rank)
{
	printstrln("Begin2!") ;
}

void begin3(unsigned parentID, unsigned rank)
{
	printstrln("Begin3!") ;
}




void chanTestParent(chanend c)
{
	unsigned dest ;
	unsigned childID ;
	unsigned childStart ;
	unsigned childStack ;
	unsigned data ;
	channel myChanA ;

	c :> dest ;

	printstrln("Starting channel test parent") ;
	myChanA = client_allocateNewLocalChannel(1) ;
	printstr("Channel allocated with ID: ") ;
	//printhexln(myChanA) ;
	printstrln("Starting child") ;
	// use rank here to supply connection index for child to connect back to

	get_startAddress(chanTestChild, childStart) ;
	get_stackSize(chanTestChild, childStack) ;
	childID = client_createThread(childStart, childStack, 1, 0) ;
	printstr("Child started. ID is : ") ;
	//printhexln(childID) ;
	printstrln("Now listening on channel") ;
	dest = channelListen(myChanA) ;
	printstrln("Listened.") ;
	data = channelReceiveWord(myChanA) ;
	printstr("Done. Data received was: ") ;
	printintln(data) ;

}


#define CHILDFIRSTCHANNEL 1 // first channel

void chanTestChild(unsigned parentID, unsigned rank)
{
	channel myChanB ;
	endpoint dest ;
	//myChanB = client_allocateNewLocalChannel(CHILDFIRSTCHANNEL) ;
	dest = client_lookupParentChanend(parentID, rank) ;
	//client_updateLocalChannelDest(CHILDFIRSTCHANNEL, dest) ; //TODO: Fix initial channel connetion and synchronisation

	myChanB = client_connectNewLocalChannel(CHILDFIRSTCHANNEL, dest) ;

	//connectChannel(myChanB, dest) ;
	printstrln("chanTestChild sending word.") ;
	channelSendWord(myChanB, 42) ;
	printstrln("chanTestChild done.") ;
}

void sinkSync(chanend c, unsigned shouldIrun)
{
	unsigned foo ;
	unsigned dest ;
	
//	unsigned res = 0x202 ;
//	unsigned dest = 0x102 ;
//	asm("setd res[%0], %1" : "=r"(res) : "r"(dest) ) ;
	if (!shouldIrun) return;
	c :> foo ;
	//unsigned myc = getNewChannel();
	//dest = channelListen(myc) ;

}

void printID(unsigned tile)
{
	unsigned id = get_local_tile_id() ;
	//printhex(tile) ;
	//printhexln(id) ;
}


// Run the OS!

//int main()
//{
//	chan c, c1, c2,c3, c4, c5, c6, c7, c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21 ;
//	par{
/*		on stdcore[0] : nOS_start(c) ;
		on stdcore[0] : chanTestParent(c11) ;
		on stdcore[0] : sinkSync(c) ;
		on stdcore[1] : nOS_start(c1) ;
		on stdcore[1] : chanTestParent(c12) ;
		on stdcore[1] : sinkSync(c1) ;
		on stdcore[2] : nOS_start(c2) ;
		on stdcore[2] : chanTestParent(c2) ;
		on stdcore[2] : sinkSync(c13) ;
*/
/*
		on stdcore[0] : nOS_start(c) ;
		on stdcore[0] : sobel_main(c11) ;
		on stdcore[0] : sinkSync(c) ;
		on stdcore[1] : nOS_start(c1) ;
		on stdcore[1] : sobel_main(c12) ;
		on stdcore[1] : sinkSync(c1) ;
		on stdcore[2] : nOS_start(c2) ;
		on stdcore[2] : sobel_main(c2) ;
		on stdcore[2] : sinkSync(c13) ;
*/
/*		on stdcore[0] : nOS_start(c) ;
		on stdcore[0] : sobel_main(c11) ;
		on stdcore[0] : sinkSync(c) ;
		on stdcore[1] : nOS_start(c1) ;
		on stdcore[1] : sobel_main(c12) ;
		on stdcore[1] : sinkSync(c1) ;
		on stdcore[2] : nOS_start(c2) ;
		on stdcore[2] : sobel_main(c2) ;
		on stdcore[2] : sinkSync(c13) ;
		on stdcore[3] : nOS_start(c3) ;
		on stdcore[3] : sobel_main(c14) ;
		on stdcore[3] : sinkSync(c3) ;
		on stdcore[4] : nOS_start(c4) ;
		on stdcore[4] : sobel_main(c15) ;
		on stdcore[4] : sinkSync(c4) ;
		on stdcore[5] : nOS_start(c5) ;
		on stdcore[5] : sobel_main(c16) ;
		on stdcore[5] : sinkSync(c5) ;
		on stdcore[6] : nOS_start(c6) ;
		on stdcore[6] : sobel_main(c17) ;
		on stdcore[6] : sinkSync(c6) ;
		on stdcore[7] : nOS_start(c7) ;
		on stdcore[7] : sobel_main(c18) ;
		on stdcore[7] : sinkSync(c7) ;
		on stdcore[8] : nOS_start(c8) ;
		on stdcore[8] : sobel_main(c19) ;
		on stdcore[8] : sinkSync(c8) ;
		on stdcore[9] : nOS_start(c9) ;
		on stdcore[9] : sobel_main(c20) ;
		on stdcore[9] : sinkSync(c9) ;
		on stdcore[10] : nOS_start(c10) ;
		on stdcore[10] : sobel_main(c21) ;
		on stdcore[10] : sinkSync(c10) ; */
//		on stdcore[3] : printID(3) ;
//		on stdcore[4] : printID(4) ;
//		on stdcore[5] : printID(5) ;
//		on stdcore[6] : printID(6) ;
//		on stdcore[7] : printID(7) ;
//		on stdcore[8] : printID(8) ;
//		on stdcore[9] : printID(9) ;
//		on stdcore[10] : printID(10) ;
		//on stdcore[0] : eventTestA() ;
		//on stdcore[0] : eventTestB() ;
	//}
	//return 0 ;
//}

