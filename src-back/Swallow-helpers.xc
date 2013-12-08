/*
 * helpers.xc
 *
 *  Created on: 23 Mar 2013
 *      Author: harry
 */
#include <string.h> // for strlen()
#include <platform.h>
#include <stdio.h>
#include <xscope.h>
#include <print.h>
#include "Swallow-helpers.h"
//#define SWXLB_POS_BOTTOM          0
//#include "../../sw_swallow_etherboot/app_swallow_etherboot/src/swallow_etherboot_conf.h" // for swxlb_cfg
#include "swallow_comms.h" // for Steve's tools
//#include "../../sc_swallow_communication/module_swallow_comms/src/swallow_comms.h" // for swallow_cvt_chanend()

#define BOARDS_W 5
#define sendWord(ch,w)  __asm__ __volatile__("out res[%0],%1"::"r"(ch),"r"(w));
#define releaseChannel(ch)  __asm__ __volatile__("freer res[%0]": :"r"(ch));

#define DEBUG_STRING_MAXLENGTH 1024

/*
 * "chanend" means native xc chan with chanend
 * "channel" means chanends being treated as unsigned
 */

// not tested
unsigned rowColToNodeId(unsigned row, unsigned column, unsigned layer)
{
	unsigned id ;
	// first generate node index, then convert to id
	//id = row * swxlb_cfg.boards.w ;
	id = row * BOARDS_W * 4 ;
	id += 2 * column ;
	id += layer ;
	id = id << 16 ;
	return swallow_cvt_chanend(id) >> 16 ;
}

void printMany(unsigned length, unsigned printData[])
{
	timer t;
  	unsigned tv;
	unsigned ch;
ch = 0;

while(ch==0){

  asm("getr %0, 2" : "=r"(ch) : ) ;
}

// listenChannel = getSpecificLocalChannel( (LOCALnOSCHANEND & 0xff00) >> 8)

for(unsigned i=0;i<length;i++){

  	t :> tv;
    	tv += 0x00004000;
    	t when timerafter(tv) :> void;

    startnOSBurstClient(ch,0x80010502,4,1);
    sendWord(ch, printData[i]) ;
    endnOSBurstClient(ch);

}
releaseChannel(ch);
}
// convert a node index (i.e. 0-N) to it's row and column-based ID
// tested
unsigned nodeIndexToId(unsigned node)
{
	return swallow_cvt_chanend(node << 16) ;
}


// tested on a small network
endpoint buildChanId(unsigned node, unsigned chanIndex)
{
	node = nodeIndexToId(node) ;
	return (node) | (chanIndex << 8) | 0x2 ;
}

//(unsigned, unsigned) getNodeandChan(chanend c)
//{

//}
channel getNewChannel()
{
	channel localEndpoint ;
	asm("getr %0, 0x2" : "=r" (localEndpoint) : ) ; // get a fresh local endpoint
	return localEndpoint ;
}


// checked :)
void connectChanend(chanend c, endpoint dest)
{
	asm("setd res[%0], %1" : :  "r"(c) , "r"(dest)) ; // point the endpoint to the destination
	asm("outct res[%0], 0x1" : : "r"(c)) ; // output an END token to synchronise but not keep the channel open whilst waiting for other end
	asm("out res[%0], %1" : : "r"(c), "r"(c)) ;  // send the origin channel
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
	asm("outct res[%0], 0x1" : : "r"(c) ) ; // send an END control token, freeing up the route from this end.
}


void connectChannel(channel c, endpoint dest)
{
	asm("setd res[%0], %1" : :  "r"(c) , "r"(dest)) ; // point the endpoint to the destination
//	asm("outct res[%0], 0x1" : : "r"(c)) ; // output an END token to synchronise but not keep the channel open whilst waiting for other end
	asm("out res[%0], %1" : : "r"(c), "r"(c)) ;  // send the origin channel
	asm("outct res[%0], 0x1" : : "r"(c) ) ; // send an END control token, freeing up the route from this end.
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
}

/*
channel connectNewChannel(endpoint dest)
{
	unsigned localEndpoint ;
	asm("getr %0, 0x2" : "=r" (localEndpoint) : ) ; // get a fresh local endpoint
	asm("setd res[%0], %1" : :  "r"(localEndpoint) , "r"(dest)) ; // point the endpoint to the destination
	return localEndpoint ;
}
*/
// checked :)
// N.B. Don't use with channelConnect/channelListen, since the resource shouldn't be freed
// name clash with one of steve's functions...
void freeChanend_sjh(chanend c)
{
	asm("freer res[%0]" :  : "r" (c) ) ; // free the local endpoint
}

// checked :)
endpoint chanendListen(chanend c)
{
	endpoint sender ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // wait for an END token to arrive
	asm("in %0, res[%1]" : "=r"(sender)  : "r"(c)) ; // received the destination
	asm("setd res[%0], %1" : :  "r"(c) , "r"(sender)) ; // point the endpoint to the sender so that we can synchronise
	asm("outct res[%0], 0x1" : : "r"(c)) ; // send END token, freeing up the route from this end
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
	return sender ;
}

