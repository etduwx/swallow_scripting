# 1 "Swallow-helpers.xc"
# 7 "Swallow-helpers.xc"
# 1 "string.h" 1 3
# 10 "string.h" 3
# 1 "_ansi.h" 1 3
# 15 "_ansi.h" 3
# 1 "newlib.h" 1 3
# 16 "_ansi.h" 2 3
# 1 "sys/config.h" 1 3
# 4 "sys/config.h" 3
# 1 "machine/ieeefp.h" 1 3
# 5 "sys/config.h" 2 3
# 17 "_ansi.h" 2 3
# 11 "string.h" 2 3
# 17 "string.h" 3
# 1 "stddef.h" 1 3
# 214 "stddef.h" 3
typedef  unsigned int  size_t;
# 18 "string.h" 2 3






# 34 "string.h" 3
int  strcmp (const char __s1[], const char __s2[]) ;
# 39 "string.h" 3
size_t  strcspn (const char __s1[], const char __s2[]) ;
# 43 "string.h" 3
size_t  strlen (const char __s[]) ;
# 47 "string.h" 3
int  strncmp (const char __s1[], const char __s2[], size_t) ;
# 53 "string.h" 3
size_t  strspn (const char __s1[], const char __s2[]) ;
# 114 "string.h" 3

# 8 "Swallow-helpers.xc" 2
# 1 "platform.h" 1 3
# 21 "platform.h" 3
# 1 "/home/sld-user/swallow/swallow_scripting/src-back/ccqyqgkm.h" 1
# 4 "/home/sld-user/swallow/swallow_scripting/src-back/ccqyqgkm.h"
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
# 5 "/home/sld-user/swallow/swallow_scripting/src-back/ccqyqgkm.h" 2
# 13 "/home/sld-user/swallow/swallow_scripting/src-back/ccqyqgkm.h"
extern core stdcore[1];
# 22 "platform.h" 2 3
# 9 "Swallow-helpers.xc" 2
# 1 "stdio.h" 1 3
# 29 "stdio.h" 3
# 1 "_ansi.h" 1 3
# 30 "stdio.h" 2 3
# 34 "stdio.h" 3
# 1 "stddef.h" 1 3
# 35 "stdio.h" 2 3
# 51 "stdio.h" 3
# 1 "sys/types.h" 1 3
# 20 "sys/types.h" 3
# 1 "_ansi.h" 1 3
# 21 "sys/types.h" 2 3
# 25 "sys/types.h" 3
# 1 "machine/_types.h" 1 3
# 7 "machine/_types.h" 3
# 1 "machine/_default_types.h" 1 3
# 22 "machine/_default_types.h" 3
# 1 "limits.h" 1 3
# 4 "limits.h" 3
# 1 "newlib.h" 1 3
# 5 "limits.h" 2 3
# 24 "limits.h" 3
# 1 "sys/config.h" 1 3
# 25 "limits.h" 2 3
# 23 "machine/_default_types.h" 2 3



typedef signed char __int8_t ;
typedef unsigned char __uint8_t ;








typedef signed short __int16_t;
typedef unsigned short __uint16_t;
# 46 "machine/_default_types.h" 3
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
# 58 "machine/_default_types.h" 3
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
# 76 "machine/_default_types.h" 3
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
# 99 "machine/_default_types.h" 3
typedef signed long long __int64_t;
typedef unsigned long long __uint64_t;
# 8 "machine/_types.h" 2 3
# 26 "sys/types.h" 2 3
# 61 "sys/types.h" 3
# 1 "sys/_types.h" 1 3
# 12 "sys/_types.h" 3
# 1 "machine/_types.h" 1 3
# 13 "sys/_types.h" 2 3
# 1 "sys/lock.h" 1 3



typedef int _LOCK_T;
typedef struct {
  int _owner;
  int _count;
} _LOCK_RECURSIVE_T;
# 14 "sys/_types.h" 2 3


typedef long _off_t;







typedef short __dev_t;




typedef unsigned short __uid_t;


typedef unsigned short __gid_t;
# 45 "sys/_types.h" 3
typedef long _fpos_t;
# 57 "sys/_types.h" 3
typedef int _ssize_t;
# 64 "sys/_types.h" 3
# 1 "stddef.h" 1 3
# 355 "stddef.h" 3
typedef  unsigned int  wint_t;
# 65 "sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;
# 62 "sys/types.h" 2 3
# 69 "sys/types.h" 3
# 1 "stddef.h" 1 3
# 152 "stddef.h" 3
typedef  int  ptrdiff_t;
# 326 "stddef.h" 3
typedef  unsigned char  wchar_t;
# 70 "sys/types.h" 2 3
# 1 "machine/types.h" 1 3
# 19 "machine/types.h" 3
typedef long int __off_t;
typedef int __pid_t;



