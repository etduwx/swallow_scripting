#include <math.h>
#include <stdlib.h>
#include <platform.h>
#include <time.h>
#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_initialFunctions.h"
#include "Swallow-nOS_client.h"
#include "merge_sort.h"
#include "swallow_comms.h"
#include "Power_Measure_Lib.h"

void merge_sort_root(chanend c_in,chanend control_channel)
{

	unsigned data[INPUT_SIZE],left_half[INPUT_SIZE/2],right_half[INPUT_SIZE/2],child_ack;
	channel myChannels[2]; //one for left and one for right child
	unsigned j,k;

	j=0;
	k=0;	

	for(unsigned i=0;i<INPUT_SIZE;i++)
	{
		data[i] = rand() % 1000;
	}

	printMany(INPUT_SIZE,data); //print initial random list

	myChannels[0] = client_allocateNewLocalChannel(0);
	myChannels[1] = client_allocateNewLocalChannel(1);

	client_createThread(2,100,0,4);
	channelListen(myChannels[0]);
	client_createThread(2,100,1,5);
	channelListen(myChannels[1]);
	
	//Tell my children that they are at level 1 of the tree
	channelSendWord(myChannels[0],1);
	channelSendWord(myChannels[1],1);

	child_ack = channelReceiveWord(myChannels[0]);
	child_ack = channelReceiveWord(myChannels[1]);

	for(unsigned i=0;i<INPUT_SIZE/2;i++)
	{
		channelSendWord(myChannels[0],data[i]);
		channelSendWord(myChannels[1],data[INPUT_SIZE/2+i]);
	}
	
	child_ack = channelReceiveWord(myChannels[0]);
	child_ack = channelReceiveWord(myChannels[1]);

	//Receive final sorted halves back
	for(unsigned i=0;i<INPUT_SIZE/2;i++)
	{
		left_half[i] = channelReceiveWord(myChannels[0]);
		right_half[i] = channelReceiveWord(myChannels[1]);
	}

	//Perform last merge sort
	for(unsigned i=0;i<INPUT_SIZE/2;i++)
	{
		if(k<INPUT_SIZE/2)
		{    
			while(left_half[i] >= right[k])
			{
				data[j]=right[k];
				k++;
				j++;
				if(k==INPUT_SIZE/2) break;
			}
		}
			data[j]=left_half[i];
			j++;
	}

	while(j<INPUT_SIZE)
	{
		data[j]=right[k];
		j++;
		k++;
	}

	printMany(INPUT_SIZE,data); //print sorted list
}

void merge_sort_child(unsigned parent_id,unsigned rank)
{
	channel parentCommunicationChannel;
	unsigned myTreeLevel; //variable in which to store how deep I am in the tree	
	

	parentCommunicationChannel = client_lookupParentChanend(parent_id,rank);
	parentCommunicationChannel = client_connectNewLocalChannel(1,parentCommunicationChannel);

	myTreeLevel = channelReceiveWord(parentCommunicationChannel);

	childWorker(parentCommunicationChannel,rank,myTreeLevel);
	
} 

void childWorker(unsigned parentCommunicationChannel,unsigned rank, unsigned myTreeLevel)
{
	unsigned data[INPUT_SIZE/(2*myTreeLevel)];
	unsigned vectorLength,temp,child_ack;
	unsigned left_half[INPUT_SIZE/(4*myTreeLevel)],right_half[INPUT_SIZE/(4*myTreeLevel)];
	channel myChannels[2];	

	vectorLength=INPUT_SIZE/(2*myTreeLevel);
	
	//Send acknowledgement
	channelSendWord(parentCommunicationChannel,1);

	for(unsigned i=0;i<vectorLength;i++)
	{
		data[i]=channelReceiveWord(parentCommunicationChannel);
	}

	if(vectorLength==2)
	{
		if(data[0]>data[1])
		{
			temp=data[1];
			data[1]=data[0];
			data[0]=data[1];
		}

		channelSendWord(parentCommunicationChannel,data[0]);
		channelSendWord(parentCommunicationChannel,data[1]);
		return;
	}

	myChannels[0]=client_allocateNewLocalChannel(0);
	myChannels[1]=client_allocateNewLocalChannel(1);

	client_createThread(2,100,0,4);
	channelListen(myChannels[0]);	
	client_createThread(2,100,0,5);
	channelListen(myChannels[1]);

	//Tell my children that they are at myLevel+1 of the tree
	channelSendWord(myChannels[0],myLevel+1);
	channelSendWord(myChannels[1],myLevel+1);

	child_ack = channelReceiveWord(myChannels[0]);
	child_ack = channelReceiveWord(myChannels[1]);

	for(unsigned i=0;i<vectorLength;i++)
	{
		channelSendWord(myChannels[0],data[i]);
		channelSendWord(myChannels[1],data[vectorLength/2+i]);
	}
	
	child_ack = channelReceiveWord(myChannels[0]);
	child_ack = channelReceiveWord(myChannels[1]);

	//Receive sorted halves back
	for(unsigned i=0;i<vectorLength/2;i++)
	{
		left_half[i] = channelReceiveWord(myChannels[0]);
		right_half[i] = channelReceiveWord(myChannels[1]);
	}

	//Perform last merge sort
	for(unsigned i=0;i<vectorLength/2;i++)
	{
		if(k<vectorLength/2)
		{    
			while(left_half[i] >= right[k])
			{
				data[j]=right[k];
				k++;
				j++;
				if(k==vectorLength/2) break;
			}
		}
			data[j]=left_half[i];
			j++;
	}

	while(j<vectorLength)
	{
		data[j]=right[k];
		j++;
		k++;
	}
	
	//Send Results Back Up
	for(unsigned i=0;i<vectorLength;i++)
	{
		channelSendWord(parentCommunicationChannel,data[i]);
	}

}
