#include <xs1.h>
#include <print.h>
#include <math.h>
#include <stdlib.h>
#include <platform.h>
#include <time.h>
#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_initialFunctions.h"
#include "Swallow-nOS_client.h"
#include "Swallow-prim.h"
#include "Swallow-prim-checks.h"

#define STARTDELAY 625000000 //625 million reference clock cycles of start delay (5 secs)
#define NUM_VISITED_LIMIT 10

#define LOCALnOSCHANEND 0x1f02 // hard-coded for core[0] only. TODO: generalise

void startSync(chanend c_out)
{
	unsigned foo;

	foo = 42;
	c_out <: foo;
}

//Prim's algorithm parameters
void prim_main(chanend c_in, unsigned shouldIRun){

	unsigned foo;

	c_in :> foo;

	for(int i=0; i < NUM_CHILDREN; i++){
		client_createThread(0,100,i,i+1);
	}

}
/*
select getMazeComponents(unsigned in_var, channel listenChannel, unsigned mazesol_vertical[][MAZELENGTH],unsigned mazesol_horizontal[][MAZELENGTH]){
	unsigned channel_listen = listenchannel >> 16;
	unsigned ind1x = ((channel_listen % DIV_DEGREE) * (MAZEWIDTH/DIV_DEGREE));
	unsigned ind2x = (ind1x + (MAZEWIDTH/DIV_DEGREE) - 1);
	unsigned ind1y = ((channel_listen / DIV_DEGREE) * (MAZELENGTH/DIV_DEGREE));
	unsigned ind2y = (ind2y + (MAZEWIDTH/DIV_DEGREE) - 1);

	if((channel_listen % DIV_DEGREE) == DIV_DEGREE - 1) ind2x = ind2x + 1;
	if((channel_listen / DIV_DEGREE) == DIV_DEGREE - 1) ind2y = ind2y + 1;

	case listenChannel :> in_var:
		mazesol_vertical[ind1x][ind1y] = in_var;
		for(int i = ind1x; i<ind2x;i++){
			if(i==ind1x)j=ind1y+1;
			else j = ind1y;
			while(j<ind2y){
				listenChannel :> in_var;
				mazesol_vertical[i][j] = in_var;
				j++;
			}
		}
		for(int i = ind1x; i<ind2x;i++){
					j = ind1y;
					while(j<ind2y){
						listenChannel :> in_var;
						mazesol_horizontal[i][j] = in_var;
						j++;
					}
				}
		break;
}
*/
void prim_child(unsigned parent_id, unsigned rank){
	unsigned visited[(MAZELENGTH/DIV_DEGREE_Y)][(MAZEWIDTH/DIV_DEGREE_X)];
	unsigned num_walls = (MAZEWIDTH/DIV_DEGREE_X+1) * (MAZELENGTH/DIV_DEGREE_Y) + (MAZELENGTH/DIV_DEGREE_Y + 1) * (MAZELENGTH/DIV_DEGREE_X);
	unsigned walls_touched[(MAZEWIDTH/DIV_DEGREE_X+1) * (MAZELENGTH/DIV_DEGREE_Y) + (MAZELENGTH/DIV_DEGREE_Y + 1) * (MAZELENGTH/DIV_DEGREE_X)];

	chan sync_channel;

	par{
		prim_child_root(parent_id, rank,visited,walls_touched);
		listen_check_wall(rank,visited,walls_touched);
	}
}