typedef long int __loff_t;
# 71 "sys/types.h" 2 3
# 92 "sys/types.h" 3
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef  unsigned long  clock_t;




typedef  long  time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
# 135 "sys/types.h" 3
typedef unsigned short ino_t;
# 164 "sys/types.h" 3
typedef _off_t off_t;
typedef __dev_t dev_t;
typedef __uid_t uid_t;
typedef __gid_t gid_t;


typedef int pid_t;

typedef long key_t;

typedef _ssize_t ssize_t;
# 188 "sys/types.h" 3
typedef unsigned int mode_t  ;




typedef unsigned short nlink_t;
# 215 "sys/types.h" 3
typedef long fd_mask;
# 223 "sys/types.h" 3
typedef struct _types_fd_set {
	fd_mask fds_bits[ ((( 64 )+(( (sizeof (fd_mask) * 8 ) )-1))/( (sizeof (fd_mask) * 8 ) )) ];
} _types_fd_set;
# 246 "sys/types.h" 3
typedef  unsigned long  clockid_t;




typedef  unsigned long  timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;
# 258 "sys/types.h" 3
# 1 "sys/features.h" 1 3
# 259 "sys/types.h" 2 3
# 52 "stdio.h" 2 3


# 183 "stdio.h" 3
int  printf (const char format[], ...) ;
# 185 "stdio.h" 3
int  scanf (const char format[], ...) ;
# 187 "stdio.h" 3
int  sscanf (const char str[], const char format[], ...) ;
# 202 "stdio.h" 3
int  getchar (void) ;
# 207 "stdio.h" 3
int  putchar (int) ;
int  puts (const char _s[]) ;
# 230 "stdio.h" 3
void  perror (const char _s[]) ;
# 234 "stdio.h" 3
int  sprintf (char str[], const char format[], ...) ;
# 236 "stdio.h" 3
int  remove (const char _file[]) ;
int  rename (const char _from[], const char _to[]) ;
# 257 "stdio.h" 3
int  diprintf (int, const char format[], ...) ;
# 260 "stdio.h" 3
int  fcloseall ( void ) ;
# 267 "stdio.h" 3
int  iprintf (const char format[], ...) ;
# 269 "stdio.h" 3
int  iscanf (const char format[], ...) ;
# 271 "stdio.h" 3
int  siprintf (char str[], const char format[], ...) ;
# 273 "stdio.h" 3
int  siscanf (const char str[], const char format[], ...) ;
# 275 "stdio.h" 3
int  snprintf (char str[], size_t, const char format[], ...) ;
# 277 "stdio.h" 3
int  sniprintf (char str[], size_t, const char format[], ...) ;
# 610 "stdio.h" 3

# 10 "Swallow-helpers.xc" 2
# 1 "xscope.h" 1 3
# 37 "xscope.h" 3
typedef enum {
  XSCOPE_STARTSTOP=1,
  XSCOPE_CONTINUOUS,
  XSCOPE_DISCRETE,
  XSCOPE_STATEMACHINE,
} xscope_EventType;


typedef enum {
  XSCOPE_NONE=0,
  XSCOPE_UINT,
  XSCOPE_INT,
  XSCOPE_FLOAT,
} xscope_UserDataType;


typedef enum {
  XSCOPE_IO_NONE=0,
  XSCOPE_IO_BASIC,
  XSCOPE_IO_TIMED,
} xscope_IORedirectionMode;
# 66 "xscope.h" 3
void xscope_config_uart(port id);
# 75 "xscope.h" 3
void xscope_config_io(xscope_IORedirectionMode mode);
# 93 "xscope.h" 3
void xscope_register(int num_probes, ...);

