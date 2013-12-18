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
#include <xs1.h>
#include <print.h>
#include <math.h>
#include <stdlib.h> // for exit()

#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"
#include "Swallow-nOS.h"
#include "Swallow-nOS_client.h"
#include "Swallow-nOS_initialFunctions.h"
#include "Swallow-prim.h"
#include "blur.h"
#include "Power_Measure_Lib.h"
#include "Swallow-sobel.h"

#define NCORES (16)
int main(void)
{
	chan c[NCORES+1];
	chan k;	
	chan p;


	par (int i = 0 ; i < 1 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : startSync(c[i]) ;
}

	par (int i = 1 ; i < 2 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : powerMeasure(k) ;
	on stdcore[i] : prim_main(c[NCORES],p,1,k) ; 
	on stdcore[i] : sobel_main(p,1) ; 
}

	par (int i = 2; i < 16 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	
	return 0;

}