void prim_child_root(unsigned parent_id, unsigned rank, unsigned visited[][MAZEWIDTH/DIV_DEGREE_Y],unsigned walls_touched[]){

	// matrix to store walls
	// array to store visited cells
	// variable to keep track of the number of visited cells
	//

	unsigned num_visited = 0;
	unsigned num_walls = (MAZEWIDTH/DIV_DEGREE_X+1) * (MAZELENGTH/DIV_DEGREE_Y) + (MAZELENGTH/DIV_DEGREE_Y + 1) * (MAZELENGTH/DIV_DEGREE_X) ;
	unsigned mazesize = (MAZEWIDTH/DIV_DEGREE_X) * (MAZELENGTH/DIV_DEGREE_Y);
	unsigned random_index;
	unsigned foo;

	channel siblingCommunicationChannel_North;
	channel siblingCommunicationChannel_East;
	channel siblingCommunicationChannel_South;
	channel siblingCommunicationChannel_West;

	if(rank >= DIV_DEGREE_X) siblingCommunicationChannel_North = client_allocateNewLocalChannel(0);
	if(rank % DIV_DEGREE_X != DIV_DEGREE_X - 1) siblingCommunicationChannel_East = client_allocateNewLocalChannel(1);
	if(rank/DIV_DEGREE_X != DIV_DEGREE_Y - 1) siblingCommunicationChannel_South = client_allocateNewLocalChannel(2);
	if(rank % DIV_DEGREE_X != 0) siblingCommunicationChannel_West = client_allocateNewLocalChannel(3);

	if(rank >= DIV_DEGREE_X) channelListen(siblingCommunicationChannel_North);
	if(rank % DIV_DEGREE_X != DIV_DEGREE_X - 1) channelListen(siblingCommunicationChannel_East);
	if(rank/DIV_DEGREE_X != DIV_DEGREE_Y - 1) channelListen(siblingCommunicationChannel_South);
	if(rank % DIV_DEGREE_X != 0) channelListen(siblingCommunicationChannel_West);

	srand(1);

	for(int i=0; i<num_walls;i++){
		walls_touched[i] = 0;
	}

	while (num_visited < NUM_VISITED_LIMIT){

		random_index = rand() * num_walls;

		while(1){
			if(walls_touched[random_index] == 1){
				if(random_index<num_walls-1)
					random_index++;
				else
					random_index = 0;
			}else
			{
				if(check_maze(random_index,visited,rank,siblingCommunicationChannel_North,siblingCommunicationChannel_East,siblingCommunicationChannel_South,siblingCommunicationChannel_West)){
					walls_touched[random_index] = 1;
					num_visited++;
					break;
				}
				else{
					random_index++;
					continue;
				}
			}

		}
	}


}

unsigned xc_check_maze(unsigned in_var,unsigned visited[][MAZEWIDTH/DIV_DEGREE_X],unsigned rank,unsigned north,unsigned east,unsigned south,unsigned west){
	unsigned column;
	unsigned row;
	unsigned check1, check2;

if(in_var >= ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X)){
	in_var = in_var - ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
	row = in_var/(MAZEWIDTH/DIV_DEGREE_X + 1);
	column = in_var % (MAZEWIDTH/DIV_DEGREE_X + 1);

		switch(column){
		case 0:
			in_var = in_var + ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
			check1 = check_edge(rank,in_var,north,east,south,west);
			check2 = (visited[row][column]);
			break;
		case MAZEWIDTH/DIV_DEGREE_X:
			in_var = in_var + ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
			check1 = (visited[row][column-1]);
			check2 = check_edge(rank,in_var,north,east,south,west);
			break;
		default:
			check1 = (visited[row][column]);
			check2 = (visited[row][column -1]);
			break;
		}

		if(check1 && check2)
				return 0;
		else{
			if(column < MAZEWIDTH/DIV_DEGREE_X)
				visited[row][column] = 1;
			if (column > 0)
				visited[row][column-1] = 1;
			return 1;
		}
} else
{
		row = in_var/(MAZEWIDTH/DIV_DEGREE_X);
		column = in_var % (MAZEWIDTH/DIV_DEGREE_X);
		switch(row){
				case 0:
					check1 = check_edge(rank,in_var,north,east,south,west);
					check2 = (visited[row][column]);
					break;
				case MAZEWIDTH/DIV_DEGREE_Y:
					check1 = (visited[row-1][column]);
					check2 = check_edge(rank,in_var,north,east,south,west);
break;
				default:
					check1 = (visited[row-1][column]);
					check2 = (visited[row][column]);
				break;
				}

				if( check1 && check2)
						return 0;
				else{
					if(row>0)
						visited[row-1][column] = 1;
					if(row < MAZEWIDTH/DIV_DEGREE_Y)
						visited[row][column] = 1;
					return 1;
				}
}
}

