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

out port even_leds = XS1_PORT_4F;

void startSync(chanend c_out)
{
	unsigned foo;

	foo = 42;
	c_out <: foo;
}

void sobel_main(chanend c_in,unsigned shouldIRun)
{
	unsigned time,time2;
	timer t;
  //  unsigned IMG[IMG_WIDTH][IMG_LENGTH];
   // unsigned processed_image[IMG_WIDTH+2][IMG_LENGTH+2];
	unsigned processed_pixel;
    //unsigned receive_buffer[IMG_WIDTH/DIV_DEGREE_X + 4];
    unsigned ind1x,ind2x,ind1y,ind2y;
    unsigned childStart, childStack;
    unsigned num_collected;
    const unsigned subimg_width = IMG_WIDTH/DIV_DEGREE_X + 4;
    const unsigned subimg_length = IMG_LENGTH/DIV_DEGREE_Y + 4;
    //channel input_channel;

    channel myChannels[NUM_CHILDREN/DIV_DEGREE_Y];

	c_in :> time;

    if (shouldIRun != 1) return ;

//start delay
  //  t :> time;



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
    for(unsigned i = 0; i <NUM_CHILDREN/DIV_DEGREE_Y; i++){
    	myChannels[i] = client_allocateNewLocalChannel(i); // push into operating system
 	//printstrln("Now creating Child #: ");
//	printintln(i);   	//start children threads
    	client_createThread(0, childStack,i,i+1) ;
//	printintln(i);
    	channelListen(myChannels[i]) ;
	//printstrln("");

    }

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


for(int y=0;y<NUM_CHILDREN/DIV_DEGREE_Y;y++){
for(int x=0;x<NUM_CHILDREN/DIV_DEGREE_X;x++)
{
	for(int i=0;i<subimg_width;i++)
	{
		for(int j=0;j<subimg_length;j++)
		{
			if(j==2)
				channelSendWord(myChannels[y],255);
			else
				channelSendWord(myChannels[y],0);
				
		}
	}
}
}
    //receive the results back
    num_collected = 0;

    /* while(num_collected<NUM_CHILDREN)
    {
    	sobelSelect(myChannels,processed_image);
    	num_collected++;
    } */

    for(int y=0;y<NUM_CHILDREN/DIV_DEGREE_Y;y++){
    for(int i=0;i<NUM_CHILDREN/DIV_DEGREE_X;i++)
       {
       	ind1x = (i % DIV_DEGREE_X) * IMG_WIDTH/DIV_DEGREE_X;
       	ind2x = ind1x + (IMG_WIDTH/DIV_DEGREE_X) + 1;
       	ind1y = (i / DIV_DEGREE_Y) * IMG_LENGTH/DIV_DEGREE_Y;
       	ind2y = ind1y + (IMG_LENGTH/DIV_DEGREE_Y) + 1;

	//	printstr("\n");
	//	 printint(DIV_DEGREE_X*i + y);
       	for(int j=ind1x;j<=ind2x;j++)
       	{
       		for(int k=ind1y;k<=ind2y;k++)
       		{
	//		printstr(", ");
       			processed_pixel = channelReceiveWord(myChannels[y]);
	//		printint(processed_pixel);	
			//processed_image[j][k] = channelReceiveWord(myChannels[i]);
       		}
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
*/
	t :> time2;
//	printstr("\n");
	printintln(time2-time);
	
}

void sobel_pchild(unsigned parent_id, unsigned rank)
{
    unsigned processed_pixel;
    unsigned ind1x,ind2x,ind1y,ind2y;
    unsigned childStart, childStack;
    unsigned num_collected;
    const unsigned subimg_width = IMG_WIDTH/DIV_DEGREE_X + 4;
    const unsigned subimg_length = IMG_LENGTH/DIV_DEGREE_Y + 4;
    //channel input_channel;
    channel parentCommunicationChannel;

    channel myChannels[DIV_DEGREE_Y];
    unsigned pass_pixel;

//start children threads
    for(unsigned i = 0; i <DIV_DEGREE_Y; i++){ 
//	printstrln("Now creating Sub-Child #: ");
//	printintln(i);

    	myChannels[i] = client_allocateNewLocalChannel(i); // push into operating system
   	//start children threads
    	client_createThread(1, childStack,i,rank*6+i+7) ;
    	channelListen(myChannels[i]) ;
//	printintln(i);
	//printstrln("");
    }
	parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);
	parentCommunicationChannel = client_connectNewLocalChannel(DIV_DEGREE_Y, parentCommunicationChannel);

	//printstrln("Established: ");
for(int z=0;z<DIV_DEGREE_Y;z++){
	for(int i =0;i<subimg_width;i++){
		for(int j=0;j<subimg_length;j++){
			pass_pixel = channelReceiveWord(parentCommunicationChannel);
			channelSendWord(myChannels[z],pass_pixel);
		
}
}
}

    //receive the results back
    num_collected = 0;

    /* while(num_collected<NUM_CHILDREN)
    {
    	sobelSelect(myChannels,processed_image);
    	num_collected++;
    } */

    for(int i=0;i<DIV_DEGREE_Y;i++)
       {
       	ind1x = (i % DIV_DEGREE_X) * IMG_WIDTH/DIV_DEGREE_X;
       	ind2x = ind1x + (IMG_WIDTH/DIV_DEGREE_X) + 1;
       	ind1y = (i / DIV_DEGREE_Y) * IMG_LENGTH/DIV_DEGREE_Y;
       	ind2y = ind1y + (IMG_LENGTH/DIV_DEGREE_Y) + 1;

	//	printstr("\n");
	//	printint(i);
       	for(int j=ind1x;j<=ind2x;j++)
       	{
       		for(int k=ind1y;k<=ind2y;k++)
       		{
	//		printstr(", ");
       			processed_pixel = channelReceiveWord(myChannels[i]);
			channelSendWord(parentCommunicationChannel,processed_pixel);
			//processed_image[j][k] = channelReceiveWord(myChannels[i]);
       		}
       	}

       } 
//	client_releaseLocalChannel(DIV_DEGREE_Y);

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

	even_leds <: rank;

//	LEDDisplay8bit(rank);
//	printstrln("entering sobel child");
	//set the convolution matrices	

	parentCommunicationChannel = client_lookupParentChanend(parent_id, rank);

	parentCommunicationChannel = client_connectNewLocalChannel(10, parentCommunicationChannel);
//	printstrln("after setting up connections with parent");

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


	//wait to receive image block from parent

	for (int x = 0; x < subimg_width; x++){
		for (int y = 0; y < subimg_length; y++){
			sub_img[x][y] = channelReceiveWord(parentCommunicationChannel);
		}
	}

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

	for (int x = 0; x < subimg_width-2; x++){
		for (int y = 0; y < subimg_length-2; y++){
			channelSendWord(parentCommunicationChannel,result[x][y]);
		}

	}

//	client_releaseLocalChannel(1);
}
