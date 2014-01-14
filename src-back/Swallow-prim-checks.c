#include "Swallow-helpers.h"
#include "Swallow-nOS_client.h"
#include "swallow_comms2.h"
#include "Swallow-prim-checks.h"
#define THREAD_NO_1 1
#define THREAD_NO_2 1
#define THREAD_NUMERO_1 3
#define THREAD_NUMERO_2 3

#include "Swallow-prim.h"

void prim_child_root(unsigned rank){
	channel com_channel;
	unsigned printer[2];
	com_channel = client_allocateNewLocalChannel(15);
	printer[0] = rank;
	printer[1] = com_channel;
//	printMany(2,printer);
	channelListen(com_channel);
	xc_prim_child_root(rank,com_channel);
} 

void listen_check_wall(unsigned parent_id, unsigned rank){

	channel parentCommunicationChannel;
	unsigned parent_chan;
	channel north_connection;
	channel east_connection;
	channel south_connection;
	channel west_connection;
	channel com_channel,consensus_channel;
	unsigned in_var;
	unsigned column;
	unsigned row;
	unsigned pass_token;
	unsigned channels_lookup[6];
	unsigned os_debug[3];

	unsigned visited[(MAZELENGTH/DIV_DEGREE_PRIM_Y)][(MAZEWIDTH/DIV_DEGREE_PRIM_X)];
	unsigned num_walls = (MAZEWIDTH/DIV_DEGREE_PRIM_X+1) * (MAZELENGTH/DIV_DEGREE_PRIM_Y) + (MAZELENGTH/DIV_DEGREE_PRIM_Y + 1) * (MAZELENGTH/DIV_DEGREE_PRIM_X);
	unsigned walls_touched[(MAZEWIDTH/DIV_DEGREE_PRIM_X+1) * (MAZELENGTH/DIV_DEGREE_PRIM_Y) + (MAZELENGTH/DIV_DEGREE_PRIM_Y + 1) * (MAZELENGTH/DIV_DEGREE_PRIM_X)];


	parent_chan = client_lookupParentChanend(parent_id, rank);
	parentCommunicationChannel = client_connectNewLocalChannel(12, parent_chan);

	os_debug[0] = rank;
	os_debug[1] = parentCommunicationChannel;
	os_debug[2] = 0;
//	printMany(3,os_debug);
	delay_execution(STARTDELAY);

	//Insert core_list Here
core_list_prim[0] = 24;
core_list_prim[1] = 25;
core_list_prim[2] = 26;
core_list_prim[3] = 27;


	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) 
		com_channel = client_lookupSpecificChanend(core_list_prim[rank],THREAD_NO_1,15);
	else
		com_channel = client_lookupSpecificChanend(core_list_prim[rank],THREAD_NO_2,15);

	com_channel = client_connectNewLocalChannel(13,com_channel);

	os_debug[0] = rank;
	os_debug[1] = com_channel;
	os_debug[2] = 1;
//	printMany(3,os_debug);

	pass_token = channelReceiveWord(parentCommunicationChannel);

	if(pass_token != 1) asm("ecallt r0");

	//printMany(3,os_debug);
	if(rank >= DIV_DEGREE_PRIM_X) north_connection = client_lookupSpecificChanend(core_list_prim[rank - DIV_DEGREE_PRIM_X],THREAD_NO_1, 2);
	os_debug[1] = 51;
	//printMany(3,os_debug);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) {
		if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) 
			east_connection = client_lookupSpecificChanend(core_list_prim[rank + 1],THREAD_NO_1, 3);
		else
			east_connection = client_lookupSpecificChanend(core_list_prim[rank + 1],THREAD_NO_2, 3);
	}

	os_debug[1] = 52;
	//printMany(3,os_debug);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) south_connection = client_lookupSpecificChanend(core_list_prim[rank + DIV_DEGREE_PRIM_X],THREAD_NO_2, 0);
	os_debug[1] = 53;
	//printMany(3,os_debug);
	if(rank % DIV_DEGREE_PRIM_X != 0) {
		if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) 
			west_connection = client_lookupSpecificChanend(core_list_prim[rank-1],THREAD_NO_1, 1);
		else
			west_connection = client_lookupSpecificChanend(core_list_prim[rank-1],THREAD_NO_2, 1);
	}
	os_debug[1] = 54;
	//printMany(3,os_debug);

	channels_lookup[1] = north_connection;
	channels_lookup[2] = east_connection;
	channels_lookup[3] = south_connection;
	channels_lookup[4] = west_connection;
	channels_lookup[0] = rank;
	//printMany(5,channels_lookup);

	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) south_connection = client_connectNewLocalChannel(4, south_connection);
	else south_connection = client_allocateNewLocalChannel(8);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) east_connection = client_connectNewLocalChannel(7, east_connection);
	else east_connection = client_allocateNewLocalChannel(11);
	if(rank % DIV_DEGREE_PRIM_X != 0) west_connection = client_connectNewLocalChannel(5, west_connection);
	else west_connection = client_allocateNewLocalChannel(9);
	if(rank >= DIV_DEGREE_PRIM_X) north_connection = client_connectNewLocalChannel(6, north_connection);
	else north_connection = client_allocateNewLocalChannel(10);
	

	channels_lookup[1] = north_connection;
	channels_lookup[2] = east_connection;
	channels_lookup[3] = south_connection;
	channels_lookup[4] = west_connection;
	channels_lookup[0] = rank + 0x10000000;
	//printMany(5,channels_lookup);

	channelSendWord(parentCommunicationChannel,1);
	pass_token = channelReceiveWord(parentCommunicationChannel);
	/*if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) 
		consensus_channel = client_lookupSpecificChanend(rank+OFFSET,THREAD_NUMERO_1,21);
	else
		consensus_channel = client_lookupSpecificChanend(rank+OFFSET,THREAD_NUMERO_2,21);
*/
	//consensus_channel = client_connectNewLocalChannel(14,consensus_channel);
	consensus_channel = 0;
	xc_listen_check_wall(parentCommunicationChannel,rank,north_connection,east_connection,south_connection,west_connection,com_channel,consensus_channel);
}

