/*
 * Swallow-helpers.h
 *
 *  Created on: 24 Mar 2013
 *      Author: harry
 */

#ifndef SWALLOWHELPERS_H_
#define SWALLOWHELPERS_H_

typedef unsigned channel ; // software-defined channel (hardware resource)
typedef unsigned endpoint ;  // channel endpoint (target address)

unsigned nodeIndexToId(unsigned node) ;
endpoint buildChanId(unsigned node, unsigned chanIndex) ;
channel getNewChannel() ;
void connectChannel(channel c, endpoint dest) ;
unsigned connectNewChannel(endpoint dest) ;
unsigned getSpecificLocalChannel(unsigned channelNo) ;
endpoint channelListen(channel c) ;
void channelSendWord(channel c, unsigned value) ;
unsigned channelReceiveWord(channel c) ;
unsigned nodeIndexToId(unsigned node) ;
unsigned rowColToNodeId(unsigned row, unsigned column, unsigned layer) ;
void printMany(unsigned length, unsigned printData[]);

#ifdef __XC__

void connectChanend(chanend c, endpoint dest) ;

void freeChanend_sjh(chanend c) ;
endpoint chanendListen(chanend c) ;

// wrapper functions for sending and receiving data streams using transactionServer and transactionClient
void coreSendWords(streaming chanend output, unsigned data[], unsigned length) ;
unsigned coreReceiveWords(streaming chanend input, unsigned data_buffer[]) ;
void coreSendBytes(streaming chanend output, char data[], unsigned data_length) ;

// debug print routines
void SwPrintUnsigned(streaming chanend output, unsigned value) ;
void SwPrintString(streaming chanend output,  const char string[]) ;

#else
void connectChanend(unsigned c, endpoint dest) ;
void freeChanend_sjh(unsigned c) ;
endpoint chanendListen(unsigned c) ;

// wrapper functions for sending and receiving data streams using transactionServer and transactionClient
void coreSendWords(unsigned output, unsigned data[], unsigned length) ;
unsigned coreReceiveWords(unsigned input, unsigned data_buffer[]) ;
void coreSendBytes(unsigned output, char data[], unsigned data_length) ;

// debug print routines
void SwPrintUnsigned(unsigned output, unsigned value) ;
void SwPrintString(unsigned output,  const char string[]) ;

#endif


#endif /* SWALLOWHELPERS_H_ */