void xscope_set_register_location(int location);
# 102 "xscope.h" 3
void xscope_probe(unsigned char id);
# 109 "xscope.h" 3
void xscope_probe_cpu(unsigned char id);
# 117 "xscope.h" 3
void xscope_probe_data(unsigned char id, unsigned int data);
# 125 "xscope.h" 3
void xscope_probe_cpu_data(unsigned char id, unsigned int data);
# 134 "xscope.h" 3
void xscope_probe_data_pred(unsigned char id, unsigned int data);
# 11 "Swallow-helpers.xc" 2
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
# 12 "Swallow-helpers.xc" 2
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
# 13 "Swallow-helpers.xc" 2
# 15 "Swallow-helpers.xc"
# 1 "swallow_comms.h" 1
# 65 "swallow_comms.h"
extern unsigned sw_nrows, sw_ncols;
# 92 "swallow_comms.h"
int startTransactionClient(streaming chanend c, unsigned dst, char format, unsigned length);
void endTransactionClient(streaming chanend c);
# 94 "swallow_comms.h"
#pragma select handler
void startTransactionServer(streaming chanend c, unsigned &dst, unsigned &format, unsigned &length);
void endTransactionServer(streaming chanend c);
# 97 "swallow_comms.h"
#pragma select handler
void startBurstServer(streaming chanend c, unsigned &dst, unsigned &format, unsigned &length);
void endBurstServer(streaming chanend c);
int startBurstClient(streaming chanend c, unsigned dst, char format, unsigned length);
void endBurstClient(streaming chanend c);

int startnOSBurstClient(unsigned c, unsigned dst, char format, unsigned length);
void endnOSBurstClient(unsigned c);

void fixupStreamingChanNode(streaming chanend c);

unsigned getLocalStreamingChanendId(streaming chanend c);
unsigned getRemoteStreamingChanendId(streaming chanend c);



void io_redirect(void);
void xmp16Assert(unsigned assertion);
unsigned getChanend(unsigned dst);
void setDestination(chanend c, unsigned dst);
unsigned getLocalAnonChanend();
unsigned write_sswitch_reg_no_ack_clean(unsigned node, unsigned reg, unsigned val);
unsigned write_sswitch_reg_clean(unsigned node, unsigned reg, unsigned val);
void closeChanend(chanend c);
void freeChanend(unsigned c);
unsigned inUint(unsigned c);
void outUint(unsigned c, unsigned val);
unsigned char inByte(unsigned c);
void outByte(unsigned c, unsigned char val);
void ledOut(unsigned v);
unsigned getRemoteChanendId(chanend c);
unsigned getLocalChanendId(chanend c);
int _write_intercept_asm(unsigned notused, char buf[], unsigned len);
# 16 "Swallow-helpers.xc" 2
# 30 "Swallow-helpers.xc"
unsigned rowColToNodeId(unsigned row, unsigned column, unsigned layer)
{
	unsigned id ;


	id = row *  5  * 4 ;
	id += 2 * column ;
	id += layer ;
	id = id << 16 ;
	return  (( (((id >> 16)/(sw_ncols) << ( ( ( 0 + 1 ) + 1 ) + 6 ) ) | ((id >> 16)%(sw_ncols) << ( 0 + 1 ) )) << 16) | (id & 0xffff))  >> 16 ;
}

void printMany(unsigned length, unsigned printData[])
{
	timer t;
  	unsigned tv;
	unsigned ch;
ch = 0;

while(ch==0){

  asm("getr %0, 2" : "=r"(ch) : ) ;
}



for(unsigned i=0;i<length;i++){

  	t :> tv;
    	tv += 0x00004000;
    	t when  __builtin_timer_after(tv)  :> void;

    startnOSBurstClient(ch,0x80010502,4,1);
    __asm__ __volatile__("out res[%0],%1"::"r"(ch),"r"(printData[i]));  ;
    endnOSBurstClient(ch);

}
__asm__ __volatile__("freer res[%0]": :"r"(ch)); ;
}


unsigned nodeIndexToId(unsigned node)
{
	return  (( (((node << 16 >> 16)/(sw_ncols) << ( ( ( 0 + 1 ) + 1 ) + 6 ) ) | ((node << 16 >> 16)%(sw_ncols) << ( 0 + 1 ) )) << 16) | (node << 16 & 0xffff))  ;
}



endpoint buildChanId(unsigned node, unsigned chanIndex)
{
	node = nodeIndexToId(node) ;
	return (node) | (chanIndex << 8) | 0x2 ;
}





channel getNewChannel()
{
	channel localEndpoint ;
	asm("getr %0, 0x2" : "=r" (localEndpoint) : ) ;
	return localEndpoint ;
}



void connectChanend(chanend c, endpoint dest)
{
	asm("setd res[%0], %1" : : "r"(c) , "r"(dest)) ;
	asm("outct res[%0], 0x1" : : "r"(c)) ;
	asm("out res[%0], %1" : : "r"(c), "r"(c)) ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
	asm("outct res[%0], 0x1" : : "r"(c) ) ;
}


