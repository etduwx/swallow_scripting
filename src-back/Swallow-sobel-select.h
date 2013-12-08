#include "Swallow-sobel.h"

#ifndef SWALLOW_SOBEL_SELECT_H_
#define SWALLOW_SOBEL_SELECT_H_
/*
#ifdef __XC__
void xc_sobelSelect(chanend c[],unsigned processed_image[][34]);
#else
void xc_sobelSelect(unsigned c[],unsigned processed_image[][34]);
#endif
*/

void sobelSelect(channel myChannels[],unsigned processed_image[][IMG_LENGTH+2]);

#endif /* SWALLOW_SOBEL_H_ */