void getCompletedSignal(unsigned child_channels[]){

	xc_getCompletedSignal(child_channels);
}


void send_word(unsigned id,unsigned value){
	channelSendWord(id,value);

}

void set_up_consensus(unsigned parent_id, unsigned rank){

	channel north_connection;
	channel east_connection;
	channel south_connection;
	channel west_connection;
	channel consensus_channel;
	unsigned in_var;
	unsigned column;
	unsigned row;
	unsigned pass_token;
	unsigned channels_lookup[6];
	unsigned os_debug[3];
	channel siblingCommunicationChannel_north;
	channel siblingCommunicationChannel_east;
	channel siblingCommunicationChannel_south;
	channel siblingCommunicationChannel_west;
	channel parentCommunicationChannel;

	consensus_channel = client_allocateNewLocalChannel(21);

	channelListen(consensus_channel);

	parentCommunicationChannel = client_lookupParentChanend(parent_id,rank+NUM_CHILDREN_PRIM);
	parentCommunicationChannel = client_connectNewLocalChannel(12, parentCommunicationChannel);
	if(rank >= DIV_DEGREE_PRIM_X) siblingCommunicationChannel_north = client_allocateNewLocalChannel(0);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) siblingCommunicationChannel_east = client_allocateNewLocalChannel(1);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) siblingCommunicationChannel_south = client_allocateNewLocalChannel(2);
	if(rank % DIV_DEGREE_PRIM_X != 0) siblingCommunicationChannel_west = client_allocateNewLocalChannel(3);

	os_debug[0] = rank;
	os_debug[1] = parentCommunicationChannel;
	os_debug[2] = 0;
//	printMany(3,os_debug);

	channelSendWord(parentCommunicationChannel,5);

	os_debug[0] = rank;
	os_debug[2] = 1;
//	printMany(3,os_debug);

	pass_token = channelReceiveWord(parentCommunicationChannel);

	if(pass_token != 1) asm("ecallt r0");

	//printMany(3,os_debug);
	if(rank >= DIV_DEGREE_PRIM_X) north_connection = client_lookupSpecificChanend(core_list_prim[rank - DIV_DEGREE_PRIM_X],THREAD_NUMERO_1, 2);
	os_debug[1] = 51;
	//printMany(3,os_debug);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) {
		if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) 
			east_connection = client_lookupSpecificChanend(core_list_prim[rank + 1],THREAD_NUMERO_1, 3);
		else
			east_connection = client_lookupSpecificChanend(core_list_prim[rank + 1],THREAD_NUMERO_2, 3);
	}

	os_debug[1] = 52;
	//printMany(3,os_debug);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) south_connection = client_lookupSpecificChanend(core_list_prim[rank + DIV_DEGREE_PRIM_X],THREAD_NUMERO_2, 0);
	os_debug[1] = 53;
	//printMany(3,os_debug);
	if(rank % DIV_DEGREE_PRIM_X != 0) {
		if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) 
			west_connection = client_lookupSpecificChanend(core_list_prim[rank-1],THREAD_NUMERO_1, 1);
		else
			west_connection = client_lookupSpecificChanend(core_list_prim[rank-1],THREAD_NUMERO_2, 1);
	}
	os_debug[1] = 54;
	//printMany(3,os_debug);

	channels_lookup[1] = north_connection;
	channels_lookup[2] = east_connection;
	channels_lookup[3] = south_connection;
	channels_lookup[4] = west_connection;
	channels_lookup[0] = rank;
//	printMany(5,channels_lookup);

	channelSendWord(parentCommunicationChannel,1);
	if(rank >= DIV_DEGREE_PRIM_X) channelListen(siblingCommunicationChannel_north);
	if(rank % DIV_DEGREE_PRIM_X != 0) channelListen(siblingCommunicationChannel_west);
	
	pass_token = channelReceiveWord(parentCommunicationChannel);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) south_connection = client_connectNewLocalChannel(4, south_connection);
	else south_connection = client_allocateNewLocalChannel(8);
	if(rank % DIV_DEGREE_PRIM_X != 0) west_connection = client_connectNewLocalChannel(5, west_connection);
	else west_connection = client_allocateNewLocalChannel(9);
	if(rank >= DIV_DEGREE_PRIM_X) north_connection = client_connectNewLocalChannel(6, north_connection);
	else north_connection = client_allocateNewLocalChannel(10);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) east_connection = client_connectNewLocalChannel(7, east_connection);
	else east_connection = client_allocateNewLocalChannel(11);

	channelSendWord(parentCommunicationChannel,1);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) channelListen(siblingCommunicationChannel_east);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) channelListen(siblingCommunicationChannel_south);

	pass_token = channelReceiveWord(parentCommunicationChannel);

	pass_func(parentCommunicationChannel,rank,north_connection,east_connection,south_connection,west_connection,siblingCommunicationChannel_north,siblingCommunicationChannel_east,siblingCommunicationChannel_south,siblingCommunicationChannel_west,consensus_channel);
}


