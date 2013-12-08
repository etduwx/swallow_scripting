#include <math.h>
#include <platform.h>
#include <xs1.h>
#include <print.h>
#include <stdlib.h>
#include "blur_print.h"
#include "Swallow-helpers.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS_client.h"
#include "Swallow-nOS_initialFunctions.h"
#include "blur.h"
#include "Power_Measure_Lib.h"
#define LOCALnOSCHANEND 0x1f02



void piping_main(unsigned parent_id, unsigned rank){
	double tempor;
	unsigned time1,time2;
	timer t;
	unsigned foo;
	channel parentch;
	unsigned printer[10];	
	unsigned image[IMG_LENGTH][IMG_WIDTH];
	unsigned XF = 0;
	unsigned YF = 0;
	unsigned x = 0;
	unsigned i = 0;
	unsigned j = 0;
	channel doneSignal;
	


	parentch = client_allocateNewLocalChannel(0);
	doneSignal = client_allocateNewLocalChannel(1);
	client_createThread(2, 100, 0, 4);

	channelListen(parentch);
	t :> time1;
//	control_channel <: (char) POWERMEASURE_START;
	
		for(i = 0; i < IMG_WIDTH; i++){
			for(j = 0; j < IMG_LENGTH; j++){
				image[i][j] = 1;
			}
		}
	for(x = 0; x < (XFACTOR * YFACTOR); x++){
		for(i = 0; i < YDIV; i++){
			for(j = 0; j < XDIV; j++){
				channelSendWord(parentch, image[i+YDIV*XF][j+XDIV*YF]);
			}
		}
		YF++;
		if(XF == XFACTOR)
			XF = 0;

		if(YF == YFACTOR){
			YF = 0;
			XF++;
		}
	}
	

	printer[0] = doneSignal;
	//printMany(1,printer);
	channelListen(doneSignal);
	foo = channelReceiveWord(doneSignal);
	t :> time2;
	printer[0] = 0xdeadbeef;
	printer[1] = time2-time1;
	printMany(2,printer);
/*	if(foo==42){
	printer[0] = time2-time1;
	printMany(1,printer);
//	control_channel <: (char) POWERMEASURE_STOP;
//	control_channel <: (char) POWERMEASURE_READVALUES;
	
//	control_channel :> printer[0];

	for(unsigned k =1; k < 8; k++){
		control_channel :> tempor;

		printer[k] = (tempor*1000/(double) printer[0]) ;
		}
	printMany(8, printer);
		
} */
}

