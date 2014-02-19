# 1 "Power_Measure_Lib.xc"
# 1 "platform.h" 1 3
# 21 "platform.h" 3
# 1 "/home/sld-user/swallow/swallow_scripting/src-back/ccxUmHV3.h" 1
# 4 "/home/sld-user/swallow/swallow_scripting/src-back/ccxUmHV3.h"
# 1 "xs1.h" 1 3
# 31 "xs1.h" 3
# 1 "xs1_g4000b-512.h" 1 3
# 32 "xs1.h" 2 3
# 37 "xs1.h" 3
# 1 "xs1_user.h" 1 3
# 20 "xs1_user.h" 3
# 1 "xs1b_user.h" 1 3
# 21 "xs1_user.h" 2 3
# 38 "xs1.h" 2 3
# 1 "xs1_kernel.h" 1 3
# 20 "xs1_kernel.h" 3
# 1 "xs1b_kernel.h" 1 3
# 21 "xs1_kernel.h" 2 3
# 39 "xs1.h" 2 3
# 1 "xs1_registers.h" 1 3
# 20 "xs1_registers.h" 3
# 1 "xs1b_registers.h" 1 3
# 29 "xs1b_registers.h" 3
# 1 "xs1_g_registers.h" 1 3
# 30 "xs1b_registers.h" 2 3
# 1 "xs1_l_registers.h" 1 3
# 31 "xs1b_registers.h" 2 3
# 21 "xs1_registers.h" 2 3
# 40 "xs1.h" 2 3
# 1 "xs1_clock.h" 1 3
# 41 "xs1.h" 2 3
# 73 "xs1.h" 3
void configure_in_port_handshake(void port p, in port readyin,
                                 out port readyout,  __clock_t  clk);
# 102 "xs1.h" 3
void configure_out_port_handshake(void port p, in port readyin,
                                 out port readyout,  __clock_t  clk,
                                 unsigned initial);
# 128 "xs1.h" 3
void configure_in_port_strobed_master(void port p, out port readyout,
                                      const  __clock_t  clk);
# 151 "xs1.h" 3
void configure_out_port_strobed_master(void port p, out port readyout,
                                      const  __clock_t  clk, unsigned initial);
# 173 "xs1.h" 3
void configure_in_port_strobed_slave(void port p, in port readyin,  __clock_t  clk);
# 198 "xs1.h" 3
void configure_out_port_strobed_slave(void port p, in port readyin,  __clock_t  clk,
                                      unsigned initial);
