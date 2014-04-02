/*
 * Swallow-nOS.h
 *
 *  Created on: 18 Apr 2013
 *      Author: harry
 */

#ifndef SWALLOW_NOS_H_
#define SWALLOW_NOS_H_

//enum processNames { p_begin1, p_begin2, p_begin3, p_sobel_child,p_prim_child } ;
#define get_startAddress(f, var) asm("ldap r11, " #f "; mov %0, r11":"=r"(var)::"r11");
#define conc_macro(str1,str2) #str1#str2
#define get_stackSize_macro2(f, var) asm("ldc %0, " f :"=r"(var):);
#define get_stackSize(f, var) get_stackSize_macro2(conc_macro(f, .nstackwords),var)



#ifdef __XC__
#include "Swallow-helpers.h"
#include "Swallow-nOS_asm.h"

#ifdef MCMAIN
#define chanend unsigned
#endif
void sinkSync(chanend c);
void nOS_start(chanend c_in,chanend c_out, unsigned initialFreqDivider) ;
void startSync(chanend c1);
#ifdef chanend
#undef chanend
#endif
void addNewChanMapEntry(chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS], channel c, unsigned owner, unsigned index) ;
channel lookupChanMapEntry(chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS], unsigned owner, unsigned index) ;
void deleteChanMapEntry(chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS], unsigned owner, unsigned index) ;
unsigned nOS_doAction(unsigned action, unsigned arg1, unsigned arg2, unsigned arg3, unsigned stacks[MAXLOCALTHREADS][THREADSTACKSIZE], chanMapping chanMap[MAXLOCALTHREADS][MAXTHREADCHANNELS]) ;

void begin1(unsigned parentID, unsigned rank) ;
void begin2(unsigned parentID, unsigned rank) ;
void begin3(unsigned parentID, unsigned rank) ;

void select1B(chanend c1, chanend c2) ;


#else
void begin1(unsigned parentID, unsigned rank) ;
void begin2(unsigned parentID, unsigned rank) ;
void begin3(unsigned parentID, unsigned rank) ;
void startSync(unsigned c1);
void sinkSync(unsigned c1);
void select1B(unsigned c1, unsigned c2) ;
#endif


static inline void printOne(unsigned value);

#endif /* SWALLOW_NOS_H_ */
