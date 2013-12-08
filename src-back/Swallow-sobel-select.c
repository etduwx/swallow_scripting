#include "Swallow-helpers.h"
#include "Swallow-sobel-select.h"
#include "Swallow-sobel.h"


void sobelSelect(channel myChannels[],unsigned processed_image[][IMG_LENGTH+2])
{
	xc_sobelSelect(myChannels,processed_image);
}
