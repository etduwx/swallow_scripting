/*
 * Swallow-nOS_client.h
 *
 *  Created on: 16 Apr 2013
 *      Author: harry
 */

#ifndef SWALLOW_NOS_CLIENT_H_
#define SWALLOW_NOS_CLIENT_H_

#include "Swallow-helpers.h"

#ifdef __XC__
void p1(chanend c) ;
#else
void p1(unsigned c) ;
#endif

void child1(unsigned parentid);

unsigned client_createThread(unsigned threadIdentifier, unsigned stackSize, unsigned childRank, unsigned tileIndex) ;
channel client_connectNewLocalChannel(unsigned channelIndex, endpoint destination) ;
channel client_allocateNewLocalChannel(unsigned channelIndex) ;
endpoint client_getLocalChannelDest(unsigned channelIndex) ;
void client_updateLocalChannelDest(unsigned channelIndex, endpoint destination) ;
void client_releaseLocalChannel(unsigned channelIndex) ;
endpoint client_lookupLocalChanend(unsigned channelIndex) ;
endpoint client_lookupParentChanend(unsigned parentID, unsigned channelIndex) ;
endpoint client_lookupSpecificChanend(unsigned tileID, unsigned thread_no, unsigned channelIndex);
#endif /* SWALLOW_NOS_CLIENT_H_ */
