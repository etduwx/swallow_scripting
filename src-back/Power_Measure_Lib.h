/*
 * Swallow-helpers.h
 *
 *  Created on: 24 Mar 2013
 *      Author: harry
 */

#ifndef POWERMEASUREMENT_H__
#define POWERMEASUREMENT_H_

#define POWERMEASURE_START 1
#define POWERMEASURE_STOP 2
#define POWERMEASURE_READVALUES 10


#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void pintest(void);
void doWork(void) ;
void doWork4(void);
void doIdle(void);
void powerMeasure(chanend control);
void powerMeasureServer(chanend control);
#ifdef chanend
#undef chanend
#endif
#endif

void doWork(void);

#endif /* POWERMEASUREMENT_H_ */
