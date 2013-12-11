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
#include "swallow_comms.h"
#include "Power_Measure_Lib.h"
#define NUM_VISITED_LIMIT 64
#define SET_MODE 1

void startSync(chanend c_out)
{
	unsigned foo;

	foo = 42;
	c_out <: foo;
}

//Prim's algorithm parameters
void prim_main(chanend c_in, unsigned shouldIRun, chanend control_channel){

	unsigned foo, child_token,num_done;
	channel myChannels[2*NUM_CHILDREN_SWALLOW];
	unsigned printer[8];
	double tempor;
c_in :> foo;

      num_done = 0;

      for(unsigned i=0;i<2*NUM_CHILDREN_SWALLOW;i++){
	      myChannels[i] = client_allocateNewLocalChannel(i);
      }
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      client_createThread(0,100,i,i+OFFSET);
	      channelListen(myChannels[i]);
      }

      delay_execution(STARTDELAY);
      
      
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      channelSendWord(myChannels[i],1);
	      child_token = channelReceiveWord(myChannels[i]);
	      if(child_token != 1) asm("ecallt r0");
      }	
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      channelSendWord(myChannels[i],2);
	      //channelListen(myChannels[i+NUM_CHILDREN_SWALLOW]);
      }

      //delay_execution(STARTDELAY);
		//client_createThread(1,100,0,OFFSET);

     /* for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      child_token = channelReceiveWord(myChannels[i+NUM_CHILDREN_SWALLOW]);
	      if(child_token != 5) asm("ecallt r0");
      } 
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      //	printOne(i+10);
	      channelSendWord(myChannels[i+NUM_CHILDREN_SWALLOW],1);
	      child_token = channelReceiveWord(myChannels[i+NUM_CHILDREN_SWALLOW]);
	      if(child_token != 1) asm("ecallt r0");
      }	
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      channelSendWord(myChannels[i+NUM_CHILDREN_SWALLOW],2);
	      child_token = channelReceiveWord(myChannels[i+NUM_CHILDREN_SWALLOW]);
      }

      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      channelSendWord(myChannels[i+NUM_CHILDREN_SWALLOW],2);
      }	*/
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      channelSendWord(myChannels[i],3);
      }
      for(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++){
	      child_token = channelReceiveWord(myChannels[i]);
      }

//      client_createThread(1,100,0,16);

      //control_channel <: (char) POWERMEASURE_START;
      while(num_done < NUM_CHILDREN_SWALLOW){
	      getCompletedSignal(myChannels);
	      num_done++;
      }
      //control_channel <: (char) POWERMEASURE_STOP;
      //control_channel <: (char) POWERMEASURE_READVALUES;

//control_channel :> printer[0];

		 for (unsigned k = 1; k < 8; k++){

//control_channel :> tempor;

		 printer[k] = (tempor*1000/(double) printer[0]) ;

		 }

		 //printMany(8,printer); 

}

void prim_child(unsigned parent_id, unsigned rank){

	par{
		prim_child_root(rank);
		listen_check_wall(parent_id,rank);
		//set_up_consensus(parent_id,rank);
	}
}

static inline void printOne(unsigned value) 
{
	unsigned data[1];
	data[0] = value;

	//printMany(1,data);

}
void pass_func(chanend parentCommunicationChannel,unsigned rank,chanend north_connection,chanend east_connection,chanend south_connection,chanend west_connection,chanend siblingCommunicationChannel_north,chanend siblingCommunicationChannel_east,chanend siblingCommunicationChannel_south,chanend siblingCommunicationChannel_west,chanend consensus_channel){

	chan self_channel;

	par{
		//		consensus(rank,north_connection,east_connection,south_connection,west_connection,self_channel);
		//		submit_votes(rank,siblingCommunicationChannel_north,siblingCommunicationChannel_east,siblingCommunicationChannel_south,siblingCommunicationChannel_west,consensus_channel,self_channel);
	}

}

void xc_getCompletedSignal(chanend child_channels[]){

	unsigned hi;

	select{
		case(unsigned i=0;i<NUM_CHILDREN_SWALLOW;i++)
			getValue(child_channels[i],hi);

	}
}

select getValue(chanend child_channel,unsigned hi){

	case child_channel :> hi:
			    break;

}