void piping_child(unsigned parent_id, unsigned rank){
	unsigned printer[IMG_LENGTH];
	double tempor;
	if(rank < STAGES_OF_PIPELINE -1){
		unsigned count = 0;
		channel childch;
		unsigned filter[XDIV][YDIV];
		unsigned time1,time2;
		timer t;
		unsigned doneSignal=parent_id;	
		channel parentCommunicationChannel;
			unsigned element[XDIV][YDIV];
			unsigned i = 0;
			unsigned j = 0;
			unsigned R = 0;
			unsigned G = 0;
			unsigned B = 0;
			unsigned processedPixel = 0;



		parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);
		parentCommunicationChannel = client_connectNewLocalChannel(1, parentCommunicationChannel);
	printer[0]=0xdeadface;

	//printMany(1,printer);

		childch = client_allocateNewLocalChannel(rank+1);
        	client_createThread(2, 100, rank + 1, 5 + rank);

        	channelListen(childch);
		if(rank!=0) doneSignal = channelReceiveWord(parentCommunicationChannel);
		channelSendWord(childch,doneSignal);


		while(count < XFACTOR * YFACTOR){
			printer[0] = 0xbadc0de;
			printer[1] = rank;
			printer[2] = count;
			//printMany(3,printer);
	

			for(i = 0; i < YDIV; i++){
				for(j = 0; j < XDIV; j++){
					if(i == 0 || j == 0 || i == XDIV || j == YDIV){
					filter[i][j] = 0;
					}
					else{
					filter[i][j] = 1;
					}
				}
			}
			t :> time1;
			for(i = 0; i < YDIV; i++){
				for(j = 0; j < XDIV; j++){
					element[i][j] = channelReceiveWord(parentCommunicationChannel);
				}
			}
			t :> time2;

	
			printer[2] = 0xbabeface;
			printer[0] = time2-time1;
			printer[1] = 0;
	//		printMany(3,printer);

			t :> time1;
			for(i = 0; i < YDIV; i++){
				for(j = 0; j < XDIV; j++){
/*					R = element[i][j] >> 16;
					G = (element[i][j] >> 8) & 0xFF;
					B = element[i][j] & 0xFF;
					R = R / 2;
					G = G / 2;
					B = B / 2;
					element[i][j]  = (R << 16) | (B << 8) | (G);
					element[i][j] = element[i][j] * filter[i][j];
*/				for(unsigned x=0;x<100;x++){
					element[i][j] += 1;
}
				}
			}
			t :> time2;

			printer[0] = time2-time1;
			printer[1] = 1;
	//		printMany(2,printer);			

			t:> time1;
			for(i = 0; i < YDIV; i++){
				for(j = 0; j <XDIV; j++){
					channelSendWord(childch,element[i][j]);
				}	
			}
			t :> time2;

			printer[0] = time2-time1;
			printer[1] = 2;
	//		printMany(2,printer);
			count++;
		}

		client_releaseLocalChannel(rank+1);
	}

	else{
		
		unsigned result[IMG_LENGTH][IMG_WIDTH];
		channel dest = 0;		
		channel parentCommunicationChannel,rootCommunicationChannel;
		unsigned doneSignal;
		unsigned i = 0;
		unsigned j = 0;
		unsigned x = 0;
		unsigned XF = 0;
	        unsigned YF = 0;
		parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);
        	parentCommunicationChannel = client_connectNewLocalChannel(1, parentCommunicationChannel);
		doneSignal = channelReceiveWord(parentCommunicationChannel);

//		printer[0] =  0xdeadbeef;
//		printMany(1,printer);
	        for(x = 0; x < (XFACTOR * YFACTOR); x++){
        	        for(i = 0; i < YDIV; i++){
                	        for(j = 0; j < XDIV; j++){
                        	        result[i+YDIV*XF][j+XDIV*YF] =  channelReceiveWord(parentCommunicationChannel);
//					printer[0] =  0xfeedbeef;
//					printMany(1,printer);
                        	}
                	}
               	 	YF++;
          	        if(XF == XFACTOR)
                	        XF = 0;

	                if(YF == YFACTOR){
        	                YF = 0;
                  	        XF++;
                	}
        	}
		for(i = 0; i < IMG_WIDTH; i++){
			for(j = 0; j < IMG_LENGTH; j++){
				printer[j] = result[i][j];
			}
			//printMany(IMG_LENGTH,printer);
		}
		rootCommunicationChannel = client_lookupParentChanend(doneSignal,1);
		printer[0] = rootCommunicationChannel;
		//printMany(1,printer);
		rootCommunicationChannel = client_connectNewLocalChannel(2,rootCommunicationChannel);

channelSendWord(rootCommunicationChannel,42);
	client_releaseLocalChannel(2);
	}
	

}



void xc_printPower(chanend powerchan)
{
	double tempor;
	unsigned printer[8];

	asm("getd %0, res[%1]" : "=r"(printer[0]) : "r"(powerchan)); 
	printMany(1,printer);
	powerchan <: (char) POWERMEASURE_STOP;
	powerchan <: (char) POWERMEASURE_READVALUES;
	
	powerchan :> printer[0];

	for(unsigned k =1; k < 8; k++){
		powerchan :> tempor;

		printer[k] = (tempor*1000/(double) printer[0]) ;
		}
	printMany(8, printer);
		
	}	

