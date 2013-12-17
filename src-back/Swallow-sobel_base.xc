#include <math.h>
#include <platform.h>
#include <stdlib.h>
//#include <xscope.h>
#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_initialFunctions.h"
#include "Swallow-nOS_client.h"
#include "Swallow-sobel-select.h"
#include "Swallow-prim-checks.h"
#include "Swallow-sobel.h"
#include <print.h>
#include "leds.h"
//#include "Swallow-sobel-streaming.h"

#define LOCALnOSCHANEND 0x1f02 // hard-coded for core[0] only. TODO: generalise
//#define IMG_WIDTH 4
//#define IMG_LENGTH 4
//#define DIV_DEGREE_X 1 // the degree to which the image is divided along each dimension (can only result in a square number of small images)
//#define DIV_DEGREE_Y 1
//#define NUM_CHILDREN 1 //num_children must equal DIV_DEGREE^2
#define THRESHOLD 30 // threshold for gradient to be labeled as an edge
//#define ETHERNETCHANINDEX 29
//#define STARTDELAY 625000000 //625 million reference clock cycles of start delay (5 secs)

//out port even_leds = XS1_PORT_4F;


static inline void printOne(unsigned value) 
{
	unsigned data[1];
	data[0] = value;

	//printMany(1,data);

}
void sobel_main(chanend c_in,unsigned shouldIRun,chanend control_channel)
{
	timer t;
	unsigned time1,time2;

	unsigned myID;
  //  unsigned IMG[IMG_WIDTH][IMG_LENGTH];
   //  unsigned processed_image[IMG_WIDTH+2][IMG_LENGTH+2];
	unsigned processed_pixel;
    //unsigned receive_buffer[IMG_WIDTH/DIV_DEGREE_X + 4];
    unsigned ind1x,ind2x,ind1y,ind2y;
    unsigned childStart, childStack;
    unsigned num_collected;
    const unsigned subimg_width = IMG_WIDTH/DIV_DEGREE_X + 4;
    const unsigned subimg_length = IMG_LENGTH/DIV_DEGREE_Y + 4;
    //channel input_channel;

	unsigned foo;
    channel myChannels[NUM_CHILDREN];
	unsigned printer[2];

//start delay


	c_in :> foo;

    myID = get_logical_core_id();

    //get_startAddress(sobel_child, childStart) ;
    get_stackSize(sobel_child, childStack) ;

/*
    for(int i=0;i<IMG_WIDTH;i++)
    {
  	  for(int j=0;j<IMG_LENGTH;j++)
  	  {
  		  if(j!=2)
  		  	  IMG[i][j] = 0;
  		  else
  			IMG[i][j] = 255;
  	  }
    }
*/
    //input_channel = getSpecificLocalChannel(ETHERNETCHANINDEX);

    //start children threads
    for(unsigned i = 0; i <NUM_CHILDREN; i++){
    	myChannels[i] = client_allocateNewLocalChannel(i); // push into operating system
    	//start children threads
    	client_createThread(0, childStack,i,4+i) ;
//	printintln(i);
    	channelListen(myChannels[i]) ;
	//printstrln("");
	//printstrln("Now creating Child #: ");
	//printintln(i);
    }

    t :> time1;
   // xscope_register(0);
   // xscope_config_io(XSCOPE_IO_BASIC);
 /*   for(int i = 0; i <NUM_CHILDREN; i++){
       	//split and send the image parts to the cores
    	ind1x = (i % DIV_DEGREE_X) * IMG_WIDTH/DIV_DEGREE_X;
    	ind2x = ind1x + (IMG_WIDTH/DIV_DEGREE_X) - 1;
    	ind1y = (i / DIV_DEGREE_X) * IMG_LENGTH/DIV_DEGREE_Y;
    	ind2y = ind1y + (IMG_LENGTH/DIV_DEGREE_Y) - 1;

    	if((i % DIV_DEGREE_X) == 0){
    		for(int q=0;q<2*subimg_length;q++){
    			channelSendWord(myChannels[i],0);
    		}
    	}
    	else{
    		ind1x = ind1x-2;
    	}
    	if((i % DIV_DEGREE_X) != DIV_DEGREE_X - 1){
    	    		ind2x = ind2x + 2;
    	    	}

    	if((i / DIV_DEGREE_X) != 0){
    	    			ind1y = ind1y-2;
    	    		}
    	if((i / DIV_DEGREE_X) != DIV_DEGREE_Y - 1){
        			ind2y = ind2y + 2;
        		}

    //	for (int j=0; j < subimg_width; j++){
    //		receive_length = c_coreReceiveWords(input_channel,receive_buffer);
    		//if(receive_length != subimg_length){
    			// throw_exception();
    		//}
    //	    		for(int k = 0; k < receive_length; k ++){
    //	    		channelSendWord(myChannels[i],receive_buffer[k]);
    //	    		}
    //	    	}
  //  } 

    	for (int j = ind1x; j <= ind2x; j ++){
    		if((i / DIV_DEGREE_X) == 0){
    			channelSendWord(myChannels[i],0);
    			channelSendWord(myChannels[i],0);
    		}

    		for(int k = ind1y; k <= ind2y; k ++){
    		channelSendWord(myChannels[i],IMG[j][k]);
    		}

    		if((i / DIV_DEGREE_X) == DIV_DEGREE_Y - 1){
    		    channelSendWord(myChannels[i],0);
    		    channelSendWord(myChannels[i],0);
    		    		}
    	}

    	if((i % DIV_DEGREE_X) == DIV_DEGREE_X - 1){
    	    		for(int q=0;q<2*subimg_length;q++){
    	    			channelSendWord(myChannels[i],0);
    	    		}
    	    	}
    	} */


for(int x=0;x<NUM_CHILDREN;x++)
{
	for(int i=0;i<subimg_width;i++)
	{
		for(int j=0;j<subimg_length;j++)
		{
			if(j==2)
				channelSendWord(myChannels[x],255);
			else
				channelSendWord(myChannels[x],0);
				
		}
	}
}
    //receive the results back
    num_collected = 0;

t :> time2;

printer[0] = 0xbabecafe;
printer[1] = time2-time1;
printMany(2,printer);




    /* while(num_collected<NUM_CHILDREN)
    {
    	sobelSelect(myChannels,processed_image);
    	num_collected++;
    } */

    for(int i=0;i<NUM_CHILDREN;i++)
       {
       	ind1x = (i % DIV_DEGREE_X) * IMG_WIDTH/DIV_DEGREE_X;
       	ind2x = ind1x + (IMG_WIDTH/DIV_DEGREE_X) + 1;
       	ind1y = (i / DIV_DEGREE_Y) * IMG_LENGTH/DIV_DEGREE_Y;
       	ind2y = ind1y + (IMG_LENGTH/DIV_DEGREE_Y) + 1;

//		printstr("\n");
  //      	printint(i);
       	for(int j=ind1x;j<=ind2x;j++)
       	{
       		for(int k=ind1y;k<=ind2y;k++)
       		{
//			printstr(", ");
       			processed_pixel = channelReceiveWord(myChannels[i]);
//			printint(processed_pixel);	
//			//processed_image[j][k] = channelReceiveWord(myChannels[i]);
       		}
       	}

       } 

    //release channels

/*
  for(int i=0;i<IMG_WIDTH+2;i++)
  {
	  printstr("\n");
	  for(int j=0;j<IMG_LENGTH+2;j++)
	  {
		  printint(processed_image[i][j]);
	  }
  }

//	printstr("done");
*/

	t :> time2;
//	printstr("\n");
//	printer[0] = time2-time;
//	printMany(1,printer);
}


