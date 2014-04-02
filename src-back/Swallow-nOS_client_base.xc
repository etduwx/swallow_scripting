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

#define THRESHOLD 5 //threshold for creating a thread on current tile without checking neighbors
#define MAXSEARCHDIST 3
#define nrows 8

#define LOCALnOSCHANEND 0x1f02 // hard-coded for core[0] only. TODO: generalise

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
	static visited[32]; // Must be declared as static

	unsigned mylogicore;

	unsigned offsets[32];

	//Insert Offsets Here (Automatically generated 32 lines by the script which depend on the initial configuration of the system.

	//Determination of column and row of current core, if current depth of search is the first level

	col = (myCore >> SWXLB_LPOS) & 0x03;
	row = (myCore >> SWXLB_VPOS);
	coreNum = sw_ncols*row + col;

	mylogicore = coreNum;

	// At the start of search (depth = 0), clear array which keeps track of the nodes which are visited (which is used to make sure 
	// nodes are repeatedly inspected, note: is a static variable)

	if (depth == 0){

		for (unsigned i=0;i<32;i++){
			visited[i] = 0;
		}
	}

	// If current depth is not the first level, the core which is to be inspected is the one passed as a parameter. Determine column and row.

	if(depth > 0)
	{
		coreNum = coreNo;
		col = coreNum % sw_ncols;
		row = coreNum / sw_ncols;
	}

	client_getNoUserThreads(coreNum);

	//If check is at the initial level, then simply create the thread on the local tile if it passes the test.

	if(depth==0 && (client_getNoUserThreads(coreNum) + offsets[coreNum] <= THRESHOLD)){
		//printer[0] = childRank;
		//printer[1] = coreNum;
		//printMany(2,printer);
		return nOS_requestAction((nodeIndexToId(coreNum) | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ;
	}

	//Starting node must be visited.

	if(depth==0){
		visited[coreNum] = 1;
	}

	//If level is not the starting one, and I (current function call of createThreadDynamic) am not supposed to go any deeper (look at my neighbors, variable 
	// value of go_deeper), then I return the number of used threads

	if(go_deeper == 0 && depth > 0) return client_getNoUserThreads(coreNum) + offsets[coreNum];

	searchDeeper = go_deeper - 1;

	while(go_deeper > 0){

	
	for(unsigned i = 0;i<3;i++){
		neighbouringActivity[i] = 0xffffffff; // initialize to "failure"
	}
		numNeighbours = 0;

		//check column, determines the directions in which to look
		switch(col){
			case 0: //look up, down, right
				neighbouringCores[numNeighbours] = coreNum + 1;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
						
						visited[neighbouringCores[numNeighbours]] = 1;
				
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
					
					
				}	
				numNeighbours +=1;			
				if(row>0){
					neighbouringCores[numNeighbours] = coreNum - sw_ncols;
					if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
							
						visited[neighbouringCores[numNeighbours]] = 1;
				
						neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
						
						
				}	
				numNeighbours += 1;
				}
				if(row<nrows-1){
					neighbouringCores[numNeighbours] = coreNum + sw_ncols;
					if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
						
						visited[neighbouringCores[numNeighbours]] = 1;
				
						neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking down
						
					
				}		
					numNeighbours += 1;
				}
				break;
			case 1: //two over right and left
				neighbouringCores[numNeighbours] = coreNum + 2;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
					
					visited[neighbouringCores[numNeighbours]] = 1;
				
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
					
					
				}	

				numNeighbours +=1;

				neighbouringCores[numNeighbours] = coreNum - 1;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
					
					visited[neighbouringCores[numNeighbours]] = 1;
				
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
					
					
				}	
				numNeighbours += 1;

				break;
			case 2: //up,down,right
				neighbouringCores[numNeighbours] = coreNum + 1;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
					
					visited[neighbouringCores[numNeighbours]] = 1;
				
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
						
					
				}
				numNeighbours +=1;
				if(row>0){

					neighbouringCores[numNeighbours] = coreNum - sw_ncols;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
					
					visited[neighbouringCores[numNeighbours]] = 1;
				
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
						
					
				}
				numNeighbours += 1;
				}
				if(row<nrows-1){
					neighbouringCores[numNeighbours] = coreNum + sw_ncols;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
					
					visited[neighbouringCores[numNeighbours]] = 1;
				
					neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking down
					
					
				}	
				numNeighbours += 1;
				}
				break;
			case 3: //two over left and left
			neighbouringCores[numNeighbours] = coreNum - 2 ;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){	
					 
						visited[neighbouringCores[numNeighbours]] = 1;
				
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking right
				
				
				}
				numNeighbours +=1;
				neighbouringCores[numNeighbours] = coreNum - 1;
				if(visited[neighbouringCores[numNeighbours]] == 0 || searchDeeper > 0){
					
				visited[neighbouringCores[numNeighbours]] = 1;
				
				neighbouringActivity[numNeighbours] = client_createThreadDynamic(startAddress,childRank,depth+1,searchDeeper,neighbouringCores[numNeighbours]); // looking up
				
				
				}
				numNeighbours += 1;
				break;
		}

		minimum = 0xffffffff;

		//find least busy neighbor
		for (unsigned i=0;i<numNeighbours;i++){
			if (neighbouringActivity[i] < minimum){
				minimum = neighbouringActivity[i];
				smallest = i;
			}
		}

		if(searchDeeper> 0) minimum = minimum >> 8;



		//check least busy neighbor to see if it passes the maximum "busyness" condition. if it does not, return a failure result to the caller. if it does, return number of active threads
		// of the least busy neighbor to the caller

		//if current search level is the first one, then create the thread on the least busy core that passes the condition. If none pass, then instruct lower-levels of the search tree to search 
		// deeper by increasing the searchDeeper variable.
		
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
			if(depth == 0)
				searchDeeper += 1;
			else
				return 0xffffffff;
		}
	}
	else{
		if(depth == 0){
			if(minimum <= THRESHOLD){
			coreNum = neighbouringActivity[smallest] & 0xff;
			break;
		}
		else
			{searchDeeper += 1;}
	}
		else{
			if(minimum <= THRESHOLD){
			return neighbouringActivity[smallest];
	}
	else
		return 0xffffffff;
	}
}

}
 //printer[0] = 0xcaca0000 + (searchDeeper << 12) + childRank;