# 222 "xs1.h" 3
void configure_in_port(void port p, const  __clock_t  clk);
# 228 "xs1.h" 3
void configure_in_port_no_ready(void port p, const  __clock_t  clk);
# 251 "xs1.h" 3
void configure_out_port(void port p, const  __clock_t  clk, unsigned initial);
# 257 "xs1.h" 3
void configure_out_port_no_ready(void port p, const  __clock_t  clk, unsigned initial);
# 267 "xs1.h" 3
void configure_port_clock_output(void port p, const  __clock_t  clk);
# 276 "xs1.h" 3
void start_port(void port p);
# 283 "xs1.h" 3
void stop_port(void port p);
# 296 "xs1.h" 3
void configure_clock_src( __clock_t  clk, void port p);
# 310 "xs1.h" 3
void configure_clock_ref( __clock_t  clk, unsigned char divide);
# 326 "xs1.h" 3
void configure_clock_rate( __clock_t  clk, unsigned a, unsigned b);
# 340 "xs1.h" 3
void configure_clock_rate_at_least( __clock_t  clk, unsigned a, unsigned b);
# 354 "xs1.h" 3
void configure_clock_rate_at_most( __clock_t  clk, unsigned a, unsigned b);
# 367 "xs1.h" 3
void set_clock_src( __clock_t  clk, void port p);
# 380 "xs1.h" 3
void set_clock_ref( __clock_t  clk);
# 396 "xs1.h" 3
void set_clock_div( __clock_t  clk, unsigned char div);
# 411 "xs1.h" 3
void set_clock_rise_delay( __clock_t  clk, unsigned n);
# 426 "xs1.h" 3
void set_clock_fall_delay( __clock_t  clk, unsigned n);
# 446 "xs1.h" 3
void set_port_clock(void port p, const  __clock_t  clk);
# 464 "xs1.h" 3
void set_port_ready_src(void port p, void port ready);
# 482 "xs1.h" 3
void set_clock_ready_src( __clock_t  clk, void port ready);
# 492 "xs1.h" 3
void set_clock_on( __clock_t  clk);
# 502 "xs1.h" 3
void set_clock_off( __clock_t  clk);
# 512 "xs1.h" 3
void start_clock( __clock_t  clk);
# 520 "xs1.h" 3
void stop_clock( __clock_t  clk);
# 530 "xs1.h" 3
void set_port_use_on(void port p);
# 540 "xs1.h" 3
void set_port_use_off(void port p);
# 550 "xs1.h" 3
void set_port_mode_data(void port p);
# 562 "xs1.h" 3
void set_port_mode_clock(void port p);
# 583 "xs1.h" 3
void set_port_mode_ready(void port p);
# 594 "xs1.h" 3
void set_port_drive(void port p);
# 610 "xs1.h" 3
void set_port_drive_low(void port p);
# 625 "xs1.h" 3
void set_port_pull_up(void port p);
# 640 "xs1.h" 3
void set_port_pull_down(void port p);
# 650 "xs1.h" 3
void set_port_pull_none(void port p);
# 664 "xs1.h" 3
void set_port_master(void port p);
# 678 "xs1.h" 3
void set_port_slave(void port p);
# 692 "xs1.h" 3
void set_port_no_ready(void port p);
# 707 "xs1.h" 3
void set_port_strobed(void port p);
# 720 "xs1.h" 3
void set_port_handshake(void port p);
# 729 "xs1.h" 3
void set_port_no_sample_delay(void port p);
# 738 "xs1.h" 3
void set_port_sample_delay(void port p);
# 746 "xs1.h" 3
void set_port_no_inv(void port p);
# 757 "xs1.h" 3
void set_port_inv(void port p);
# 780 "xs1.h" 3
void set_port_shift_count( void port p, unsigned n);
# 795 "xs1.h" 3
void set_pad_delay(void port p, unsigned n);
# 810 "xs1.h" 3
void set_core_fast_mode_on(void);
# 818 "xs1.h" 3
void set_core_fast_mode_off(void);
# 848 "xs1.h" 3
void start_streaming_slave(chanend c);
# 867 "xs1.h" 3
void start_streaming_master(chanend c);
# 880 "xs1.h" 3
void stop_streaming_slave(chanend c);
# 893 "xs1.h" 3
void stop_streaming_master(chanend c);
# 908 "xs1.h" 3
void outuchar(chanend c, unsigned char val);
# 923 "xs1.h" 3
void outuint(chanend c, unsigned val);
# 939 "xs1.h" 3
unsigned char inuchar(chanend c);
# 955 "xs1.h" 3
unsigned inuint(chanend c);
# 972 "xs1.h" 3
void inuchar_byref(chanend c, unsigned char &val);
# 990 "xs1.h" 3
void inuint_byref(chanend c, unsigned &val);
# 1000 "xs1.h" 3
void sync(void port p);
# 1011 "xs1.h" 3
unsigned peek(void port p);
# 1025 "xs1.h" 3
void clearbuf(void port p);
# 1041 "xs1.h" 3
unsigned endin( void port p);
# 1058 "xs1.h" 3
unsigned partin( void port p, unsigned n);
# 1074 "xs1.h" 3
void partout( void port p, unsigned n, unsigned val);
# 1092 "xs1.h" 3
unsigned partout_timed( void port p, unsigned n, unsigned val, unsigned t);
# 1110 "xs1.h" 3
{unsigned , unsigned } partin_timestamped( void port p, unsigned n);
# 1128 "xs1.h" 3
unsigned partout_timestamped( void port p, unsigned n, unsigned val);
# 1142 "xs1.h" 3
void outct(chanend c, unsigned char val);
# 1157 "xs1.h" 3
void chkct(chanend c, unsigned char val);
# 1172 "xs1.h" 3
unsigned char inct(chanend c);
# 1187 "xs1.h" 3
void inct_byref(chanend c, unsigned char &val);
# 1201 "xs1.h" 3
int testct(chanend c);
# 1214 "xs1.h" 3
int testwct(chanend c);
# 1229 "xs1.h" 3
void soutct(streaming chanend c, unsigned char val);
# 1245 "xs1.h" 3
void schkct(streaming chanend c, unsigned char val);
# 1261 "xs1.h" 3
unsigned char sinct(streaming chanend c);
# 1277 "xs1.h" 3
void sinct_byref(streaming chanend c, unsigned char &val);
# 1291 "xs1.h" 3
int stestct(streaming chanend c);
# 1305 "xs1.h" 3
int stestwct(streaming chanend c);
# 1320 "xs1.h" 3
transaction out_char_array(chanend c, const char src[], unsigned size);
# 1333 "xs1.h" 3
transaction in_char_array(chanend c, char src[], unsigned size);
# 1356 "xs1.h" 3
void crc32(unsigned &checksum, unsigned data, unsigned poly);
# 1380 "xs1.h" 3
unsigned crc8shr(unsigned &checksum, unsigned data, unsigned poly);
# 1395 "xs1.h" 3
{unsigned, unsigned} lmul(unsigned a, unsigned b, unsigned c, unsigned d);
# 1409 "xs1.h" 3
{unsigned, unsigned} mac(unsigned a, unsigned b, unsigned c, unsigned d);
# 1423 "xs1.h" 3
{signed, unsigned} macs(signed a, signed b, signed c, unsigned d);
# 1437 "xs1.h" 3
signed sext(unsigned a, unsigned b);
# 1451 "xs1.h" 3
unsigned zext(unsigned a, unsigned b);
# 1464 "xs1.h" 3
void pinseq(unsigned val);
# 1477 "xs1.h" 3
void pinsneq(unsigned val);
# 1492 "xs1.h" 3
void pinseq_at(unsigned val, unsigned time);
# 1507 "xs1.h" 3
void pinsneq_at(unsigned val, unsigned time);
# 1520 "xs1.h" 3
void timerafter(unsigned val);
# 1556 "xs1.h" 3
unsigned getps(unsigned reg);
# 1567 "xs1.h" 3
void setps(unsigned reg, unsigned value);
# 1588 "xs1.h" 3
int read_pswitch_reg(unsigned tileid, unsigned reg, unsigned &data);
# 1612 "xs1.h" 3
int read_sswitch_reg(unsigned tileid, unsigned reg, unsigned &data);
# 1634 "xs1.h" 3
int write_pswitch_reg(unsigned tileid, unsigned reg, unsigned data);
# 1654 "xs1.h" 3
int write_pswitch_reg_no_ack(unsigned tileid, unsigned reg, unsigned data);
# 1673 "xs1.h" 3
int write_sswitch_reg(unsigned tileid, unsigned reg, unsigned data);
# 1694 "xs1.h" 3
int write_sswitch_reg_no_ack(unsigned tileid, unsigned reg, unsigned data);
# 1709 "xs1.h" 3
int read_tile_config_reg(tileref tile, unsigned reg, unsigned &data);
# 1723 "xs1.h" 3
int write_tile_config_reg(tileref tile, unsigned reg, unsigned data);
# 1738 "xs1.h" 3
int write_tile_config_reg_no_ack(tileref tile, unsigned reg, unsigned data);
# 1760 "xs1.h" 3
int read_node_config_reg(tileref tile, unsigned reg, unsigned &data);
# 1775 "xs1.h" 3
int write_node_config_reg(tileref tile, unsigned reg, unsigned data);
# 1791 "xs1.h" 3
int write_node_config_reg_no_ack(tileref tile, unsigned reg, unsigned data);
# 1810 "xs1.h" 3
int read_periph_8(tileref tile, unsigned peripheral, unsigned base_address,
                  unsigned size, unsigned char data[]);
