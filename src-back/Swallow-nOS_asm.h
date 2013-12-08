/*
 * Swallow-nOS_asm.h
 *
 *  Created on: 16 Apr 2013
 *      Author: harry
 */

#ifndef SWALLOW_NOS_ASM_H_
#define SWALLOW_NOS_ASM_H_

#define nOS_LISTENCHANNEL 31
#define MAXLOCALTHREADS 6   // max number of nonOS threads supported
#define MAXTHREADCHANNELS 24 // max number of channels/thread supported
#define THREADSTACKSIZE 2048 // number of words for each thread stack

enum nOS_action {nOS_allocateNewChannel_action, nOS_connectNewChannel_action, nOS_getChannelDest_action, nOS_updateChannelDest_action, nOS_releaseChannel_action, nOS_lookupChanend_action, nOS_createThread_action } ;
typedef struct chanMapping {unsigned chanID; } chanMapping ;

unsigned nOS_createThread(unsigned parentID, unsigned startAddress, unsigned childRank, unsigned stacks[MAXLOCALTHREADS][THREADSTACKSIZE]) ;
void nOS_waitForEvent() ;
void nOS_disableAllEvents() ;
unsigned nOS_getEventID() ;
//void printMany(unsigned length, unsigned data[]);

#ifdef __XC__
void nOS_listenForAction(channel c, unsigned stacks[MAXLOCALTHREADS][THREADSTACKSIZE], chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS]) ;
unsigned nOS_requestAction(endpoint dest, unsigned action, unsigned arg1, unsigned arg2, unsigned arg3) ;
void nOS_addEventHandler(channel c, unsigned handler) ;
void nOS_disableEvent(channel c) ;
void nOS_setChannelDest(channel c, unsigned dest) ;
void printManyC(channel printChannel, unsigned length, unsigned data[]) ;

#else
void nOS_listenForAction(unsigned c, unsigned stacks[MAXLOCALTHREADS][THREADSTACKSIZE], chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS]) ;
unsigned nOS_requestAction(unsigned dest, unsigned action, unsigned arg1, unsigned arg2) ;
void nOS_addEventHandler(unsigned c, unsigned handler) ;
void nOS_disableEvent(unsigned c) ;
void nOS_setChannelDest(unsigned c, unsigned dest) ;
void printManyC(unsigned printChannel, unsigned length, unsigned data[]) ;

#endif

#endif /* SWALLOW_NOS_ASM_H_ */