unsigned xc_check_edge(unsigned rank, unsigned in_var,unsigned north,unsigned east,unsigned south,unsigned west){
	unsigned over;
	unsigned return_value;

	if(in_var > ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X)){
		over = in_var - ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
		if(over % (MAZEWIDTH/DIV_DEGREE_X + 1) !=0){
			channelSendWord(east,in_var - MAZEWIDTH/DIV_DEGREE_X);
			return_value = channelReceiveWord(east);
		}else{
			channelSendWord(west,in_var + MAZEWIDTH/DIV_DEGREE_X);
			return_value = channelReceiveWord(west);
		}

	}else{
		over = in_var;
				if(over/(MAZEWIDTH/DIV_DEGREE_X) !=0){
					channelSendWord(south,in_var - (MAZELENGTH/DIV_DEGREE_Y)*(MAZEWIDTH/DIV_DEGREE_X));
					return_value = channelReceiveWord(south);
				}else{
					channelSendWord(north,in_var + (MAZELENGTH/DIV_DEGREE_Y)*(MAZEWIDTH/DIV_DEGREE_X));
					return_value = channelReceiveWord(north);
	}
	}
	return return_value;
}

void xc_listen_check_wall(unsigned rank, unsigned visited[][MAZEWIDTH/DIV_DEGREE_X],unsigned walls_touched[],chanend north_conection,chanend east_connection,chanend south_connection,chanend west_connection){

	channel north_connection;
	channel east_connection;
	channel south_connection;
	channel west_connection;
	unsigned in_var;
	unsigned column;
	unsigned row;

	timer t;
	unsigned time;

	//start delay
	    t :> time;
	    time += STARTDELAY;
	    t when timerafter(time) :> void;

	if(rank >= DIV_DEGREE_X) north_connection = client_lookupSpecificChanend(rank - DIV_DEGREE_X+1,1, 2);
	if(rank % DIV_DEGREE_X != DIV_DEGREE_X - 1) east_connection = client_lookupSpecificChanend(rank + 2,1, 4);
	if(rank/DIV_DEGREE_X != DIV_DEGREE_Y - 1) south_connection = client_lookupSpecificChanend(rank + DIV_DEGREE_X+1,1, 0);
	if(rank % DIV_DEGREE_X != 0) west_connection = client_lookupSpecificChanend(rank,1, 1);

	if(rank/DIV_DEGREE_X != DIV_DEGREE_Y - 1) south_connection = client_connectNewLocalChannel(1, south_connection);
	if(rank % DIV_DEGREE_X != 0) west_connection = client_connectNewLocalChannel(2, west_connection);
	if(rank >= DIV_DEGREE_X) north_connection = client_connectNewLocalChannel(3, north_connection);
	if(rank % DIV_DEGREE_X != DIV_DEGREE_X - 1) east_connection = client_connectNewLocalChannel(4, east_connection);


	  select{
	    	case south_connection :> in_var :
	    		row = in_var/(MAZEWIDTH/DIV_DEGREE_X);
	    		column = in_var % (MAZEWIDTH/DIV_DEGREE_X);
	    		if(visited[row-1][column] == 1)
	    			channelSendWord(south_connection,(unsigned) 0);
	    		else{
	    			visited[row-1][column] = 1;
	    			walls_touched[in_var] = 1;
	    			channelSendWord(south_connection,(unsigned) 1);
	    		}
	    		break;
	    	case west_connection :> in_var :
	    		in_var = in_var - ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
	    		row = in_var/(MAZEWIDTH/DIV_DEGREE_X + 1);
	    		column = in_var % (MAZEWIDTH/DIV_DEGREE + 1);
	    	    if(visited[row][column] == 1)
	    	    	channelSendWord(west_connection,(unsigned) 0);
	    	    else{
	    	    	visited[row][column] = 1;
	    	    	in_var = in_var + ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
	    	    	walls_touched[in_var] = 1;
	    	    	channelSendWord(west_connection,(unsigned) 1);
	    	    	}
	    		break;
	    	case north_connection :> in_var :
	    		row = in_var/(MAZEWIDTH/DIV_DEGREE_X);
	    		column = in_var % (MAZEWIDTH/DIV_DEGREE_X);
	    		if(visited[row][column] == 1)
	    			channelSendWord(north_connection,(unsigned) 0);
	    		else{
	    			visited[row][column] = 1;
	    			walls_touched[in_var] = 1;
	    			channelSendWord(north_connection,(unsigned) 1);
	    			}
	    		break;
	    	case east_connection :> in_var :
	    		in_var = in_var - ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
	    		row = in_var/(MAZEWIDTH/DIV_DEGREE_X + 1);
	    		column = in_var % (MAZEWIDTH/DIV_DEGREE + 1);
	    		if(visited[row][column-1] == 1)
	    			channelSendWord(east_connection,(unsigned) 0);
	    		else{
	    			visited[row][column-1] = 1;
	    			in_var = in_var + ((MAZELENGTH/DIV_DEGREE_Y)+1)*(MAZEWIDTH/DIV_DEGREE_X);
	    			walls_touched[in_var] = 1;
	    			channelSendWord(east_connection,(unsigned) 1);
	    			}
	    		break;
	    }

}


