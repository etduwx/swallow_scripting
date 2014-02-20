#include <platform.h>
#include <xs1.h>
#include <xclib.h> // for bitrev(), byterev()
#include <print.h>
#include "swallow_comms.h" 
#include "Swallow-helpers.h"

out port sclk = XS1_PORT_1K ;
out port cs_n = XS1_PORT_1H ;
out port adc_address = XS1_PORT_8C ;
in buffered port:32 din_a = XS1_PORT_1E ; // can be 1, 8 or 32 bits of serialisation
in buffered port:32 din_b = XS1_PORT_1A ;
clock sclk_clk = XS1_CLKBLK_3 ;

out port r_wn = XS1_PORT_1J ;
//on stdcore[2] : out port core2led = XS1_PORT_1I ;



// set Port 8C as active, disabling Ports 4E and 4F in the process 
void configPort8C()
{
	unsigned theport, command ;

	theport = 0x40400 ; //PORT_4E ;	
	command = 0x0 ; // not in use
	asm("setc res[%0], %1" : : "r"(theport), "r"(command)) ; // set not in use
	theport = 0x40500 ; //PORT_4F ;
	asm("setc res[%0], %1" : : "r"(theport),"r"(command)) ; // set not in use
	theport = 0x80200 ; //PORT_8C ;
	command = 0x08 ; // in use
	asm("setc res[%0], %1" : : "r"(theport), "r"(command)) ; // set in use
}
/*
 * Resistors on Swallow supplies are 0R1
 * Amp is 20x
 * ADC has 12 bits of resolution
 * ADC Vref = 2.5V
 */
#define VSCALINGFACTOR (2.5 / 4096)
#define ISCALINGFACTOR ((10 * (2.5 / 4096)) / 20)


#define POWERMEASURE_START 1
#define POWERMEASURE_STOP 2
#define POWERMEASURE_READVALUES 10

