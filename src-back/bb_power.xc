#include <platform.h>
#include <xs1.h>
#include "Swallow-helpers.h"
#include <xclib.h> // for bitrev(), byterev()
#include <print.h>

out port sclk = XS1_PORT_1K ;
out port cs_n = XS1_PORT_1H ;
out port adc_address = XS1_PORT_8C ;
in buffered port:32 din_a = XS1_PORT_1E ; // can be 1, 8 or 32 bits of serialisation
in buffered port:32 din_b = XS1_PORT_1A ;

clock sclk_clk = XS1_CLKBLK_1 ;

out port r_wn = XS1_PORT_1J ;
out port core2led = XS1_PORT_1I ;

/*
// debug
void xscope_user_init(void) {
  xscope_register(0);
  xscope_config_io(XSCOPE_IO_BASIC);
}
*/

// AEC Code
//// Set xCORE tile standby clock to 100MHz from 500MHz System frequency
//#define STANDBY_CLOCK_DIVIDER (5-1)
// Set xCORE tile standby clock to 100MHz from 500MHz System frequency
#define STANDBY_CLOCK_DIVIDER (100)
#define XCORE_CTRL0_CLOCK_MASK 0x30
#define XCORE_CTRL0_ENABLE_AEC 0x30
/*
 * Resistors on Swallow supplies are 0R1
 * Amp is 20x
 * ADC has 12 bits of resolution
 * ADC Vref = 2.5V
 */
#define VSCALINGFACTOR 625

#define POWERMEASURE_IDLE 0
#define POWERMEASURE_START 1
#define POWERMEASURE_STOP 2
#define POWERMEASURE_SAMPLE 3
#define POWERMEASURE_READVALUES 10

