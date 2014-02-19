#include <xs1.h>
#include <print.h>
#include <math.h>
#include <stdlib.h>
#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_initialFunctions.h"
#include "Swallow-nOS_client.h"
#include "swallow_comms.h"

#define THRESHOLD 3 //threshold for creating a thread on current tile without checking neighbors
#define LOCALnOSCHANEND 0x1f02 // hard-coded for core[0] only. TODO: generalise
#define MAXSEARCHDIST 3

// specify the start address, stack size, rank and the tile (by index) to allocate the thread on
#pragma stackfunction 3000
unsigned client_createThreadDynamic(unsigned startAddress,unsigned childRank,unsigned depth, unsigned go_deeper,unsigned coreNo)
{
	unsigned myCore = get_local_tile_id();
	unsigned threadCore;
	unsigned myThread = get_logical_core_id();
	unsigned myID = (myCore << 16) | myThread;
	unsigned col,row, coreNum;
	unsigned neighbouringActivity[3],neighbouringCores[3],numNeighbours;
	unsigned searchDeeper = 0;
	unsigned minimum,smallest;
	unsigned printer[5];
	unsigned mylogicore,comp;


	col = (myCore >> SWXLB_LPOS) & 0x03;
	row = (myCore >> SWXLB_VPOS);
	coreNum = sw_ncols*row + col;

	mylogicore = coreNum;

if(depth > 0)
{
	coreNum = coreNo;
	col = coreNum % sw_ncols;
	row = coreNum / sw_ncols;
}
	
	
	if(depth==0 && (client_getThreadStatus(coreNum) <= THRESHOLD)){
		//printer[0] = childRank;
		//printer[1] = coreNum;
		//printMany(2,printer);
		return nOS_requestAction((nodeIndexToId(coreNum) | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ;
	}

	if(go_deeper == 0 && depth > 0) return client_getThreadStatus(coreNum);


	for(unsigned i = 0;i<3;i++){
		neighbouringActivity[i] = 1000; // initialize to "failure"
	}

	searchDeeper = 0;

	while(go_deeper == 1){
		numNeighbours = 0;
		switch(col){
			case 0: //look up, down, right
				neighbouringCores[numNeighbours] = coreNum + 1;
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
				numNeighbours +=1;
				if(row>0){
					neighbouringCores[numNeighbours] = coreNum - sw_ncols;
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
					numNeighbours += 1;
				}
				if(row<sw_nrows-1){
					neighbouringCores[numNeighbours] = coreNum + sw_ncols;
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking down
					numNeighbours += 1;
				}
				break;
			case 1: //two over right and left
				neighbouringCores[numNeighbours] = coreNum + 2;
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
				numNeighbours +=1;
				
				neighbouringCores[numNeighbours] = coreNum - 1;
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
				numNeighbours += 1;
				break;
			case 2: //up,down,right
				neighbouringCores[numNeighbours] = coreNum + 1;
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
				numNeighbours +=1;
				if(row>0){
					neighbouringCores[numNeighbours] = coreNum - sw_ncols;
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
					numNeighbours += 1;
				}
				if(row<sw_nrows-1){
					neighbouringCores[numNeighbours] = coreNum + sw_ncols;
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking down
					numNeighbours += 1;
				}
				break;
			case 3: //two over left and left
				neighbouringCores[numNeighbours] = coreNum - 2 ;
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
				numNeighbours +=1;
				
				neighbouringCores[numNeighbours] = coreNum - 1;
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
				numNeighbours += 1;

				break;
		}

		minimum = 0xffffffff;

		for (unsigned i=0;i<numNeighbours;i++){
			if (neighbouringActivity[i] < minimum){
				minimum = neighbouringActivity[i];
				smallest = i;
			}
		}

if(searchDeeper == 0){
		if(minimum <= THRESHOLD){
			if(depth==0){
				coreNum = neighbouringCores[smallest];  
				break; 
			}
			else
			{
			return (neighbouringActivity[smallest] << 8) | neighbouringCores[smallest];
			}
		}
		else{
			searchDeeper = 1;
		}
	}
	else{
		if(depth == 0){
			coreNum = neighbouringActivity[smallest] & 0xff;
			break;
		}
		else
			return neighbouringActivity[smallest] & 0xff;
	}

}
  //printer[0] = childRank;
	//printer[1] = coreNum;
	//printMany(2,printer);
	return nOS_requestAction((nodeIndexToId(coreNum) | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ;

}

unsigned client_createThreadRandom(unsigned startAddress, unsigned childRank,unsigned min,unsigned max){

	unsigned myCore = get_local_tile_id() ;    // returns node ID
	unsigned myThread = get_logical_core_id() ;  // returns 0--7
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	unsigned range = max-min;
	//unsigned printer[2];
	unsigned targetCore;

	//printer[0] = childRank;
	targetCore = min + (rand() % range);
	//printer[1] = targetCore;
	//printMany(2,printer);

	return nOS_requestAction((nodeIndexToId(targetCore) | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ;

}

unsigned client_createThread(unsigned startAddress, unsigned stackSize, unsigned childRank, unsigned tileIndex)
{
	unsigned myCore = get_local_tile_id() ;    // returns node ID
	unsigned myThread = get_logical_core_id() ;  // returns 0--7
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	
	//return nOS_requestAction(LOCALnOSCHANEND, nOS_createThread_action, myID, startAddress, childRank) ;


	
	return nOS_requestAction((nodeIndexToId(tileIndex) | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ;
	/* unsigned destTile ;
	switch (tileIndex) {
				case 0 : destTile = 0x00000000 ;
				break ;
				case 1 : destTile = 0x40000000 ;
				break ;
				case 2 : destTile = 0x60000000 ;
				break ;
				case 3 : destTile = 0x70000000 ;
				break ;
				case 4 : destTile = 0x20000000 ;
				break ;
				case 5 : destTile = 0x30000000 ;
				break ;
				case 6 : destTile = 0x38000000 ;
				break ;
				case 7 : destTile = 0x3c000000 ;
				break ;
				case 8 : destTile = 0x3e000000 ;
				break ;
				case 9 : destTile = 0x3f000000 ;
				break ;
				case 10 : destTile = 0x3e800000 ;
				break ;
				default : destTile = 0 ; break;
	}
	
//	printstr("\n");
//	printstr("a ");
//	printint(myID);

	return nOS_requestAction((destTile | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ; */
}


channel client_connectNewLocalChannel(unsigned channelIndex, endpoint destination)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned myThread = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	unsigned chanID = (myThread << 16) | channelIndex ;
//	printstr("\n");
//	printstr("b ");
//	printint(myID);

	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_connectNewChannel_action, chanID, destination, 0) ;
}

channel client_allocateNewLocalChannel(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned myThread = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	unsigned chanID = (myThread << 16) | channelIndex ;
//	printstr("\n");
//	printstr("c ");
//	printint(myID);

	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_allocateNewChannel_action, chanID, 0, 0) ;
}

endpoint client_getLocalChannelDest(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16 ) | channelIndex ;
//	printstr("\n");
//	printstr("d ");
//	printint(myID);

	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_getChannelDest_action, chanID, 0, 0) ;
}

void client_updateLocalChannelDest(unsigned channelIndex, endpoint destination)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16) | channelIndex ;
//	printstr("\n");
//	printstr("e ");
//	printint(myID);

	nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_updateChannelDest_action, chanID, destination, 0) ;
}


