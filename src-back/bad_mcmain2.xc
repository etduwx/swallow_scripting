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

#define NCORES (32)
int main(void)
{
	chan c[NCORES+1];
	chan k;	
	chan p;


	par (int i = 0 ; i < 1 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : startSync(c[i]) ;
}

	par (int i = 1; i < 17 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
}

	par (int i = 17 ; i < 18 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : powerMeasure(k) ;
}

	par (int i = 18; i < 16 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
}

	par (int i = 16; i < 17 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 17 ; i < 18 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : powerMeasure(k) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 18; i < 19 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 19; i < 20 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
}

	par (int i = 20; i < 21 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : blur_main(c[NCORES],p,1,k) ; 
}

	par (int i = 21; i < 22 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 22; i < 23 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : sobel_main(p,1) ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 23; i < 24 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 24; i < 25 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 25; i < 26 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 26; i < 27 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
}

	par (int i = 27; i < 28 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 28; i < 29 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 29; i < 30 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 30; i < 31 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
	on stdcore[i] : doWork() ; 
}

	par (int i = 31; i < 32 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
}	
	return 0;

}