# 1829 "xs1.h" 3
int write_periph_8(tileref tile, unsigned peripheral, unsigned base_address,
                   unsigned size, const unsigned char data[]);
# 1850 "xs1.h" 3
int write_periph_8_no_ack(tileref tile, unsigned peripheral,
                          unsigned base_address, unsigned size,
                          const unsigned char data[]);
# 1872 "xs1.h" 3
int read_periph_32(tileref tile, unsigned peripheral, unsigned base_address,
                   unsigned size, unsigned data[]);
# 1893 "xs1.h" 3
int write_periph_32(tileref tile, unsigned peripheral, unsigned base_address,
                    unsigned size, const unsigned data[]);
# 1916 "xs1.h" 3
int write_periph_32_no_ack(tileref tile, unsigned peripheral,
                           unsigned base_address, unsigned size,
                           const unsigned data[]);
# 1927 "xs1.h" 3
unsigned get_local_tile_id(void);
# 1935 "xs1.h" 3
unsigned get_logical_core_id(void);
# 1940 "xs1.h" 3
extern int __builtin_getid(void);
# 5 "/home/sld-user/swallow/swallow_scripting/src-back/ccxUmHV3.h" 2
# 13 "/home/sld-user/swallow/swallow_scripting/src-back/ccxUmHV3.h"
extern core stdcore[1];
# 22 "platform.h" 2 3
# 2 "Power_Measure_Lib.xc" 2
# 1 "xs1.h" 1 3
# 3 "Power_Measure_Lib.xc" 2
# 1 "Swallow-helpers.h" 1
# 11 "Swallow-helpers.h"
typedef unsigned channel ;
typedef unsigned endpoint ;