void powerMeasure(chanend control)
{
	unsigned cs_time ;
	unsigned dataA, dataB ;
	unsigned sampleCount ;
	char toDo ;
	unsigned running ;

	unsigned V_T, V_MT, V_MB, V_B, V_IO, V_DRAM ;
	unsigned I_T, I_MT, I_MB, I_B, I_IO, I_DRAM ;
	unsigned prints[8] ;
	double P_T, P_MT, P_MB, P_B, P_IO, P_DRAM, P_TOTAL ;

	// initialise the ports
	configPort8C() ;

	configure_clock_rate(sclk_clk, 5, 1) ; // Max reliable value seems to be 5MHz
	configure_out_port(cs_n, sclk_clk, 1) ;
	configure_out_port(adc_address, sclk_clk, 2) ; // inital value 2

	configure_in_port(din_a, sclk_clk) ;
	configure_in_port(din_b, sclk_clk) ;
	configure_port_clock_output(sclk, sclk_clk) ;
	start_clock(sclk_clk) ;

	running = 0 ; // not taking measurements
	toDo = 0 ;
	P_T= 0 ; P_MT = 0 ; P_MB = 0; P_B = 0 ; P_IO = 0 ; P_DRAM = 0 ; P_TOTAL = 0 ;
	sampleCount = 0 ;

	while (toDo != POWERMEASURE_START)
	{
		control :> toDo ;
	}
	// then go!
	running = 1 ;

	while (1)
	{
	select
	{
		case control :> toDo :
		{
			if (toDo == POWERMEASURE_START)
			{
				P_T= 0 ; P_MT = 0 ; P_MB = 0; P_B = 0 ; P_IO = 0 ; P_DRAM = 0 ; P_TOTAL = 0 ;
				sampleCount = 0 ;
				running = 1 ;
			}
			else if (toDo == POWERMEASURE_STOP)
			{
				running = 0 ;
			}
			else if (toDo == POWERMEASURE_READVALUES)
			{
				control <: sampleCount ;
				control <: P_T ;
				control <: P_MT ;
				control <: P_MB ;
				control <: P_B ;
				control <: P_IO ;
				control <: P_DRAM ;
				control <: P_TOTAL ;
			}
			break ;
		}


		default:
			if (running == 1)
			{

		//		printstrln("\nStart address scan") ;
				for (unsigned address = 0 ; address < 6 ; address++)
				{
					adc_address <: address ;
					sync(cs_n) ;
					cs_n <: 0 @ cs_time ;
					clearbuf(din_a) ;
					clearbuf(din_b) ;
					cs_time += 32 ;
					cs_n @ cs_time <: 1 ;

					// hardware pins are swapped around, so invert in s/w
					din_a :> dataB ;
					din_b :> dataA ;

					//dataA = partin(din_a, 16) ;
					//dataB = partin(din_b, 16) ;
					//cs_n <: 1 ;

					dataA = bitrev(dataA << 3) & 0xfff ;
					dataB = bitrev(dataB << 3) & 0xfff ;




					switch (address) {

						case 0:
							// These voltages doubled, since they're part of a voltage divider
							V_IO = 2 * dataA ;
							V_DRAM = 2 * dataB ;
							break ;

						case 1:
							I_IO = dataA ;
							I_DRAM = dataB ;
							break ;

						case 2:
							V_T = dataA ;
							V_B = dataB ;
							break ;

						case 3:
							I_T = dataA ;
							I_B = dataB ;
							break ;

						case 4:
							V_MT = dataA ;
							V_MB = dataB ;
							break ;

						case 5:
							I_MT = dataA ;
							I_MB = dataB ;
							break ;

						default:
							printstrln("Error! Invalid ADC address being used!") ;
							break ;

						}


					// delay for t_quiet ; breaks everything!
					cs_n <: 1 @ cs_time ;
					cs_time += 10 ;
					cs_n @ cs_time <: 1 ;


				}

				sampleCount++ ;

				P_T = (P_T +  (V_T * VSCALINGFACTOR) * (I_T * ISCALINGFACTOR)) ;
				P_MT = (P_MT + (V_MT * VSCALINGFACTOR) * (I_MT * ISCALINGFACTOR)) ;
				P_MB = (P_MB + (V_MB * VSCALINGFACTOR) * (I_MB * ISCALINGFACTOR)) ;
				P_B = (P_B + (V_B * VSCALINGFACTOR) * (I_B * ISCALINGFACTOR)) ;
				P_IO = (P_IO + (V_IO * VSCALINGFACTOR) * (I_IO * ISCALINGFACTOR))  ;
				P_DRAM = (P_DRAM + (V_DRAM * VSCALINGFACTOR) * (I_DRAM * ISCALINGFACTOR) / 3.9) ; // It has a 0R39 R c.f. 0R1 for others
				P_TOTAL = P_T + P_MT + P_MB + P_B + P_IO + P_DRAM ;

				
				break ;
			} 
			break;
	}
}

}
void powerMeasureServer(chanend control)
{
	timer t ;
	unsigned time ;
	unsigned sampleCount ;
	unsigned prints[8] ;
	double P_T, P_MT, P_MB, P_B, P_DRAM, P_IO, P_TOTAL ;

	for (int i = 0 ; i < 10 ; i++)
	{
	// start measurement
	control <: (char) POWERMEASURE_START ;

	// wait a bit
	t :> time ;
	time += 100000000 ;
	t when timerafter(time) :> void ;

	// now read the measurements
	control <: (char) POWERMEASURE_STOP ;
	control <: (char) POWERMEASURE_READVALUES ;

	control :> sampleCount ;
	control :> P_T ;
	control :> P_MT ;
	control :> P_MB ;
	control :> P_B ;
	control :> P_IO ;
	control :> P_DRAM ;
	control :> P_TOTAL ;


	// print average power measurements in mW
	prints[0] = P_T * 1000 / sampleCount ;
	prints[1] = P_MT * 1000 / sampleCount ;
	prints[2] = P_MB * 1000 / sampleCount ;
	prints[3] = P_B * 1000 / sampleCount ;
	prints[4] = P_IO * 1000 / sampleCount ;
	prints[5] = P_DRAM * 1000 / sampleCount ;
	prints[6] = sampleCount ;
	//printMany(7, prints) ;

	}
}


#define XCDIV_REGNUM 6
#define PS_XCORE_CTRL0_REGNUM 0x20b
void doWorkDiv(unsigned divider)
{
	write_pswitch_reg(get_local_tile_id(), XCDIV_REGNUM, divider);  // 1 -> Divide by 2 from main frequency
	setps(PS_XCORE_CTRL0_REGNUM,0x10);

	while(1)
	{
		unsigned a = 0xaaaaaaaa ;
		unsigned b = 0xbbbbbbbb ;
		asm("mul %0, %1, %2" : "=r"(a) : "r"(a), "r"(b) ) ;
	}
}


void doWork(void)
{
	while(1)
	{
		unsigned a = 0xaaaaaaaa ;
		unsigned b = 0xbbbbbbbb ;
		asm("mul %0, %1, %2" : "=r"(a) : "r"(a), "r"(b) ) ;
	}
}

void doIdle(void)
{
	//write_pswitch_reg(get_local_tile_id(), XCDIV_REGNUM, divider);  // 1 -> //Divide by 2 from main frequency
	//setps(PS_XCORE_CTRL0_REGNUM,0x10);
	//leds <: divider ;
	asm("waiteu") ; // prevent from terminating, so that leds stay on
}