// tested :)
endpoint channelListen(channel c)
{
	endpoint sender ;
	//asm("chkct res[%0], 0x1" : : "r"(c)) ; // wait for an END token to arrive
	asm("in %0, res[%1]" : "=r"(sender)  : "r"(c)) ; // received the destination
	asm("setd res[%0], %1" : :  "r"(c) , "r"(sender)) ; // point the endpoint to the sender so that we can synchronise
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
	asm("outct res[%0], 0x1" : : "r"(c)) ; // send END token, freeing up the route from this end
	return sender ;
}

void channelSendWord(channel c, unsigned value)
{
	asm("outct res[%0], 0x1" : : "r"(c)) ; // send END token, freeing up the route from this end
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
	asm("out res[%0], %1" : : "r"(c), "r"(value)) ;
	asm("outct res[%0], 0x1" : : "r"(c)) ; // send END token, freeing up the route from this end
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
}

// tested :)  and <: infix compatible :)
unsigned channelReceiveWord(channel c)
{
	unsigned value ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ; // receive an END as the ack. Also frees the route from other end
	asm("outct res[%0], 0x1" : : "r"(c)) ; // send END token, freeing up the route from this end
	//asm("in %0, res[%1]" : "=r"(value) : "r"(c)) ;
	//asm("chkct res[%0], 0x1" : : "r"(c) :  "r0") ; // receive an END as the ack. Also frees the route from other end
	asm("in %0, res[%1] ; chkct res[%1], 0x1" : "=r"(value) : "r"(c)) ;

	asm("outct res[%0], 0x1" : : "r"(c)) ; // send END token, freeing up the route from this end
	return value ;
}

// grab and return the specified channel number on the local core. Is a brute-force approach
// checked :)
unsigned getSpecificLocalChannel(unsigned channelNo)
{
	unsigned localEndpoint = 0 ;
	unsigned tileID ;
	unsigned endpointsTried[32] ;
	unsigned desiredEndpoint ;
	int noEndpointsTried = 0 ;

	tileID = get_local_tile_id() ;

	desiredEndpoint = ((tileID << 16) | (channelNo <<8) | 0x2) ;
	while (localEndpoint !=  desiredEndpoint)
	{
		asm("getr r0, 0x2\n"
		"mov %0,r0\n" : "=r" (localEndpoint) : : "r0" ) ; // get a fresh local endpoint
		endpointsTried[noEndpointsTried] = localEndpoint ;

		noEndpointsTried++ ;
	}
	// at this point, the last endpoint tried should be the one we want.
	// If we get an error 'cos we ran out of endpoints, it was already in use somewhere
	// now release the ones we didn't want...
	noEndpointsTried -= 2  ;

	while (noEndpointsTried >= 0)
	{
		asm ("freer res[%0]" :  : "r"(endpointsTried[noEndpointsTried])) ;
		noEndpointsTried -- ;
	}

	return localEndpoint ;
}


void coreSendWords(streaming chanend output, unsigned data[], unsigned data_length)
{
	startTransactionClient(output,0x80010402,0x4,data_length);
	for (int i = 0; i < data_length ; i += 1)
	{
	    output <: data[i] ;
	}
	endTransactionClient(output);

}



unsigned coreReceiveWords(streaming chanend input, unsigned receiveBuffer[])
{
	unsigned dst, format, length, value;

		//	odd_leds <: 1 ;
		    startTransactionServer(input,dst,format,length);
		 //   odd_leds <: 2 ;
		    //We assume we are format = 0x4, because we're lazy in this demo
		    for (int i = 0; i < length; i += 1)
		    {

		      //streamInWord(input,value);
		    	input :> receiveBuffer[i] ;
		    	// show value on LEDs
		 //   	odd_leds <: receiveBuffer[i] ;
		    }
		    endTransactionServer(input);
		    //coreSendWords(output, receiveBuffer, length) ;

		//    odd_leds <: 0 ;
		    return length ;
}


void coreSendBytes(streaming chanend output, char data[], unsigned data_length)
{
	startTransactionClient(output,0x80010402,0x1,data_length);
	for (int i = 0; i < data_length ; i += 1)
	{
	    output <: data[i] ;
	}
	endTransactionClient(output);
}





void SwPrintUnsigned(streaming chanend output, unsigned value)
{
	unsigned values[1] ;
	values[0] = value ;
	coreSendWords(output, values, 1) ;
}


unsigned stringToChars(const char s[], char c[])
{
	unsigned length = 0 ;
	while (s[length] != '\0' && length < DEBUG_STRING_MAXLENGTH )
	{
		c[length] = s[length] ;
		length++ ;
	}
	return length ;
}


void SwPrintString(streaming chanend output,  const char string[])
{
	unsigned length ;
	char charBuffer[DEBUG_STRING_MAXLENGTH] ; // longest string length is determined here
	length = stringToChars(string, charBuffer) ;
	coreSendBytes(output, charBuffer, length) ;
}