select getIMGComponents(chanend listenChannel, unsigned processed_image[][IMG_LENGTH+2],unsigned ind1x,unsigned ind2x,unsigned ind1y, unsigned ind2y,int j)
{
	case listenChannel :> processed_image[ind1x][ind1y]:
		j++;
		for(int i = ind1x; i<=ind2x;i++){
			while(j<=ind2y){
				listenChannel :> processed_image[i][j];
				j++;
			}

			j = ind1y;
		}
		break;
}

void xc_sobelSelect(chanend myChannels[],unsigned processed_image[][IMG_LENGTH+2])
{
	unsigned ind1x[NUM_CHILDREN];
	unsigned ind2x[NUM_CHILDREN];
	unsigned ind1y[NUM_CHILDREN];
	unsigned ind2y[NUM_CHILDREN];
	unsigned num_collected;

	num_collected = 0;

	for(int i=0;i<NUM_CHILDREN;i++)
	{
			ind1x[i] = (i % DIV_DEGREE_X) * IMG_WIDTH/DIV_DEGREE_X;
	    	ind2x[i] = ind1x[i] + (IMG_WIDTH/DIV_DEGREE_X) + 1;
	    	ind1y[i] = (i / DIV_DEGREE_X) * IMG_LENGTH/DIV_DEGREE_Y;
	    	ind2y[i] = ind1y[i] + (IMG_LENGTH/DIV_DEGREE_Y) + 1;
	}

	select{
		case(int i=0;i<NUM_CHILDREN;i++)
				getIMGComponents(myChannels[i],processed_image,ind1x[i],ind2x[i],ind1y[i],ind2y[i],ind1y[i]);
	}
}