/*
select sync_edge(unsigned in_var, channel listenChannel, unsigned visited[][MAZELENGTH],unsigned walls_touched[]){

	case listenChannel :> in_var:
		if(in_var > ((MAZEWIDTH/DIV_DEGREE)+1)*(MAZELENGTH/DIV_DEGREE)){
			in_var = in_var - ((MAZEWIDTH/DIV_DEGREE)+1)*(MAZELENGTH/DIV_DEGREE);
			row = in_var/(MAZEWIDTH/DIV_DEGREE + 1);
			column = in_var % (MAZEWIDTH/DIV_DEGREE + 1);
			if(row == MAZELENGTH/DIV_DEGREE + 1){
				if(visited[row-1][column]==1)
					channelSendWord(listenChannel,(unsigned) 0);
				else{
					visited[row-1][column]=1;
					in_var = in_var + ((MAZEWIDTH/DIV_DEGREE)+1)*(MAZELENGTH/DIV_DEGREE);
					walls_touched[in_var]=1;
					channelSendWord(listenChannel,(unsigned) 1);
				}
			}else{
				if(visited[row][column]==1)
					channelSendWord(listenChannel,(unsigned) 0);
				else{
					visited[row][column]=1;
					in_var = in_var + ((MAZEWIDTH/DIV_DEGREE)+1)*(MAZELENGTH/DIV_DEGREE);
					walls_touched[in_var]=1;
					channelSendWord(listenChannel,(unsigned) 1);
				}
			}
		}
			else{
				row = in_var/(MAZEWIDTH/DIV_DEGREE);
				column = in_var % (MAZEWIDTH/DIV_DEGREE);
			if(column== MAZEWIDTH/DIV_DEGREE + 1){
				if(visited[row][column-1]==1)
					channelSendWord(listenChannel,(unsigned) 0);
					else{
						visited[row][column-1]=1;
						walls_touched[in_var]=1;
						channelSendWord(listenChannel,(unsigned) 1);
					}
				} else{
					if(visited[row][column]==1)
						channelSendWord(listenChannel,(unsigned) 0);
					else{
						visited[row][column]=1;
						walls_touched[in_var]=1;
						channelSendWord(listenChannel,(unsigned) 1);
					}

				}
			}
		break;
}
*/
