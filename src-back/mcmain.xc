/*
 * mcmain - A sample multicore main file for an XMP16 array
 * 
 * Copyright (C) 2012 Steve Kerrison <github@stevekerrison.com>
 *
 * This software is freely distributable under a derivative of the
 * University of Illinois/NCSA Open Source License posted in
 * LICENSE.txt and at <http://github.xcore.com/>
*/


#define MCMAIN
#include <platform.h>
#include "test.h"


#define NCORES (16*6)
int main(void)
{
	chan c[NCORES];

	par(int i = 0; i < 1; i += 1)
	{
		on stdcore[i] : test_print();
	}
  return 0 ;
  
}
