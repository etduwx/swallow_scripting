//#include <xccompat.h>
#include "Swallow-nOS.h"
#include "Swallow-nOS_client.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-helpers.h"
#include "blur.h"
#include "Swallow-prim.h"
//#include "matrixmul.h"
//#include "Swallow-sobel.h"

#define NUMBEROFSTARTS 1

// OBSOLETE WITH NEW client_createThread
unsigned getStartAddress(unsigned index)
{
	void (*starts[NUMBEROFSTARTS])(unsigned,unsigned) ; // void (void) function pointer
	starts[0] = prim_child; 
	
	
	return (unsigned) starts[index] ;
}


/*
 * Event handlers: akin to select statement in XC
 * Process: 1) get channel IDs
 *          2) install an event handler for each channel desired to select over
 *             using nOS_addEventHandler(c, (unsigned) pFoo) ;
 *          3) Events can then trigger asynchronously
 *          4) Can wait on an event by calling nOS_waitForEvent()
 *          5) After select is finished, call nOS_disableEvent(channel c) on each channel that was previously enabled
 *
 */



// Example event handler. Installed by an installHandlerTo... call (see below)
void fooEventHandler()
{
	unsigned theEventChannel ;
	unsigned someData ;
	theEventChannel = nOS_getEventID() ;
	// would implement the event handler code here
	// e.g.
	someData = channelReceiveWord(theEventChannel) ;
}


// Currently, for each event handler, we need to write a function that
// initalises that handler. This function is unfortunately unique for each handler,
// until the time that the compiler can be massaged more coherently.
void installHandlerToFoo(unsigned c) // the unsigned is a 'channel' type in XC
{
	void (*pFoo)(void) ; // function pointer
	pFoo = fooEventHandler ; // point to desired handler
	nOS_addEventHandler(c, (unsigned) pFoo) ; // install the handler
}

void select1A(unsigned a, unsigned b)
{
	select1B(a, b) ;
}


void allocateChanByRef(unsigned *c)
{
	*c = 0x02 ;
}