void client_releaseLocalChannel(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16) | channelIndex ;
//	printstr("\n");
//	printstr("f ");
//	printint(myID);

	nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_releaseChannel_action, chanID, 0, 0) ;
}

endpoint client_lookupLocalChanend(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16) | channelIndex ;
//	printstr("\n");
//	printstr("g ");
//	printint(myID);

	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_lookupChanend_action, chanID, 0, 0) ;
}


endpoint client_lookupParentChanend(unsigned parentID, unsigned channelIndex)
{
	// parentID is (COREID_16, THREADINDEX_16}
	// for the lookup, we need to send to the OS on COREID with an argument of the {threadIndex_16, channelIndex_16}
        unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned destOS = (parentID & 0xffff0000) | LOCALnOSCHANEND ;
	unsigned indices = (parentID << 16) | (channelIndex & 0x0000ffff) ;
//	printstr("\n");
//	printstr("h ");
//	printint(myID);

	return nOS_requestAction(destOS, nOS_lookupChanend_action, indices , 0, 0) ;
}
endpoint client_lookupSpecificChanend(unsigned tileIndex, unsigned thread_no, unsigned channelIndex)
{
	// parentID is (COREID_16, THREADINDEX_16}
	// for the lookup, we need to send to the OS on COREID with an argument of the {threadIndex_16, channelIndex_16}
	unsigned printer[2];
        unsigned targetCore = nodeIndexToId(tileIndex) ;
//	unsigned destOS = (targetCore << 16) | LOCALnOSCHANEND ;
	unsigned chanID = (thread_no << 16) | channelIndex ;
	printer[0] = get_local_tile_id();
	printer[1] = targetCore;
	//printMany(2,printer);
	//asm("ecallt r1");
//	printstr("using lookup: ");	
//	printintln(targetCore);
//	printstr("\n");
//	printstr("h ");
//	printint(myID);

	return nOS_requestAction(targetCore | LOCALnOSCHANEND , nOS_lookupChanend_action, chanID , 0, 0) ;
}
// TODO: Add lookup remote chanend. Easy, just need to replace LOCALnOSCHANEND with the remote node's port.
// the remainder should be the same.