void submit_votes(unsigned rank,chanend north,chanend east,chanend south,chanend west,chanend consensus_channel,chanend self_channel){
	timer t;
	unsigned time,time_begin,time_end_cycle;
	unsigned program_status = 1;
	unsigned printing_again[2]; 
	unsigned first = 1;

consensus_channel :> time;

		   while(1){

t :> time;
   time += CONTROL_INTERVAL;

   select{
	   case t when timerafter(time) :> void:
					 //			asm("ldaw %0, dp[prim_status]":"=r"(program_status) :);
					 //			printOne(program_status);
					 //	  		printing_again[0]=rank;
					 //			printing_again[1]= program_status;
					 //			//printMany(2,printing_again);

					 if(rank >= DIV_DEGREE_PRIM_X)
						 north <: program_status -1;
					 if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1)	
						 east <: program_status -1;	
					 if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1)			
						 south <: program_status -1;	
					 if(rank % DIV_DEGREE_PRIM_X != 0)
						 west <: program_status -1;	
					 //t :> time_end_cycle;
					 //			printOne(time_end_cycle-time);
					 break;
	   case consensus_channel :> program_status :
				   self_channel <: program_status-1;
				   break;
   }
		   }

}

void consensus(unsigned rank,chanend north_connection,chanend east_connection,chanend south_connection,chanend west_connection,chanend self_channel){

	unsigned printing_again[3];
	unsigned status[5];	
	unsigned program_status;
	unsigned input;
	unsigned num_votes_received = 0;
	unsigned limit;
	unsigned setting;
	unsigned flags[5];
	for(unsigned i=0;i<4;i++){
		status[i] = 0;
		flags[i] = 0;
	}
	flags[4] = 1;

	limit = 2;	
	status[4] = 0;
	while(1){
		/*	printing_again[1] = time;
			printing_again[0] = rank;
			//printMany(2,printing_again);*/
		select{
			case north_connection :> input:
					       if(flags[0] != 0) break;
					       status[0] = input;
					       printing_again[0] = rank;
					       printing_again[1] = 1;
					       printing_again[2] = input;
					       //	//printMany(3,printing_again);
					       num_votes_received++;
					       flags[0] = 1;
					       if(num_votes_received == limit){
						       //		printOne(num_votes_received);
						       num_votes_received = 0;
						       setting = tally_votes(status,flags,rank);
						       //		setFreqDivider(setting,rank);
						       for(unsigned i=0;i<4;i++){
							       flags[i] = 0;
						       }
					       }
					       break;
			case east_connection :> input:
					      if(flags[1] != 0) break;
					      status[1] = input;
					      printing_again[0] = rank;
					      printing_again[1] = 2;
					      printing_again[2] = input;
					      //	//printMany(3,printing_again);
					      num_votes_received++;
					      flags[1] = 1;
					      if(num_votes_received == limit){
						      //		printOne(num_votes_received);
						      num_votes_received = 0;
						      setting = tally_votes(status,flags,rank);
						      //		setFreqDivider(setting,rank);
						      for(unsigned i=0;i<4;i++){
							      flags[i] = 0;
						      }
					      }
					      break;
			case south_connection :> input:
					       if(flags[2] != 0) break;
					       status[2] = input;
					       printing_again[0] = rank;
					       printing_again[1] = 3;
					       printing_again[2] = input;
					       //	//printMany(3,printing_again);
					       num_votes_received++;
					       flags[2] = 1;
					       if(num_votes_received == limit){
						       //		printOne(num_votes_received);
						       num_votes_received = 0;
						       setting = tally_votes(status,flags,rank);
						       //		setFreqDivider(setting,rank);
						       for(unsigned i=0;i<4;i++){
							       flags[i] = 0;
						       }
					       }
					       break;
			case west_connection :> input:
					      if(flags[3] != 0) break;
					      status[3] = input;
					      printing_again[0] = rank;
					      printing_again[1] = 4;
					      printing_again[2] = input;
					      //	//printMany(3,printing_again);
					      num_votes_received++;
					      flags[3] = 1;
					      if(num_votes_received == limit){
						      //		printOne(num_votes_received);
						      num_votes_received = 0;
						      setting = tally_votes(status,flags,rank);
						      //		setFreqDivider(setting,rank);
						      for(unsigned i=0;i<4;i++){
							      flags[i] = 0;
						      }
					      }
					      break;
			case self_channel :> status[4]:
					   break;


		}
	}
}