void sobel_child(unsigned parent_id, unsigned rank){
	channel parentCommunicationChannel;
	unsigned time1,time2;
	timer t;
	unsigned printer[4];
	const unsigned subimg_width = IMG_WIDTH/DIV_DEGREE_X + 4;
	const unsigned subimg_length = IMG_LENGTH/DIV_DEGREE_Y + 4;
	unsigned sobel_matrix_x[3][3];
	unsigned sobel_matrix_y[3][3];
	unsigned gradient_x;
	unsigned gradient_y;
	unsigned gradient;
	unsigned sub_img[IMG_WIDTH/DIV_DEGREE_X+4][IMG_LENGTH/DIV_DEGREE_Y+4]; //input matrix
	unsigned result[IMG_WIDTH/DIV_DEGREE_X+2][IMG_LENGTH/DIV_DEGREE_Y+2]; // result

	//asm("ldc r0, 0x3" : :) ;
	//asm("ecallt r0" : : ) ;

	//even_leds <: rank;

//	LEDDisplay8bit(rank);
//	printstrln("entering sobel child");
	//set the convolution matrices
	sobel_matrix_x[0][0] = 1;
	sobel_matrix_x[0][1] = 2;
	sobel_matrix_x[0][2] = 1;
	sobel_matrix_x[1][0] = 0;
	sobel_matrix_x[1][1] = 0;
	sobel_matrix_x[1][2] = 0;
	sobel_matrix_x[2][0] = -1;
	sobel_matrix_x[2][1] = -2;
	sobel_matrix_x[2][2] = -1;

	sobel_matrix_y[0][0] = 1;
	sobel_matrix_y[0][1] = 0;
	sobel_matrix_y[0][2] = -1;
	sobel_matrix_y[1][0] = 2;
	sobel_matrix_y[1][1] = 0;
	sobel_matrix_y[1][2] = -2;
	sobel_matrix_y[2][0] = 1;
	sobel_matrix_y[2][1] = 0;
	sobel_matrix_y[2][2] = -1;


	parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);
	parentCommunicationChannel = client_connectNewLocalChannel(1, parentCommunicationChannel);

	//wait to receive image block from parent

t :> time1;

	for (int x = 0; x < subimg_width; x++){
		for (int y = 0; y < subimg_length; y++){
			sub_img[x][y] = channelReceiveWord(parentCommunicationChannel);
		}
	}

t :> time2;


t :> time1;
	for (int x = 0; x < subimg_width-2; x++){
		for (int y = 0; y < subimg_length-2; y++){
			result[x][y] = 0; //initialise result matrix
		}
	}

	for (int x = 1; x < subimg_width-1; x++){
			for (int y = 1; y < subimg_length-1; y++){
				gradient_x = sub_img[x-1][y-1] * sobel_matrix_x[0][0] + sub_img[x-1][y] * sobel_matrix_x[0][1] + sub_img[x-1][y+1] * sobel_matrix_x[0][2]
			    + sub_img[x+1][y-1] * sobel_matrix_x[2][0] + sub_img[x+1][y] * sobel_matrix_x[2][1] + sub_img[x+1][y+1] * sobel_matrix_x[2][2];

				gradient_y = sub_img[x-1][y-1] * sobel_matrix_y[0][0] + sub_img[x][y-1] * sobel_matrix_y[1][0] + sub_img[x+1][y-1] * sobel_matrix_y[2][0]
				+ sub_img[x-1][y+1] * sobel_matrix_y[0][2] + sub_img[x][y+1] * sobel_matrix_y[1][2] + sub_img[x+1][y+1] * sobel_matrix_y[2][2];

				gradient = sqrt(gradient_x * gradient_x + gradient_y * gradient_y);

				if(gradient > THRESHOLD) result[x-1][y-1] = 1;
			}
		}

	//send results back

t :> time2;

if(rank==0){
printer[0] = 0xbabebabe;
printer[1] = time2-time1;
printMany(2,printer);
}



	for (int x = 0; x < subimg_width-2; x++){
		for (int y = 0; y < subimg_length-2; y++){
			channelSendWord(parentCommunicationChannel,result[x][y]);
		}

	}

	client_releaseLocalChannel(1);
}