unsigned client_getThreadStatus(unsigned tileIndex)
{
	unsigned myCore = get_local_tile_id() ;    // returns node ID
	unsigned myThread = get_logical_core_id() ;  // returns 0--7
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	//return nOS_requestAction(LOCALnOSCHANEND, nOS_createThread_action, myID, startAddress, childRank) ;
	
	return nOS_requestAction((nodeIndexToId(tileIndex) | LOCALnOSCHANEND), nOS_getThreadStatus_action, myID, 0, 0) ;
}


unsigned get_address_p1()
{
	unsigned addr ;
//	get_address_macro(p1) ; // the argument to this macro is a textual label
	return addr ;
}

unsigned get_address_begin1()
{
	unsigned addr ;
//	get_address_macro(begin1) ; // the argument to this macro is a textual label
	return addr ;
}

void p1(chanend c)
{
	unsigned childID ;
	unsigned foo ;

	c :> foo ;

	// create a child thread by making a nOS call. We get the child's thread ID from this
	// SUPERCEDED:
	//childID = nOS_requestAction(LOCALnOSCHANEND, nOS_createThread_action, myID, getStartAddress(p_begin1)) ;
	// NEW IMPLEMENTATION:
	//childID = client_createThread(p_begin1, 42) ;
	// NEWER IMPLEMENTATION USING MACROS, advice courtesy of Dave Lacey
	childID = client_createThread(get_address_begin1(), 100, 42, 0) ;

}

// a child process. The create process routine passes its parent's ID as the first argument
void child1(unsigned parentID)
{
	unsigned myValue ;
	// declare a communication channel
	channel parentCommunicationChannel ;
	// find from the OS what the channel identifier for your parent is
	//parentCommunicationChannel = nOS_requestAction(LOCALnOSCHANEND, nOS_lookupChanend_action, myID) ;

	// now connect to the parent by creating and connecting a fresh channel
	//nOS_requestAction(LOCALnOSCHANEND, nOS_connectNewChannel_action, myID, parentCommunicationChannel) ;

	// now, according to whatever the task is, communicate with the parent
	channelSendWord(parentCommunicationChannel, myValue) ;
	//value = channelReceiveWord(parentCommunicationChannel) ;

}