unsigned tally_votes(unsigned status[],unsigned flags[],unsigned rank){

	unsigned mode;
	unsigned votes[4];
	unsigned prints[5];
	unsigned i,k;
	unsigned max, min, sum, current_count;
	unsigned limit = 2;
	for(unsigned i=0;i<4;i++){
		votes[i] = 0;
	}	

	mode = SET_MODE;

	for(unsigned i=0;i<5;i++){
		if(flags[i] > 0)
			votes[status[i]] += 1;
	}

	for(unsigned i=0;i<4;i++){
		prints[i+1] = votes[i];
	}

	prints[0]= rank;

	// //printMany(5,prints);

	switch(mode){

		case 1:
			max = 0;
			while(max <3){
				if(votes[max] !=0) break;
				else max++;
			}
			return max;
		case 2:
			min = 3;
			while(min >0){
				if(votes[min] !=0) break;
				else min--;
			}
			return min;
		case 3:
			sum = 0;
			for(unsigned i=0;i<4;i++){
				sum += i*votes[i];
			}
			return (unsigned) (sum/limit+1);
		case 4:

			i = 0;
			k = 0;
			current_count = 0;
			while(i < (unsigned)((limit+1)/2 + 1)){
				if(votes[k]==current_count){
					k++;
					current_count = 0;
				} else current_count++;
				i++;
			}
			return k; 

		default:
			max = 0;
			current_count = 0;
			for(unsigned i=0;i<4;i++){
				if(votes[i] > max){
					max = votes[i];
					current_count = i;
				}
			}
			return current_count;
	}

}

unsigned exor(unsigned vis1,unsigned vis2,unsigned num_touched)
{
	if(num_touched == 0) return 1;
	else if ((vis1 == 1 && vis2 ==0) || (vis1 == 0 && vis2 == 1)) return 1;
	else return 0;

}


