#include <math.h>
#include <platform.h>
#include <xs1.h>
#include <print.h>
#include <stdlib.h>

#include "Swallow-helpers.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS_client.h"
#include "Swallow-nOS_initialFunctions.h"
#include "matrixmul.h"
#include "Swallow-prim-checks.h"
#include "Power_Measure_Lib.h"
#define LOCALnOSCHANEND 0x1f02

void matrix_main(unsigned parent_id, unsigned rank){
	float matrixA[A_ROWS][A_COLS];
	float matrixB[B_ROWS][B_COLS];
	float matrixR[A_ROWS][B_COLS];
	unsigned printer[10];
	unsigned x = 0;
	double tempor;
	timer t;
	unsigned time,time2;

	unsigned foo;
	unsigned j = 0;
	unsigned k = 0;
	channel myChannels[MAT_CHILDREN];

printer[0] = 0xbadbeef;
			printMany(1,printer);


	//if(shouldIRun != 1) return;
	if(A_COLS != B_ROWS) return;
	

	//c_in :> foo;	
	for(unsigned i = 0; i < A_ROWS; i++){
		for(unsigned j = 0; j < A_COLS; j++){
			matrixA[i][j] = ((rand()*1000)/8);
		}
	}
	for(unsigned i = 0; i < B_ROWS; i++){
		for(unsigned j = 0; j < B_COLS; j++){
			matrixB[i][j] = ((rand()*1000)/8);
		}
	}

	j = 0;
			
while(j<MAT_CHILDREN){

myChannels[j] = client_allocateNewLocalChannel(j);
//			printer[0] = j;
//			printer[1] = 4+j;
//			printMany(2,printer);
			client_createThread(2, 100, j, OFFSET+j);
			channelListen(myChannels[j]);

			j++;

}

	j = 0;
	k = 0;
	
	//control_channel <: (char) POWERMEASURE_START;
	for(unsigned x = 0; x < MAT_CHILDREN;x++){
	t :> time;
		if(j == A_ROWS)
			j = 0;
		for(unsigned i = 0; i < A_COLS; i++){
			channelSendWord(myChannels[x], matrixA[j][i]);
		}

		if(k == B_COLS){
			k = 0;
			j++;
		}

		for(unsigned i = 0; i < B_ROWS; i++){
			channelSendWord(myChannels[x],matrixB[i][k]);
		}

		k++;
	}
	
	x = 0;
	for(unsigned i = 0; i < A_ROWS; i++){
		for(unsigned j = 0; j < B_COLS; j++){
			if(x != MAT_CHILDREN){
				matrixR[i][j] = channelReceiveWord(myChannels[x]);
				x++;
			}
		}
	}
	//control_channel <: (char) POWERMEASURE_STOP;
	//control_channel <: (char) POWERMEASURE_READVALUES;
	
	t :> time2;
	printer[0] = (time2-time+ 0x10000000);
//	printMany(1, printer);

	k =0;/*
	for(unsigned i = 0; i < A_ROWS; i++){
		for(unsigned j = 0; j <B_COLS; j++){
			if(k == 10){
				k = 0;
			}
			printer[k] = matrixR[i][j];
				k++;
		}
//		printMany(B_COLS,printer);
		k = 0;
	}*/
	//control_channel :> printer[0];

	for(unsigned k =1; k < 8; k++){
		//control_channel :> tempor;

		printer[k] = (tempor*1000/(double) printer[0]) ;
	}
//	printMany(8, printer);
}

void matrix_child(unsigned parent_id, unsigned rank){
	channel parentCommunicationChannel;
	unsigned ROWS =PER_CHILD;
	unsigned COLS = PER_CHILD;
	unsigned row[PER_CHILD];
	unsigned col[PER_CHILD];
	float result = 0;
	unsigned printer[5];
	unsigned int k = 0;
	timer t;
	unsigned time_start,time_end;
	unsigned time1, time2;
	parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);
	parentCommunicationChannel = client_connectNewLocalChannel(1, parentCommunicationChannel);
	



	for(int i = 0; i < ROWS; i++){
		row[i] = channelReceiveWord(parentCommunicationChannel);
	}

	for(int i = 0; i < COLS; i++){
		col[i] = channelReceiveWord(parentCommunicationChannel);
	}
	t :> time1;	
//	for(unsigned int j = 0; j<10000;j++)
//	{	
	for(int i = 0; i <ROWS; i++){
		result += row[i]*col[i];
	}
	t :> time2;
//	} 
	t:> time_start;
	channelSendWord(parentCommunicationChannel,result);
	t :> time_end;
//	printer[0]=rank;
//	printer[1]=time_end-time_start;
//	printer[2]=time2-time1;
	//printMany(3,printer);
	client_releaseLocalChannel(1);
}
