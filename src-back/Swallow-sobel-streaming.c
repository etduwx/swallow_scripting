#include <xs1.h>
#include <print.h>
#include <math.h>
#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_initialFunctions.h"
#include "Swallow-nOS_client.h"
#include "Swallow-sobel-streaming.h"

#define LOCALnOSCHANEND 0x1f02 // hard-coded for core[0] only. TODO: generalise
#define IMG_WIDTH 32
#define IMG_LENGTH 32
#define DIV_DEGREE 4 // the degree to which the image is divided along each dimension (can only result in a square number of small images)
#define NUM_CHILDREN 16 //num_children must equal DIV_DEGREE^2
#define THRESHOLD 30 // threshold for gradient to be labeled as an edge

void c_coreSendWords(channel output, unsigned data[], unsigned data_length)
{
	coreSendWords(output, data, data_length);
}
unsigned c_coreReceiveWords(channel input, unsigned receiveBuffer[])
{
	coreReceiveWords(input, receiveBuffer);
}