void xc_listen_check_wall(unsigned parentCommunicationChannel, unsigned rank,chanend north_connection,chanend east_connection,chanend south_connection,chanend west_connection,chanend com_channel,chanend consensus_channel){

	unsigned in_var;
	unsigned row;
	unsigned column;
	unsigned index;
	timer t;
	unsigned sum, sum2;
	unsigned time_begin, time_end, time_begin_cycle, time_end_cycle;
	unsigned last_visited = 0;

	unsigned flag,flag2;
	unsigned visited[(MAZELENGTH/DIV_DEGREE_PRIM_Y)][(MAZEWIDTH/DIV_DEGREE_PRIM_X)];
	unsigned num_walls = (MAZEWIDTH/DIV_DEGREE_PRIM_X+1) * (MAZELENGTH/DIV_DEGREE_PRIM_Y) + (MAZELENGTH/DIV_DEGREE_PRIM_Y + 1) * (MAZELENGTH/DIV_DEGREE_PRIM_X);
	unsigned walls[(MAZEWIDTH/DIV_DEGREE_PRIM_X+1) * (MAZELENGTH/DIV_DEGREE_PRIM_Y) + (MAZELENGTH/DIV_DEGREE_PRIM_Y + 1) * (MAZELENGTH/DIV_DEGREE_PRIM_X)+1];

	unsigned type;
	unsigned num_visited = 0;
	unsigned printer[6];
	unsigned counter = 0;
	unsigned counter2 = 0;
	unsigned prim_status = 1;
	unsigned last_prim_status = 1;
	unsigned yay;
	unsigned count1,count2,count3,count_n,count_w,count_s,count_e;
	sum = 0;
	sum2 = 0;

	/*printer[0] = rank;
	  printer[1] = (unsigned) north_connection;
	  printer[2] = (unsigned) east_connection;
	  printer[3] = (unsigned) south_connection;
	  printer[4] = (unsigned) west_connection;

	  //printMany(5,printer); */
	  
	flag = 0;
	flag2 = 0;


	count1 = 0;
	count2 = 0;
	count3 = 0;
	count_w = 0;
	count_e = 0;
	count_n = 0;
	count_s = 0;
	

	for(unsigned i=0;i<MAZELENGTH/DIV_DEGREE_PRIM_Y;i++){
		for(unsigned j=0;j<MAZEWIDTH/DIV_DEGREE_PRIM_X;j++){
			visited[i][j] = 0;
		}
	}

	for(unsigned i=0;i<num_walls+1;i++){
		walls[i] = 1;
	}


	channelReceiveWord(parentCommunicationChannel);
	//printOne(prim_status);
	printer[0] = rank;
	printer[1] = time_begin;
	//	//printMany(2,printer);

	/*	t:> time_begin;

		printer[0] = rank;
consensus_channel :> sum;

t :> time_end;
printer[1] = time_end - time_begin;

time_end += 600000000;

	////printMany(2,printer);

	sum = 0; */

	//	consensus_channel <: 1;
	channelSendWord(parentCommunicationChannel,42);

//	if(rank==2 || rank == 0) client_createThread(3,100,0,16+rank);
//	if(rank==3 || rank == 1) client_createThread(3,100,0,16+rank);

//	if(rank==0) client_createThread(1,100,0,16);
t :> time_begin;
	while(1){

t:> time_begin_cycle;


if(num_visited != last_visited)
	{
		printer[0] = rank*0x10000000+num_visited;
		//printMany(1,printer);
}
last_visited = num_visited;


  printer[0] = rank;
  printer[1] = num_visited;
  //	//printMany(2,printer);
  if(num_visited < 50) prim_status = 1;
  else if (num_visited >=50 && num_visited < 75){
	  prim_status = 1;
	  //		printOne(prim_status);
  }
  else if (num_visited >=75 && num_visited < 90){
	  prim_status = 1;
	  //	printOne(prim_status);
  }
  else 	{
	  prim_status = 1; 
	  //	printOne(prim_status);
  }
  //printOne(prim_status);


  //if(prim_status != last_prim_status) consensus_channel <: prim_status;
  last_prim_status = prim_status;

  printer[0] = rank;
  //	//printMany(1,printer);

/*  if(num_visited > 0 && flag2 == 0) {
t :> time_begin; 
   flag2 = 1;
  }
*/

  if(flag == 1){
t :> time_begin;
   if(time_begin > time_end){ 
	   //printMany(num_walls+1,walls);
	   flag = 2;
   }
  }
  select{
	  case com_channel :> in_var :
	
t:> time_end_cycle;	
			    type = 2;
				
			    //local operation
			    if(in_var == 1){count1++; 
				printer[0] = rank + 0x20000000;
	printer[1] = 0;
	//printMany(2,printer);

com_channel :> index;
	     if(index >=((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X)){
		     in_var = index - ((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		     column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		     printer[1] = 8;
		     printer[2] = row;
		     printer[3] = column;
		     printer[4] = index;
		     //	//printMany(5, printer);	
		     if(exor(visited[row][column],visited[row][column-1],num_visited)){
			     visited[row][column] = 1;
			     visited[row][column-1] = 1;
			     if(num_visited==0)
				     num_visited += 2;
			     else
				     num_visited ++;
			     walls[index] = 0; 
		     }
	     }  			
	     else{
		     in_var = index;
		     row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     printer[1] = 14;
		     printer[2] = row;
		     printer[3] = column;
		     printer[4] = index;
		     ////printMany(5, printer);
		     if(exor(visited[row][column], visited[row-1][column], num_visited)){
			     visited[row][column] = 1;
			     visited[row-1][column] = 1;
			     if(num_visited==0)
				     num_visited += 2;
			     else
				     num_visited ++;
			     walls[index] = 0; 
		     }	
	     }

	     break;		
			    }
			    //neighbor query
			    else if(in_var == 2){count2++;
				printer[0] = rank + 0x20000000;
	printer[1] = 0;
	//printMany(2,printer);

				    printer[1] = 9;
com_channel :> index;
	     if(index >=((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X)){
		     in_var = index - ((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		     column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		     printer[1] = 12;
		     printer[2] = row;
		     printer[3] = column;
		     printer[4] = index;
		     ////printMany(5, printer);	
		     if(column == 0)
			     com_channel <: visited[row][0];
		     else{
			     //		t :> time_begin_cycle;
			     com_channel <: visited[row][MAZEWIDTH/DIV_DEGREE_PRIM_X-1];
			     //		t :> time_end_cycle;
			     //		printOne(time_end_cycle - time_begin_cycle);
		     }
	     }  			
	     else{
		     in_var = index;
		     row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     printer[2] = row;
		     printer[3] = column;
		     printer[4] = index;
		     ////printMany(5, printer);	
		     if(row == 0)
			     com_channel <: visited[0][column];
		     else
			     com_channel <: visited[MAZELENGTH/DIV_DEGREE_PRIM_Y-1][column];
	     }

	     break;
			    }
			    //update after checking neighbor
			    else{count3++;
					printer[0] = rank + 0x20000000;
	printer[1] = 0;
	//printMany(2,printer);

				    printer[1] = 10;
com_channel :> index;
	     if(index >=((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X)){
		     in_var = index - ((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		     column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		     printer[2] = row;
		     printer[3] = column;
		     printer[4] = index;
		     ////printMany(5, printer);	
		     if(column == 0){
			     if(visited[row][0] == 0) num_visited ++;
			     visited[row][0] = 1;
			     walls[index] = 0;
		     }
		     else{
			     if(visited[row][MAZEWIDTH/DIV_DEGREE_PRIM_X-1] == 0) num_visited++;
			     visited[row][MAZEWIDTH/DIV_DEGREE_PRIM_X-1] = 1;
			     walls[index] = 0;	
		     }
	     }  			
	     else{
		     in_var = index;
		     row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     printer[0] = rank;
		     printer[2] = row;
		     printer[3] = column;
		     printer[4] = index;
		     //if(index == 0) //printMany(5, printer);	
		     if(row == 0){
			     if(visited[0][column] == 0) num_visited ++;
			     visited[0][column] = 1;
			     walls[index] = 0;
		     }
		     else{
			     if(visited[MAZELENGTH/DIV_DEGREE_PRIM_Y-1][column] == 0) num_visited++;
			     visited[MAZELENGTH/DIV_DEGREE_PRIM_Y-1][column] = 1;
			     walls[index] = 0;
		     }
	     }


			    }

			    break;

	  case east_connection :> in_var : count_e++;
printer[0] = rank + 0x20000000;
	printer[1] = 2;
	//printMany(2,printer);

t:> time_end_cycle;	
				type = 1;
				index = in_var;
east_connection :> yay;
		 in_var = in_var - ((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		 row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		 column = MAZEWIDTH/DIV_DEGREE_PRIM_X - 1;
		 printer[1] = 6;
		 ////printMany(2,printer);
		 if(visited[row][column] == yay){
			 east_connection <: 0;
		 }
		 else{
			 visited[row][column] = 1;
			 if(num_visited == 0) {
				 com_channel <: 42;
			 }
			 if(yay == 1) num_visited ++;
			 walls[index] = 0;
			 east_connection <: 1;
		 }
		 printer[1] = 7;
		 ////printMany(2,printer);
		 break;
	  case north_connection :> in_var : count_n++;
	printer[0] = rank + 0x20000000;
	printer[1] = 1;
	//printMany(2,printer);

t:> time_end_cycle;	
				 type = 1;
				 index = in_var;
north_connection :> yay;
		  row = 0;
		  column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X);
		  printer[1] = 4;
		  ////printMany(2,printer);
		  if(visited[row][column] == yay){
			  north_connection <: 0;
		  }
		  else{
			  visited[row][column] = 1;
			  if(num_visited == 0) {
				  com_channel <: 42;
			  }
			  if(yay == 1) num_visited ++;
			  walls[index] = 0;
			  north_connection <: 1;
		  }
		  printer[1] = 5;
		  ////printMany(2,printer);
		  break;

	  case west_connection :> in_var : count_w++;
	printer[0] = rank + 0x20000000;
	printer[1] = 4;
	//printMany(2,printer);

t:> time_end_cycle;	
				type = 1;
				index = in_var;
west_connection :> yay; 
		 in_var = in_var - ((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		 row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		 column = 0;
		 printer[1] = 2;
		 ////printMany(2,printer);
		 if(visited[row][column] == yay){
			 west_connection <: 0;
		 }
		 else{
			 visited[row][column] = 1;
			 if(num_visited == 0) {
				 com_channel <: 42;
			 }
			 if(yay == 1) num_visited ++;
			 walls[index] = 0;
			 west_connection <: 1;
		 }
		 printer[1] = 3;
		 ////printMany(2,printer);
		 break;

	  case south_connection :> in_var : count_s++;
	printer[0] = rank + 0x20000000;
	printer[1] = 3;
	//printMany(2,printer);

t:> time_end_cycle;	
				 type = 1;
				 index = in_var;
south_connection :> yay; 
		  row = MAZELENGTH/DIV_DEGREE_PRIM_Y - 1;
		  column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X);
		  printer[1] = 0;
		  ////printMany(2,printer);
		  if(visited[row][column] == yay){
			  south_connection <: 0;
		  }
		  else{
			  visited[row][column] = 1;
			  if(num_visited == 0) {
				  com_channel <: 42;
			  }
			  if(yay == 1) num_visited ++;
			  walls[index] = 0;
			  south_connection <: 1;
		  }
		  printer[1] = 1;
		  ////printMany(2,printer);			
		  break;

  }


  if(type == 1){
	  counter = counter+1;
	  sum += time_end_cycle-time_begin_cycle;
  } else {
	  counter2= counter2 + 1;
	  sum2 += time_end_cycle-time_begin_cycle;
  }

  if(flag == 0 && num_visited >= NUM_VISITED_LIMIT){
	  flag = 1;
	  if(rank == 0) walls[0] = 0;
	  if(rank == 3) walls[num_walls - 1] = 0;
	  walls[num_walls] = rank;
t :> time_end;
  // printer[0] = rank;
   printer[1] = time_end-time_begin;
   printer[2] = 0xbadbead;
   printer[3] = sum*counter;
   printer[4] = 0xbadbeef;
   printer[5] = sum2*counter2;
  //printer[0] = 1000*double(printer[5])/double(printer[3]);
  printer[0] = printer[1];
  if(rank==0) printMany(1,printer);	
   time_end += 100000000;
   channelSendWord(parentCommunicationChannel,4);
  }


	}

}

void xc_prim_child_root(unsigned rank, chanend com_channel){

	// matrix to store walls
	// array to store visited cells
	// variable to keep track of the number of visited cells

	unsigned walls_touched[(MAZEWIDTH/DIV_DEGREE_PRIM_X+1) * (MAZELENGTH/DIV_DEGREE_PRIM_Y) + (MAZELENGTH/DIV_DEGREE_PRIM_Y + 1) * (MAZELENGTH/DIV_DEGREE_PRIM_X)];
	unsigned mazesize = (MAZEWIDTH/DIV_DEGREE_PRIM_X) * (MAZELENGTH/DIV_DEGREE_PRIM_Y);
	unsigned num_walls = (MAZEWIDTH/DIV_DEGREE_PRIM_X+1) * (MAZELENGTH/DIV_DEGREE_PRIM_Y) + (MAZELENGTH/DIV_DEGREE_PRIM_Y + 1) * (MAZELENGTH/DIV_DEGREE_PRIM_X);
	unsigned index;
	unsigned foo,row,column,in_var,response;
	unsigned print_ids[6];
	unsigned num_touched =0;
	unsigned num_touched_limit = 10000;
	unsigned time_begin, time_end;
	timer t;
	unsigned flag_done = 0;

	channel siblingCommunicationChannel_north;
	channel siblingCommunicationChannel_east;
	channel siblingCommunicationChannel_south;
	channel siblingCommunicationChannel_west;
	unsigned numero;
	// print_ids[5] = get_local_tile_id();

	//	//printMany(6,print_ids);

	if(rank >= DIV_DEGREE_PRIM_X) siblingCommunicationChannel_north = client_allocateNewLocalChannel(0);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) siblingCommunicationChannel_east = client_allocateNewLocalChannel(1);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) siblingCommunicationChannel_south = client_allocateNewLocalChannel(2);
	if(rank % DIV_DEGREE_PRIM_X != 0) siblingCommunicationChannel_west = client_allocateNewLocalChannel(3);

	print_ids[0] = rank;
	print_ids[1] = siblingCommunicationChannel_north;
	print_ids[2] = siblingCommunicationChannel_east;
	print_ids[3] = siblingCommunicationChannel_south;
	print_ids[4] = siblingCommunicationChannel_west;

	////printMany(5,print_ids);


	if(rank >= DIV_DEGREE_PRIM_X) channelListen(siblingCommunicationChannel_north);
	if(rank % DIV_DEGREE_PRIM_X != 0) channelListen(siblingCommunicationChannel_west);
	if(rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1) channelListen(siblingCommunicationChannel_east);
	if(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) channelListen(siblingCommunicationChannel_south);

	numero = 0;

	srand(1);

	for(int i=0; i<num_walls;i++){
		walls_touched[i] = 0;
	}

t :> time_begin;
   //printOne(time_begin);

   if(rank !=0) com_channel :> time_begin;

   while (1){
t:> time_begin;
  //	print_ids[1] = num_touched;

  //	//printMany(2,print_ids);	
  //index = rand() % num_walls;
 
 if(numero==num_walls) numero = 0;
 index = numero; 
 numero++;
  while(1){

	  if(index >=((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X)){
		  in_var = index - ((MAZELENGTH/DIV_DEGREE_PRIM_Y)+1)*(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		  row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		  column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X + 1);
		  print_ids[0] = rank;
		  print_ids[1] = 13;
		  print_ids[2] = row;
		  print_ids[3] = column;
		  ////printMany(4,print_ids);
		  if(column !=0 && column != MAZEWIDTH/DIV_DEGREE_PRIM_X){
				print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			  com_channel <: 1;
			  com_channel <: index;
			  num_touched++;
			  break;
		  }
		  else{
							print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			  com_channel <: 2;
			  com_channel <: index;
com_channel :> foo;
	     if(column > 0 && (rank % DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_X - 1)){
		print_ids[0] = rank + 0x30000000;
	print_ids[1] = 2;
	//printMany(2,print_ids);

		     channelSendWord(siblingCommunicationChannel_east,index-MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     channelSendWord(siblingCommunicationChannel_east,foo);
		     response = channelReceiveWord(siblingCommunicationChannel_east);
		     if(response){
					print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			     com_channel <: 3;
			     com_channel <: index;
			     num_touched++;
			     break;
		     }else
			     break;			
	     }else if(column==0 && (rank % DIV_DEGREE_PRIM_X != 0)){
				print_ids[0] = rank + 0x30000000;
	print_ids[1] = 4;
	//printMany(2,print_ids);

		     channelSendWord(siblingCommunicationChannel_west,index + MAZEWIDTH/DIV_DEGREE_PRIM_X);
		     channelSendWord(siblingCommunicationChannel_west,foo);
		     response = channelReceiveWord(siblingCommunicationChannel_west);
		     if(response){
							print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			     com_channel <: 3;
			     com_channel <: index;
			     num_touched++;
			     break;
		     }
		     else
			     break;	}
	     else break;
		  }  			
	  }else{
		  in_var = index;
		  row = in_var/(MAZEWIDTH/DIV_DEGREE_PRIM_X);
		  column = in_var % (MAZEWIDTH/DIV_DEGREE_PRIM_X);
		  if(row !=0 && row != MAZELENGTH/DIV_DEGREE_PRIM_Y){
			  print_ids[0] = rank;
			  print_ids[1] = 4;
			  print_ids[2] = row;
			  print_ids[3] = column;
			  ////printMany(4,print_ids);
					print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			  com_channel <: 1;
			  com_channel <: index;
			  num_touched++;
			  break;	
		  }
		  else{
					print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			  com_channel <: 2;
			  com_channel <: index ;
com_channel :> foo;
	     if(row > 0 &&(rank/DIV_DEGREE_PRIM_X != DIV_DEGREE_PRIM_Y - 1) ){
			print_ids[0] = rank + 0x30000000;
	print_ids[1] = 3;
	//printMany(2,print_ids);

		     channelSendWord(siblingCommunicationChannel_south,index-(MAZEWIDTH/DIV_DEGREE_PRIM_X)*(MAZELENGTH/DIV_DEGREE_PRIM_Y));
		     channelSendWord(siblingCommunicationChannel_south,foo);
		     response = channelReceiveWord(siblingCommunicationChannel_south);
		     if(response){
					print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			     com_channel <: 3;
			     com_channel <: index;
			     num_touched++;
			     break;
		     }
		     else
			     break;			
	     }else if(row==0 && (rank >= DIV_DEGREE_PRIM_X)){ 
					print_ids[0] = rank + 0x30000000;
	print_ids[1] = 1;
	//printMany(2,print_ids);

		     channelSendWord(siblingCommunicationChannel_north,index +(MAZEWIDTH/DIV_DEGREE_PRIM_X)*(MAZELENGTH/DIV_DEGREE_PRIM_Y));
		     channelSendWord(siblingCommunicationChannel_north,foo);
		     response = channelReceiveWord(siblingCommunicationChannel_north);
		     if(response){
						print_ids[0] = rank + 0x30000000;
	print_ids[1] = 0;
	//printMany(2,print_ids);

			     com_channel <: 3;
			     com_channel <: index;
			     num_touched++;
			     break;
		     }
		     else
			     break; 	
	     } else break;

		  }	
	  }

  }

t :> time_end;
   print_ids[0] = time_end-time_begin;
   print_ids[1] = rank;
   //	//printMany(2,print_ids);


   }
}

