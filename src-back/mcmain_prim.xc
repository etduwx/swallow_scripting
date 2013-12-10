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
#include "Power_Measure_Lib.h"
//#include "Swallow-sobel.h"

#define NCORES (26)
int main(void)
{
	chan c[NCORES+1];
	chan k;	

	par (int i = 0 ; i < 1 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : startSync(c[i]);
}
	par (int i = 1 ; i < 2 ; i += 1) {
on stdcore[i] : prim_main(c[NCORES],1,k) ; 
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
	on stdcore[i] : powerMeasure(k);
}

	par (int i = 2 ; i < 4 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
} 
	par (int i = 4 ; i < 8 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
} 
	par (int i = 8 ; i < 12 ; i += 1) {
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
} 
	par (int i = 12 ; i < 16 ; i += 1) {
on stdcore[i] : prim_main(c[NCORES],1,k) ; 
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
} 
	par (int i = 16 ; i < 17 ; i += 1) {
on stdcore[i] : prim_main(c[NCORES],1,k) ; 
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
}
	par (int i = 17 ; i < NCORES ; i += 1) {
on stdcore[i] : prim_main(c[NCORES],1,k) ; 
	on stdcore[i] : nOS_start(c[i],c[i+1],0) ;
} 

/*	par{
		on stdcore[0] : nOS_start(c) ;
		on stdcore[0] : chanTestParent(c11) ;
		on stdcore[0] : sinkSync(c) ;
		on stdcore[1] : nOS_start(c1) ;
		on stdcore[1] : chanTestParent(c12) ;
		on stdcore[1] : sinkSync(c1) ;
		on stdcore[2] : nOS_start(c2) ;
		on stdcore[2] : chanTestParent(c2) ;
		on stdcore[2] : sinkSync(c13) ;
*/

/*		on stdcore[0] : nOS_start(c[0]) ;
		on stdcore[0] : sobel_main(c[99]) ;
		on stdcore[0] : sinkSync(c[0]) ;
		on stdcore[1] : nOS_start(c[1]) ;
		on stdcore[1] : sobel_main(c[98]) ;
		on stdcore[1] : sinkSync(c[1]) ;
		on stdcore[2] : nOS_start(c[2]) ;
		on stdcore[2] : sobel_main(c[2]) ;
		on stdcore[2] : sinkSync(c[97]) ; */

/*		on stdcore[0] : nOS_start(c) ;
		on stdcore[0] : sobel_main(c11) ;
		on stdcore[0] : sinkSync(c) ;
		on stdcore[1] : nOS_start(c1) ;
		on stdcore[1] : sobel_main(c12) ;
		on stdcore[1] : sinkSync(c1) ;
		on stdcore[2] : nOS_start(c2) ;
		on stdcore[2] : sobel_main(c2) ;
		on stdcore[2] : sinkSync(c13) ;
		on stdcore[3] : nOS_start(c3) ;
		on stdcore[3] : sobel_main(c14) ;
		on stdcore[3] : sinkSync(c3) ;
		on stdcore[4] : nOS_start(c4) ;
		on stdcore[4] : sobel_main(c15) ;
		on stdcore[4] : sinkSync(c4) ;
		on stdcore[5] : nOS_start(c5) ;
		on stdcore[5] : sobel_main(c16) ;
		on stdcore[5] : sinkSync(c5) ;
		on stdcore[6] : nOS_start(c6) ;
		on stdcore[6] : sobel_main(c17) ;
		on stdcore[6] : sinkSync(c6) ;
		on stdcore[7] : nOS_start(c7) ;
		on stdcore[7] : sobel_main(c18) ;
		on stdcore[7] : sinkSync(c7) ;
		on stdcore[8] : nOS_start(c8) ;
		on stdcore[8] : sobel_main(c19) ;
		on stdcore[8] : sinkSync(c8) ;
		on stdcore[9] : nOS_start(c9) ;
		on stdcore[9] : sobel_main(c20) ;
		on stdcore[9] : sinkSync(c9) ;
		on stdcore[10] : nOS_start(c10) ;
		on stdcore[10] : sobel_main(c21) ;
		on stdcore[10] : sinkSync(c10) ; */
//		on stdcore[3] : printID(3) ;
//		on stdcore[4] : printID(4) ;
//		on stdcore[5] : printID(5) ;
//		on stdcore[6] : printID(6) ;
//		on stdcore[7] : printID(7) ;
//		on stdcore[8] : printID(8) ;
//		on stdcore[9] : printID(9) ;
//		on stdcore[10] : printID(10) ;
		//on stdcore[0] : eventTestA() ;
		//on stdcore[0] : eventTestB() ;
//	}
  
  return 0 ;
  
}
