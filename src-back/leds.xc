/*
 * leds.xc
 *
 *  Created on: 23 May 2013
 *      Author: harry
 */
#include "leds.h"
#include <platform.h>
#include <xs1.h>
#define LEDS_DELAY 30000000
#define LED_DELAY 30000000

out port ten_led = XS1_PORT_1E ;
out port two_led = XS1_PORT_1I ;
out port  even_led = XS1_PORT_1J ;
out port  odd_leds = XS1_PORT_4F ;

void LEDDisplay16bit(unsigned id)
{
	timer t ;
	unsigned display ;
	unsigned time = 0 ;


	while (1) {
		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID MSbs
		display = id >> 12 ;
		odd_leds <: display ;
		even_led <: 1 ;
		ten_led <: 1 ;
		two_led <: 1 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID LSbs
		display = id >> 8 ;
		odd_leds <: display ;
		//even_led <: 0 ;
		//ten_led <: 0 ;
		//two_led <: 0 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		display = id >> 4 ;
		odd_leds <: display ;
		even_led <: 0 ;
		ten_led <: 0 ;
		two_led <: 0 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID LSbs
		display = id >> 0 ;
		odd_leds <: display ;
		//even_led <: 0 ;
		//ten_led <: 0 ;
		//two_led <: 0 ;

	}
}

void LEDDisplay32bit(unsigned id)
{
	timer t ;
	unsigned display ;
	unsigned time = 0 ;


	while (1) {
		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID MSbs
				display = id >> 28 ;
				odd_leds <: display ;
				even_led <: 1 ;
				ten_led <: 1 ;
				two_led <: 1 ;

				time += LEDS_DELAY ;
				t when timerafter(time) :> void ;

				// display ID LSbs
				display = id >> 24 ;
				odd_leds <: display ;
				//even_led <: 0 ;
				//ten_led <: 0 ;
				//two_led <: 0 ;

				time += LEDS_DELAY ;
				t when timerafter(time) :> void ;

				display = id >> 20 ;
				odd_leds <: display ;
				even_led <: 0 ;
				ten_led <: 0 ;
				two_led <: 0 ;

				time += LEDS_DELAY ;
				t when timerafter(time) :> void ;

				// display ID LSbs
				display = id >> 16 ;
				odd_leds <: display ;
				//even_led <: 0 ;
				//ten_led <: 0 ;
				//two_led <: 0 ;


		// display ID MSbs
		display = id >> 12 ;
		odd_leds <: display ;
		//even_led <: 1 ;
		//ten_led <: 1 ;
		//two_led <: 1 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID LSbs
		display = id >> 8 ;
		odd_leds <: display ;
		//even_led <: 0 ;
		//ten_led <: 0 ;
		//two_led <: 0 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		display = id >> 4 ;
		odd_leds <: display ;
		even_led <: 0 ;
		ten_led <: 0 ;
		two_led <: 0 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID LSbs
		display = id >> 0 ;
		odd_leds <: display ;
		//even_led <: 0 ;
		//ten_led <: 0 ;
		//two_led <: 0 ;

	}
}


void LEDDisplay8bit(unsigned id)
{
	timer t ;
	unsigned display ;
	unsigned time = 0 ;


	while (1) {

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		display = id >> 4 ;
		odd_leds <: display ;
		even_led <: 1 ;
		ten_led <: 1 ;
		two_led <: 1 ;

		time += LEDS_DELAY ;
		t when timerafter(time) :> void ;

		// display ID LSbs
		display = id >> 0 ;
		odd_leds <: display ;
		even_led <: 0 ;
		ten_led <: 0 ;
		two_led <: 0 ;

	}
}