unsigned nodeIndexToId(unsigned node) ;
endpoint buildChanId(unsigned node, unsigned chanIndex) ;
channel getNewChannel() ;
void connectChannel(channel c, endpoint dest) ;
unsigned connectNewChannel(endpoint dest) ;
unsigned getSpecificLocalChannel(unsigned channelNo) ;
endpoint channelListen(channel c) ;
void channelSendWord(channel c, unsigned value) ;
unsigned channelReceiveWord(channel c) ;
unsigned nodeIndexToId(unsigned node) ;
unsigned rowColToNodeId(unsigned row, unsigned column, unsigned layer) ;
void printMany(unsigned length, unsigned printData[]);



void connectChanend(chanend c, endpoint dest) ;

void freeChanend_sjh(chanend c) ;
endpoint chanendListen(chanend c) ;


void coreSendWords(streaming chanend output, unsigned data[], unsigned length) ;
unsigned coreReceiveWords(streaming chanend input, unsigned data_buffer[]) ;
void coreSendBytes(streaming chanend output, char data[], unsigned data_length) ;


void SwPrintUnsigned(streaming chanend output, unsigned value) ;
void SwPrintString(streaming chanend output, const char string[]) ;
# 4 "Power_Measure_Lib.xc" 2
# 1 "xclib.h" 1 3
# 35 "xclib.h" 3
unsigned bitrev(unsigned x);
# 46 "xclib.h" 3
unsigned byterev(unsigned x);
# 59 "xclib.h" 3
int clz(unsigned x);
# 5 "Power_Measure_Lib.xc" 2
# 1 "print.h" 1 3
# 34 "print.h" 3
int printchar(char value);
# 40 "print.h" 3
int printcharln(char value);
# 46 "print.h" 3
int printint(int value);
# 52 "print.h" 3
int printintln(int value);
# 58 "print.h" 3
int printuint(unsigned value);
# 64 "print.h" 3
int printuintln(unsigned value);
# 70 "print.h" 3
int printllong(long long value);
# 76 "print.h" 3
int printllongln(long long value);
# 82 "print.h" 3
int printullong(unsigned long long value);
# 88 "print.h" 3
int printullongln(unsigned long long value);
# 95 "print.h" 3
int printhex(unsigned value);
# 102 "print.h" 3
int printhexln(unsigned value);
# 109 "print.h" 3
int printllonghex(unsigned long long value);
# 116 "print.h" 3
int printllonghexln(unsigned long long value);
# 122 "print.h" 3
int printstr(const char s[]);
# 128 "print.h" 3
int printstrln(const char s[]);
# 6 "Power_Measure_Lib.xc" 2

out port sclk =  0x10900  ;
out port cs_n =  0x10700  ;
out port adc_address =  0x80200  ;
in buffered port:32 din_a =  0x10600  ;
in buffered port:32 din_b =  0x10200  ;