//	printer[1] = coreNum;
//	printer[2] = minimum;

	return nOS_requestAction((nodeIndexToId(coreNum) | LOCALnOSCHANEND), nOS_createThread_action, myID, startAddress, childRank) ;

}

unsigned client_createThreadRandom(unsigned startAddress, unsigned childRank,unsigned min,unsigned max){

	unsigned myCore = get_local_tile_id() ;    // returns node ID
	unsigned myThread = get_logical_core_id() ;  // returns 0--7
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	unsigned range = max-min;
	//unsigned printer[2];
	unsigned targetCore;
	unsigned doRand = 1;
	//printer[0] = childRank;

	unsigned offsets[32];

	//Insert Offsets Here



	//Repeatedly perform a random selection of the tiles within the (min,max) range until a suitable candidate (tile that
	// has equal to or fewer than the maximum number of currently active threads) is chosen, then create the thread on that
	// tile by invoking the standard nOS createThread interface
	while(doRand){
		targetCore = min + (rand() % range);
		if(client_getNoUserThreads(targetCore) + offsets[targetCore] <= THRESHOLD) doRand = 0;

	}
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
}

/** Pass an allocated channel and its destination and create the connection.
*
*/
channel client_connectNewLocalChannel(unsigned channelIndex, endpoint destination)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned myThread = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	unsigned chanID = (myThread << 16) | channelIndex ;

	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_connectNewChannel_action, chanID, destination, 0) ;
}

/** Request a new channel be allocated by the OS with the given index. Returns -1 if not possible.
*
*/
channel client_allocateNewLocalChannel(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned myThread = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | myThread ;   // a unique ID for this thread
	unsigned chanID = (myThread << 16) | channelIndex ;
	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_allocateNewChannel_action, chanID, 0, 0) ;
}

/** Ask for the currently connected destination of the supplied channel index.
*
*/
endpoint client_getLocalChannelDest(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16 ) | channelIndex ;

	return nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_getChannelDest_action, chanID, 0, 0) ;
}

/** Take a currently connected local channel index and update its destination.
*
*/
void client_updateLocalChannelDest(unsigned channelIndex, endpoint destination)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16) | channelIndex ;

	nOS_requestAction(myCore << 16 | LOCALnOSCHANEND, nOS_updateChannelDest_action, chanID, destination, 0) ;
}


void client_releaseLocalChannel(unsigned channelIndex)
{
	unsigned myCore = get_local_tile_id() ;
	unsigned threadID = get_logical_core_id() ;
	unsigned myID = (myCore << 16) | threadID ;   // a unique ID for this thread
	unsigned chanID = (threadID << 16) | channelIndex ;

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


unsigned client_getThreadStatus(unsigned nodeIndex)
{
	return nOS_requestAction((nodeIndexToId(nodeIndex) | LOCALnOSCHANEND), nOS_getThreadStatus_action, (nodeIndexToId(nodeIndex) >> 16), 0, 0) ;
}

unsigned client_getNoUserThreads(unsigned nodeIndex)
{
	return nOS_requestAction((nodeIndexToId(nodeIndex) | LOCALnOSCHANEND), nOS_getNoUserThreads_action, 0, 0, 0) ;
}




// get a global stats value from a core
unsigned client_getCommsStat(unsigned nodeID, unsigned statIndex)
{
	return nOS_requestAction((nodeID << 16 | LOCALnOSCHANEND), nOS_getCommsStats_action, statIndex, 0, 0) ;
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
