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

void blur_main(chanend c_in, unsigned shouldIRun, chanend control_channel){
	unsigned sampleCount ;
	unsigned V_T, V_MT, V_MB, V_B, V_IO, V_DRAM ;
	unsigned I_T, I_MT, I_MB, I_B, I_IO, I_DRAM ;
	unsigned P_T, P_MT, P_MB, P_B, P_DRAM, P_IO ;
	unsigned time1,time2;
	timer t;
	unsigned foo;
	channel parentch;
	unsigned printer[10];	
	unsigned image[IMG_LENGTH_BLUR][IMG_WIDTH_BLUR];
	unsigned XF = 0;
	unsigned YF = 0;
	unsigned x = 0;
	unsigned i = 0;
	unsigned j = 0;
	channel doneSignal;
	unsigned coreList[24];

	//Chan in-outs here

	parentch = client_allocateNewLocalChannel(0) ;
	doneSignal = client_allocateNewLocalChannel(1) ;
	
	//client_createThread(0, 100, 0, coreList[0]);

	channelListen(parentch);
	t :> time1;
	//control_channel <: (char) POWERMEASURE_START;
	
		for(i = 0; i < IMG_WIDTH_BLUR; i++){
			for(j = 0; j < IMG_LENGTH_BLUR; j++){
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
	
	channelListen(doneSignal);
	foo = channelReceiveWord(doneSignal);
	
	t :> time2;
	printer[0] = time2-time1;
	//if(foo==42) printMany(1,printer);
	
	
		//control_channel <: (char) POWERMEASURE_STOP;
		//control_channel <: (char) POWERMEASURE_READVALUES;
	
/*if(foo==42){

		control_channel :> sampleCount;
		control_channel :> V_T ;
		control_channel :> I_T ;
		control_channel :> V_MT ;
		control_channel :> I_MT ;
		control_channel :> V_MB ;
		control_channel :> I_MB ;
		control_channel :> V_B ;
		control_channel :> I_B ;
		control_channel :> V_IO ;
		control_channel :> I_IO ;
		control_channel :> V_DRAM ;
		control_channel :> I_DRAM ;

		printer[0] = sampleCount;
		printer[1] = (V_T / sampleCount) * (I_T / sampleCount) / 1000;
		printer[2] = (V_MT / sampleCount) * (I_MT / sampleCount) / 1000;
		printer[3] = (V_MB / sampleCount) * (I_MB / sampleCount) / 1000;
		printer[4] = (V_B / sampleCount) * (I_B / sampleCount) / 1000;

		printMany(8, printer);
		
	} */ //uncomment for power
}

void blur_child(unsigned parent_id, unsigned rank){
	unsigned printer[IMG_LENGTH_BLUR];
	double tempor;
	double Commtime;
		double Comptime;
		unsigned time1,time2,time_start,time_end;
		
		timer t;
		
	if(rank < STAGES_OF_PIPELINE -1){
		unsigned count = 0;
		channel childch;
		unsigned filter[XDIV][YDIV];
		
		unsigned nextCore;
		
		unsigned doneSignal=parent_id;	
		channel parentCommunicationChannel;
			unsigned element[XDIV][YDIV];
			unsigned i = 0;
			unsigned j = 0;
			unsigned R = 0;
			unsigned G = 0;
			unsigned B = 0;
			unsigned processedPixel = 0;
			
Commtime = 0;
Comptime = 0;

		parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);
		parentCommunicationChannel = client_connectNewLocalChannel(1, parentCommunicationChannel);

		//Put Switch Statement Under Here

		childch = client_allocateNewLocalChannel(rank+1);
        	client_createThread(0, 100, rank + 1, nextCore);

        	channelListen(childch);
		if(rank!=0) doneSignal = channelReceiveWord(parentCommunicationChannel);
		channelSendWord(childch,doneSignal);

		t :> time_start;

		while(count < XFACTOR * YFACTOR){
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
		
			Commtime += time2 - time1;

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
*/					for(unsigned x=0;x<100;x++){
						element[i][j] += 1;
					}
				}
			}
			t :> time2;
			
			Comptime += time2-time1;
			
			t:> time1;
			for(i = 0; i < YDIV; i++){
				for(j = 0; j <XDIV; j++){
					channelSendWord(childch,element[i][j]);
				}	
			}
			t :> time2;

			
			Commtime += time2 - time1;
			
			count++;
		}

		client_releaseLocalChannel(rank+1);

		t :> time_end;
	}

	else{
		
		unsigned result[IMG_LENGTH_BLUR][IMG_WIDTH_BLUR];
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
Commtime = 0;
Comptime = 0;
		t :> time_start;

		t :> time1;
	        for(x = 0; x < (XFACTOR * YFACTOR); x++){
        	        for(i = 0; i < YDIV; i++){
                	        for(j = 0; j < XDIV; j++){
                        	        result[i+YDIV*XF][j+XDIV*YF] =  channelReceiveWord(parentCommunicationChannel);
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

        t :> time2;

        Commtime += time2-time1;

        t:> time1;

		for(i = 0; i < IMG_WIDTH_BLUR; i++){
			for(j = 0; j < IMG_LENGTH_BLUR; j++){
				printer[j] = result[i][j];
			}
			//printMany(IMG_LENGTH_BLUR,printer);
		}

		t :> time2;

		Comptime += time2-time1;

		t :> time1;
		rootCommunicationChannel = client_lookupParentChanend(doneSignal,1);
		printer[0] = rootCommunicationChannel;
		//printMany(1,printer);
		rootCommunicationChannel = client_connectNewLocalChannel(2,rootCommunicationChannel);

channelSendWord(rootCommunicationChannel,42);
	t :> time2;

	Commtime += time2-time1;
	

	client_releaseLocalChannel(2);

	t :> time_end;
	}
	

	//printer[0] = 1000*((double)Comptime/(double)(Comptime + Commtime));
	//printer[0] = Comptime + Commtime;

	//Insert Printing Here

}