__clock_t  sclk_clk =  0x106  ;

out port r_wn =  0x10800  ;
out port core2led =  0x10a00  ;
# 47 "Power_Measure_Lib.xc"
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


	configure_clock_rate(sclk_clk, 5, 1) ;
	configure_out_port(cs_n, sclk_clk, 1) ;
	configure_out_port(adc_address, sclk_clk, 2) ;
	configure_in_port(din_a, sclk_clk) ;
	configure_in_port(din_b, sclk_clk) ;

	configure_port_clock_output(sclk, sclk_clk) ;

	running = 0 ;
	toDo = 0 ;

	sampleCount = 0 ;
	samplesLeft = 0 ;

	__builtin_start_clock(sclk_clk)  ;

	while (1)
	{
	select
	{
		case control :> toDo :
		{
			if (toDo ==  1 )
			{
				printer[0] = 0xdeadbeef;

				V_T= 0 ; V_MT = 0 ; V_MB = 0; V_B = 0 ; V_IO = 0 ; V_DRAM = 0 ;
				I_T= 0 ; I_MT = 0 ; I_MB = 0; I_B = 0 ; I_IO = 0 ; I_DRAM = 0 ;
				sampleCount = 0 ;
				running = 1 ;
				sampling = 0 ;
			}
			else if (toDo ==  3 )
			{

				V_T= 0 ; V_MT = 0 ; V_MB = 0; V_B = 0 ; V_IO = 0 ; V_DRAM = 0 ;
				I_T= 0 ; I_MT = 0 ; I_MB = 0; I_B = 0 ; I_IO = 0 ; I_DRAM = 0 ;
				sampleCount = 0 ;
				control :> samplesLeft ;
				running = 0 ;
				sampling = 1 ;
			}
			else if (toDo ==  2 )
			{
				printer[0] = 0xbabeface;

				running = 0 ;
				sampling = 0 ;
				toDo =  10 ;
			}
			break ;
		}


		default:
			if (running == 1 || sampling == 1)
			{
				for (unsigned address = 0 ; address < 6 ; address++)
				{
					adc_address <: address ;
					cs_n <: 1 @ cs_time ;
					cs_time += 10 ;
					cs_endtime = cs_time + 16 ;
					cs_n @ cs_time <: 0 ;
# 212 "Power_Measure_Lib.xc"
					cs_n @ cs_endtime <: 1 ;
					din_a @ (cs_endtime - 2) :> dataA ;
					din_b @ cs_endtime :> dataB ;
# 223 "Power_Measure_Lib.xc"
					dataA =  __builtin_bitrev(dataA)  & 0xfff ;
					dataB =  __builtin_bitrev(dataB << 2)  & 0xfff ;


					switch (address) {

						case 0:

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
					toDo =  10  ;
					sampling =0;
				}

			}

				if (toDo ==  10 )
				{
					printer[0] = 0xfadebeef;
					printer[1] = sampleCount;

					control <: sampleCount ;
					control <: (V_T *  625 ) >> 10 ;
					control <: (I_T *  625 ) >> 11 ;
					control <: (V_MT *  625 ) >> 10 ;
					control <: (I_MT *  625 ) >> 11 ;
					control <: (V_MB *  625 ) >> 10 ;
					control <: (I_MB *  625 ) >> 11 ;
					control <: (V_B *  625 ) >> 10 ;
					control <: (I_B *  625 ) >> 11 ;
					control <: (V_IO *  625 ) >> 10 ;
					control <: (I_IO *  625 ) >> 11 ;
					control <: (V_DRAM *  625 ) >> 10 ;
					control <: (I_DRAM *  625 ) >> 11 ;

					toDo =  0  ;
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
# 328 "Power_Measure_Lib.xc"
	control <: (char)  3  ;
	control <: 1024 ;

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




void doWorkDiv(unsigned divider)
{
	write_pswitch_reg(get_local_tile_id(),  6 , divider);
	__builtin_setps( 0x20b , 0x10) ;

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
	write_pswitch_reg(get_local_tile_id(),  6 , divider);
	__builtin_setps( 0x20b , 0x10) ;
	leds <: divider ;
	asm("waiteu") ;
}