void powerMeasure(chanend control)
{
	unsigned cs_time, cs_endtime ;
	unsigned dataA, dataB ;
	unsigned sampleCount, samplesLeft ;
	unsigned printer[2];
	char toDo ;
	char running, sampling ;

	unsigned V_T, V_MT, V_MB, V_B, V_IO, V_DRAM ;
	unsigned I_T, I_MT, I_MB, I_B, I_IO, I_DRAM ;

	// initialise the ports
	configure_clock_rate(sclk_clk, 5, 1) ; // Max reliable value seems to be 5MHz
	configure_out_port(cs_n, sclk_clk, 1) ;
	configure_out_port(adc_address, sclk_clk, 2) ; // inital value 2
	configure_in_port(din_a, sclk_clk) ;
	configure_in_port(din_b, sclk_clk) ;

	configure_port_clock_output(sclk, sclk_clk) ;

	running = 0 ; // not taking measurements
	toDo = 0 ;
	//P_T= 0 ; P_MT = 0 ; P_MB = 0; P_B = 0 ; P_IO = 0 ; P_DRAM = 0 ; P_TOTAL = 0 ;
	sampleCount = 0 ;
	samplesLeft = 0 ;

	start_clock(sclk_clk) ;

	while (1)
	{
	select
	{
		case control :> toDo :
		{
			if (toDo == POWERMEASURE_START)
			{
				printer[0] = 0xdeadbeef;
				//printMany(1,printer);	
				V_T= 0 ; V_MT = 0 ; V_MB = 0; V_B = 0 ; V_IO = 0 ; V_DRAM = 0 ;
				I_T= 0 ; I_MT = 0 ; I_MB = 0; I_B = 0 ; I_IO = 0 ; I_DRAM = 0 ;
				sampleCount = 0 ;
				running = 1 ;
				sampling = 0 ;
			}
			else if (toDo == POWERMEASURE_SAMPLE)
			{

				V_T= 0 ; V_MT = 0 ; V_MB = 0; V_B = 0 ; V_IO = 0 ; V_DRAM = 0 ;
				I_T= 0 ; I_MT = 0 ; I_MB = 0; I_B = 0 ; I_IO = 0 ; I_DRAM = 0 ;
				sampleCount = 0 ;
				control :> samplesLeft ; // receive how many samples to take
				running = 0 ;
				sampling = 1 ;
			}
			else if (toDo == POWERMEASURE_STOP)
			{
				printer[0] = 0xbabeface;
				//printMany(1,printer);	
				running = 0 ;
				sampling = 0 ;
				toDo = POWERMEASURE_READVALUES;
			}
			break ;
		}


		default:
			if (running == 1 || sampling == 1)
			{
				for (unsigned address = 0 ; address < 6 ; address++)
				{
					adc_address <: address ;
					cs_n <: 1 @ cs_time ; // generate timestamp
					cs_time += 10 ;  // FIXME: For tQuiet. What's minimum? Should be one cycle
					cs_endtime = cs_time + 16 ;
					cs_n @ cs_time <: 0 ;
/*
					cs_n @ cs_endtime <: 1 ;
					sync(cs_n) ;
					adr_clk <: 0 ;
					din_a :> dataB ;
					din_b :> dataA ;
*/

					/* 1
					din_a @ cs_endtime :> dataB ;
					din_b :> dataA ;
					cs_n  <: 1 ;
					adr_clk <: 0 ;
					*/

					/* 2
					cs_n  @ cs_endtime <: 1 ;
					din_a @ cs_endtime :> dataB ;
					din_b :> dataA ;
					cs_n  <: 1 ;
					adr_clk <: 0 ;
					*/

					/* 3
					cs_n  @ cs_endtime <: 1 ;
					adr_clk @ cs_endtime <: 0 ;
					din_a @ cs_endtime :> dataB ;
					din_b :> dataA ;
					*/

					/* 4
					cs_n  @ cs_endtime <: 1 ;
					adr_clk @ cs_endtime <: 0 ;
					//din_a @ cs_endtime :> dataB ;
					din_b @ cs_endtime :> dataA ;
					*/

					/* 5
					cs_n  @ cs_endtime <: 1 ;
					adr_clk @ cs_endtime <: 0 ;
					din_a @ cs_endtime :> dataB ;
					din_b @ cs_endtime :> dataA ;
					*/

					/* 6
					cs_n  @ cs_endtime <: 1 ;
					adr_clk @ cs_endtime <: 0 ;
					din_a @ cs_endtime :> dataB ;
					din_b @ (cs_endtime + 1) :> dataA ;
					*/

					/* 7
					cs_n  @ cs_endtime <: 1 ;
					sync(cs_n) ;
					adr_clk <: 0 ;
					din_a :> dataB ;
					din_b :> dataA ;
					*/

					/* 8
					cs_n  @ cs_endtime <: 1 ;

					sync(cs_n) ;
					adr_clk <: 0 ;
					dataB = partin(din_a, 16) ;
					dataA = partin(din_b, 16) ;
					*/

					/* 9
					cs_n  @ cs_endtime <: 1 ;
					adr_clk @ cs_endtime <: 0 ;
					din_a @ cs_endtime :> dataB ;
					din_b @ (cs_endtime + 2) :> dataA ;
					*/

					/* 10
					cs_n  @ cs_endtime <: 1 ;
					adr_clk @ cs_endtime <: 0 ;
					din_a @ cs_endtime :> dataB ;
					din_b  :> dataA ;
					*/

					/* 11 */
					// hardware pins are not swapped around, so don't invert in s/w
					// The timing sequence below is hand-crafted
					// The system cannot deal with two timed data inputs within
					// two cycles, so they have been offset to make use of the two
					// leading '0's in the ADC data stream.
					cs_n  @ cs_endtime <: 1 ;
					din_a @ (cs_endtime - 2) :> dataA ;
					din_b @ cs_endtime :> dataB ;

					/*
					printhexln(bitrev(dataA)) ;
					printhexln(bitrev(dataB << 2)) ;
					*/


					// FIXME: Remove the AND operation on dataB for performance (seems the data is clean anyway)
					dataA = bitrev(dataA) & 0xfff ;
					dataB = bitrev(dataB << 2) & 0xfff ;


					switch (address) {

						case 0:
							// These voltages doubled, since they're part of a voltage divider
							V_IO += 2 * dataA ;
							V_DRAM += 2 * dataB ;
							break ;

						case 1:
							I_IO += dataA ;
							I_DRAM += dataB ;
							break ;

						case 2:
							V_T += dataA ;
							V_B += dataB ;
							break ;

						case 3:
							I_T += dataA ;
							I_B += dataB ;
							break ;

						case 4:
							V_MT += dataA ;
							V_MB += dataB ;
							break ;

						case 5:
							I_MT += dataA ;
							I_MB += dataB ;
							break ;

						default:
							printstrln("Error! Invalid ADC address being used!") ;
							break ;

						}
				}

				sampleCount++ ;
				if (sampling) samplesLeft-- ;
				if (samplesLeft == 0 && samplesLeft == 0){ 
					toDo = POWERMEASURE_READVALUES ;
					sampling =0;
				}

			}

				if (toDo == POWERMEASURE_READVALUES)
				{
					printer[0] = 0xfadebeef;
					printer[1] = sampleCount;
			//	printMany(2,printer);	
					control <: sampleCount ;
					control <: (V_T * VSCALINGFACTOR) >> 10 ;
					control <: (I_T * VSCALINGFACTOR) >> 11 ;
					control <: (V_MT * VSCALINGFACTOR) >> 10  ;
					control <: (I_MT * VSCALINGFACTOR) >> 11 ;
					control <: (V_MB * VSCALINGFACTOR) >> 10 ;
					control <: (I_MB * VSCALINGFACTOR) >> 11 ;
					control <: (V_B * VSCALINGFACTOR) >> 10  ;
					control <: (I_B * VSCALINGFACTOR) >> 11 ;
					control <: (V_IO * VSCALINGFACTOR) >> 10 ;
					control <: (I_IO * VSCALINGFACTOR) >> 11 ;
					control <: (V_DRAM * VSCALINGFACTOR) >> 10  ;
					control <: (I_DRAM * VSCALINGFACTOR) >> 11 ;

					toDo = POWERMEASURE_IDLE ;
				}
				break ;
			}

	}
}