void connectChannel(channel c, endpoint dest)
{
	asm("setd res[%0], %1" : : "r"(c) , "r"(dest)) ;

	asm("out res[%0], %1" : : "r"(c), "r"(c)) ;
	asm("outct res[%0], 0x1" : : "r"(c) ) ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
}
# 128 "Swallow-helpers.xc"
void freeChanend_sjh(chanend c)
{
	asm("freer res[%0]" : : "r" (c) ) ;
}


endpoint chanendListen(chanend c)
{
	endpoint sender ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
	asm("in %0, res[%1]" : "=r"(sender) : "r"(c)) ;
	asm("setd res[%0], %1" : : "r"(c) , "r"(sender)) ;
	asm("outct res[%0], 0x1" : : "r"(c)) ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
	return sender ;
}


endpoint channelListen(channel c)
{
	endpoint sender ;

	asm("in %0, res[%1]" : "=r"(sender) : "r"(c)) ;
	asm("setd res[%0], %1" : : "r"(c) , "r"(sender)) ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
	asm("outct res[%0], 0x1" : : "r"(c)) ;
	return sender ;
}

void channelSendWord(channel c, unsigned value)
{
	asm("outct res[%0], 0x1" : : "r"(c)) ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
	asm("out res[%0], %1" : : "r"(c), "r"(value)) ;
	asm("outct res[%0], 0x1" : : "r"(c)) ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
}


unsigned channelReceiveWord(channel c)
{
	unsigned value ;
	asm("chkct res[%0], 0x1" : : "r"(c)) ;
	asm("outct res[%0], 0x1" : : "r"(c)) ;


	asm("in %0, res[%1] ; chkct res[%1], 0x1" : "=r"(value) : "r"(c)) ;

	asm("outct res[%0], 0x1" : : "r"(c)) ;
	return value ;
}



unsigned getSpecificLocalChannel(unsigned channelNo)
{
	unsigned localEndpoint = 0 ;
	unsigned tileID ;
	unsigned endpointsTried[32] ;
	unsigned desiredEndpoint ;
	int noEndpointsTried = 0 ;

	tileID = get_local_tile_id() ;

	desiredEndpoint = ((tileID << 16) | (channelNo <<8) | 0x2) ;
	while (localEndpoint != desiredEndpoint)
	{
		asm("getr r0, 0x2\n"
		"mov %0,r0\n" : "=r" (localEndpoint) : : "r0" ) ;
		endpointsTried[noEndpointsTried] = localEndpoint ;

		noEndpointsTried++ ;
	}



	noEndpointsTried -= 2 ;

	while (noEndpointsTried >= 0)
	{
		asm ("freer res[%0]" : : "r"(endpointsTried[noEndpointsTried])) ;
		noEndpointsTried -- ;
	}

	return localEndpoint ;
}


void coreSendWords(streaming chanend output, unsigned data[], unsigned data_length)
{
	startTransactionClient(output,0x80010402,0x4,data_length);
	for (int i = 0; i < data_length ; i += 1)
	{
	    output <: data[i] ;
	}
	endTransactionClient(output);

}



unsigned coreReceiveWords(streaming chanend input, unsigned receiveBuffer[])
{
	unsigned dst, format, length, value;


		    startTransactionServer(input,dst,format,length);


		    for (int i = 0; i < length; i += 1)
		    {


		    	input :> receiveBuffer[i] ;


		    }
		    endTransactionServer(input);



		    return length ;
}


void coreSendBytes(streaming chanend output, char data[], unsigned data_length)
{
	startTransactionClient(output,0x80010402,0x1,data_length);
	for (int i = 0; i < data_length ; i += 1)
	{
	    output <: data[i] ;
	}
	endTransactionClient(output);
}





void SwPrintUnsigned(streaming chanend output, unsigned value)
{
	unsigned values[1] ;
	values[0] = value ;
	coreSendWords(output, values, 1) ;
}


unsigned stringToChars(const char s[], char c[])
{
	unsigned length = 0 ;
	while (s[length] != '\0' && length <  1024  )
	{
		c[length] = s[length] ;
		length++ ;
	}
	return length ;
}


void SwPrintString(streaming chanend output, const char string[])
{
	unsigned length ;
	char charBuffer[ 1024 ] ;
	length = stringToChars(string, charBuffer) ;
	coreSendBytes(output, charBuffer, length) ;
}