void powerMeasureClient(chanend control)
{
	timer t ;
	unsigned time ;
	unsigned sampleCount ;
	unsigned V_T, V_MT, V_MB, V_B, V_IO, V_DRAM ;
	unsigned I_T, I_MT, I_MB, I_B, I_IO, I_DRAM ;
	unsigned P_T, P_MT, P_MB, P_B, P_DRAM, P_IO ;

	for (int i = 0 ; i < 1000 ; i++)
	{
	/*
	// start measurement
	control <: (char) POWERMEASURE_START ;

	// wait a bit
	t :> time ;
	time += 100000000 ;
	t when timerafter(time) :> void ;

	// now read the measurements
	control <: (char) POWERMEASURE_STOP ;
	control <: (char) POWERMEASURE_READVALUES ;
	*/
	control <: (char) POWERMEASURE_SAMPLE ;
	control <: 1024 ; // no of samples. Max is 1677 Floor[ 2^32 / 2^12 / VSCALING_FACTOR ]

	control :> sampleCount ;
	control :> V_T ;
	control :> I_T ;
	control :> V_MT ;
	control :> I_MT ;
	control :> V_MB ;
	control :> I_MB ;
	control :> V_B ;
	control :> I_B ;
	control :> V_IO ;
	control :> I_IO ;
	control :> V_DRAM ;
	control :> I_DRAM ;


	printstr("Samples taken:") ;
	printuintln(sampleCount) ;


	printstrln("Voltage measurements (mV)") ;
	printuintln(V_T / sampleCount) ;
	printuintln(V_MT / sampleCount) ;
	printuintln(V_MB / sampleCount) ;
	printuintln(V_B / sampleCount) ;
	printuintln(V_IO / sampleCount) ;
	printuintln(V_DRAM / sampleCount) ;

	printstrln("Current measurements (mA)") ;
	printuintln(I_T / sampleCount) ;
	printuintln(I_MT / sampleCount) ;
	printuintln(I_MB / sampleCount) ;
	printuintln(I_B / sampleCount) ;
	printuintln(I_IO / sampleCount) ;
	printuintln(I_DRAM / sampleCount) ;


	printstrln("Power measurements (mW)") ;

	printstr("P_T = ") ;
	printuintln((V_T / sampleCount) * (I_T / sampleCount) / 1000) ;
	printstr("P_MT = ") ;
	printuintln((V_MT / sampleCount) * (I_MT / sampleCount) / 1000) ;
	printstr("P_MB = ") ;
	printuintln((V_MB / sampleCount) * (I_MB / sampleCount) / 1000) ;
	printstr("P_B = ") ;
	printuintln((V_B / sampleCount) * (I_B / sampleCount) / 1000) ;
	printstr("P_IO = ") ;
	printuintln((V_IO / sampleCount) * (I_IO / sampleCount) / 1000) ;
	printstr("P_DRAM = ") ;
	printuintln((V_DRAM / sampleCount) * (I_DRAM / sampleCount) / 1000) ;
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

void doIdle(unsigned divider, out port leds)
{
	write_pswitch_reg(get_local_tile_id(), XCDIV_REGNUM, divider);  // 1 -> Divide by 2 from main frequency
	setps(PS_XCORE_CTRL0_REGNUM,0x10);
	leds <: divider ;
	asm("waiteu") ; // prevent from terminating, so that leds stay on
}
