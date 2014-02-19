# 1 "scmain_14.xc"
# 3 "scmain_14.xc"
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
# 4 "scmain_14.xc" 2
# 1 "xs1.h" 1 3
# 5 "scmain_14.xc" 2
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
# 6 "scmain_14.xc" 2
# 1 "math.h" 1 3
# 6 "math.h" 3
# 1 "sys/reent.h" 1 3
# 13 "sys/reent.h" 3
# 1 "_ansi.h" 1 3
# 15 "_ansi.h" 3
# 1 "newlib.h" 1 3
# 16 "_ansi.h" 2 3
# 1 "sys/config.h" 1 3
# 4 "sys/config.h" 3
# 1 "machine/ieeefp.h" 1 3
# 5 "sys/config.h" 2 3
# 17 "_ansi.h" 2 3
# 14 "sys/reent.h" 2 3
# 1 "sys/_types.h" 1 3
# 12 "sys/_types.h" 3
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
# 15 "sys/reent.h" 2 3






typedef unsigned  long  __ULong;
# 7 "math.h" 2 3
# 1 "machine/ieeefp.h" 1 3
# 8 "math.h" 2 3
# 1 "_ansi.h" 1 3
# 9 "math.h" 2 3



union __dmath
{
  __ULong i[2];
  double d;
};

union __fmath
{
  __ULong i[1];
  float f;
};

union __ldmath
{
  __ULong i[4];
  long double  ld;
};
# 67 "math.h" 3
  extern   const union __dmath __infinity[];




  extern   const union __fmath __infinityf[];




  extern   const union __ldmath __infinityld[];








extern double atan  (double) ;
extern double cos  (double) ;
extern double sin  (double) ;
extern double tan  (double) ;
extern double tanh  (double) ;
# 95 "math.h" 3
extern double ceil  (double) ;
extern double fabs  (double) ;
extern double floor  (double) ;





extern double acos  (double) ;
extern double asin  (double) ;
extern double atan2  (double, double) ;
extern double cosh  (double) ;
extern double sinh  (double) ;
extern double exp  (double) ;
extern double ldexp  (double, int) ;
extern double log  (double) ;
extern double log10  (double) ;
extern double pow  (double, double) ;
extern double sqrt  (double) ;
extern double fmod  (double, double) ;








typedef float float_t;
typedef double double_t;
# 150 "math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 213 "math.h" 3
extern double infinity  (void) ;
# 217 "math.h" 3
extern int finite  (double) ;
extern double copysign  (double, double) ;
extern int ilogb  (double) ;

extern double asinh  (double) ;
extern double cbrt  (double) ;
extern double nextafter  (double, double) ;
extern double rint  (double) ;
extern double scalbn  (double, int) ;

extern double exp2  (double) ;
extern double scalbln  (double, long int) ;
extern double tgamma  (double) ;
extern double nearbyint  (double) ;
extern long int lrint  (double) ;
extern  long long  int llrint  (double) ;
extern double round  (double) ;
extern long int lround  (double) ;
extern double trunc  (double) ;
# 239 "math.h" 3
extern double copysign  (double, double) ;
extern double fdim  (double, double) ;
extern double fmax  (double, double) ;
extern double fmin  (double, double) ;
extern double fma  (double, double, double) ;


extern double log1p  (double) ;
extern double expm1  (double) ;


extern double acosh  (double) ;
extern double atanh  (double) ;
extern double remainder  (double, double) ;
extern double gamma  (double) ;
extern double lgamma  (double) ;
extern double erf  (double) ;
extern double erfc  (double) ;



extern double hypot  (double, double) ;




extern float atanf  (float) ;
extern float cosf  (float) ;
extern float sinf  (float) ;
extern float tanf  (float) ;
extern float tanhf  (float) ;
# 276 "math.h" 3
extern float ceilf  (float) ;
extern float fabsf  (float) ;
extern float floorf  (float) ;

extern float acosf  (float) ;
extern float asinf  (float) ;
extern float atan2f  (float, float) ;
extern float coshf  (float) ;
extern float sinhf  (float) ;
extern float expf  (float) ;
extern float ldexpf  (float, int) ;
extern float logf  (float) ;
extern float log10f  (float) ;
extern float powf  (float, float) ;
extern float sqrtf  (float) ;
extern float fmodf  (float, float) ;



extern float exp2f  (float) ;
extern float scalblnf  (float, long int) ;
extern float tgammaf  (float) ;
extern float nearbyintf  (float) ;
extern long int lrintf  (float) ;
extern  long long  llrintf  (float) ;
extern float roundf  (float) ;
extern long int lroundf  (float) ;
extern float truncf  (float) ;
# 307 "math.h" 3
extern float copysignf  (float, float) ;
extern float fdimf  (float, float) ;
extern float fmaxf  (float, float) ;
extern float fminf  (float, float) ;
extern float fmaf  (float, float, float) ;

extern float infinityf  (void) ;
# 317 "math.h" 3
extern int isnanf  (float) ;
extern int isinff  (float) ;
extern int finitef  (float) ;
extern float copysignf  (float, float) ;
extern int ilogbf  (float) ;

extern float asinhf  (float) ;
extern float cbrtf  (float) ;
extern float nextafterf  (float, float) ;
extern float rintf  (float) ;
extern float scalbnf  (float, int) ;
extern float log1pf  (float) ;
extern float expm1f  (float) ;

extern float acoshf  (float) ;
extern float atanhf  (float) ;
extern float remainderf  (float, float) ;
extern float gammaf  (float) ;
extern float lgammaf  (float) ;
extern float erff  (float) ;
extern float erfcf  (float) ;

extern float hypotf  (float, float) ;


extern  long double  rintl  ( long double ) ;
extern long int lrintl  ( long double ) ;
extern  long long  llrintl  ( long double ) ;





extern double cabs();
extern double drem  (double, double) ;
# 359 "math.h" 3
extern double y0  (double) ;
extern double y1  (double) ;
extern double yn  (int, double) ;
extern double j0  (double) ;
extern double j1  (double) ;
extern double jn  (int, double) ;

extern float cabsf();
extern float dremf  (float, float) ;
# 375 "math.h" 3
extern float y0f  (float) ;
extern float y1f  (float) ;
extern float ynf  (int, float) ;
extern float j0f  (float) ;
extern float j1f  (float) ;
extern float jnf  (int, float) ;



extern double exp10  (double) ;


extern double pow10  (double) ;


extern float exp10f  (float) ;


extern float pow10f  (float) ;
# 468 "math.h" 3
enum __fdlibm_version
{
  __fdlibm_ieee = -1,
  __fdlibm_svid,
  __fdlibm_xopen,
  __fdlibm_posix
};




extern    enum __fdlibm_version   __fdlib_version ;









# 7 "scmain_14.xc" 2
# 1 "stdlib.h" 1 3
# 10 "stdlib.h" 3
# 1 "_ansi.h" 1 3
# 11 "stdlib.h" 2 3
# 14 "stdlib.h" 3
# 1 "stddef.h" 1 3
# 214 "stddef.h" 3
typedef  unsigned int  size_t;
# 326 "stddef.h" 3
typedef  unsigned char  wchar_t;
# 15 "stdlib.h" 2 3
# 19 "stdlib.h" 3
# 1 "machine/stdlib.h" 1 3
# 20 "stdlib.h" 2 3
# 21 "stdlib.h" 3
# 1 "alloca.h" 1 3
# 22 "stdlib.h" 2 3
# 28 "stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 59 "stdlib.h" 3
extern   int __mb_cur_max;



void   abort ( void ) ;
int  abs (int) ;
# 72 "stdlib.h" 3
int  atoi (const char __nptr[]) ;
long  atol (const char __nptr[]) ;
# 82 "stdlib.h" 3
div_t  div (int __numer, int __denom) ;
void   exit (int __status) ;
# 89 "stdlib.h" 3
long  labs (long) ;
ldiv_t  ldiv (long __numer, long __denom) ;
# 109 "stdlib.h" 3
int  rand ( void ) ;
# 113 "stdlib.h" 3
void   srand (unsigned __seed) ;
# 127 "stdlib.h" 3
int  system (const char __string[]) ;
# 134 "stdlib.h" 3
void   _Exit (int __status) ;
# 154 "stdlib.h" 3
long  jrand48 (unsigned short [3]) ;
void   lcong48 (unsigned short [7]) ;
long  lrand48 ( void ) ;
long  mrand48 ( void ) ;
long  nrand48 (unsigned short [3]) ;
# 163 "stdlib.h" 3
void   srand48 (long) ;
# 195 "stdlib.h" 3

# 8 "scmain_14.xc" 2
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
# 9 "scmain_14.xc" 2
# 1 "Swallow-nOS_asm.h" 1
# 16 "Swallow-nOS_asm.h"
enum nOS_action {nOS_allocateNewChannel_action, nOS_connectNewChannel_action, nOS_getChannelDest_action, nOS_updateChannelDest_action, nOS_releaseChannel_action, nOS_lookupChanend_action, nOS_createThread_action, nOS_getThreadStatus_action } ;
typedef struct chanMapping {unsigned chanID; } chanMapping ;

unsigned nOS_createThread(unsigned parentID, unsigned startAddress, unsigned childRank, unsigned stacks[ 5 ][ 2048 ]) ;
void nOS_waitForEvent() ;
void nOS_disableAllEvents() ;
unsigned nOS_getEventID() ;



void nOS_listenForAction(channel c, unsigned stacks[ 5 ][ 2048 ], chanMapping chanMap[ 5 ][ 24 ]) ;
unsigned nOS_requestAction(endpoint dest, unsigned action, unsigned arg1, unsigned arg2, unsigned arg3) ;
void nOS_addEventHandler(channel c, unsigned handler) ;
void nOS_disableEvent(channel c) ;
void nOS_setChannelDest(channel c, unsigned dest) ;
void printManyC(channel printChannel, unsigned length, unsigned data[]) ;
unsigned GetLock() ;
void ClaimLock(unsigned l) ;
void FreeLock(unsigned l) ;
void FreerLock(unsigned l) ;
# 10 "scmain_14.xc" 2
# 1 "Swallow-nOS.h" 1
# 20 "Swallow-nOS.h"
# 1 "Swallow-helpers.h" 1
# 21 "Swallow-nOS.h" 2
# 1 "Swallow-nOS_asm.h" 1
# 22 "Swallow-nOS.h" 2




void startSync( unsigned  c_out);
void sinkSync( unsigned  c, unsigned shouldIrun);
void nOS_start( unsigned  c_in, unsigned  c_out, unsigned initialFreqDivider) ;



void addNewChanMapEntry(chanMapping chanMap[ 5 ][ 24 ], channel c, unsigned owner, unsigned index) ;
channel lookupChanMapEntry(chanMapping chanMap[ 5 ][ 24 ], unsigned owner, unsigned index) ;
void deleteChanMapEntry(chanMapping chanMap[ 5 ][ 24 ], unsigned owner, unsigned index) ;
unsigned nOS_doAction(unsigned action, unsigned arg1, unsigned arg2, unsigned arg3, unsigned stacks[ 5 ][ 2048 ], chanMapping chanMap[ 5 ][ 24 ]) ;

void begin1(unsigned parentID, unsigned rank) ;
void begin2(unsigned parentID, unsigned rank) ;
void begin3(unsigned parentID, unsigned rank) ;

void select1B(chanend c1, chanend c2) ;
# 53 "Swallow-nOS.h"
static inline void printOne(unsigned value);
# 11 "scmain_14.xc" 2
# 1 "Swallow-nOS_client.h" 1
# 11 "Swallow-nOS_client.h"
# 1 "Swallow-helpers.h" 1
# 12 "Swallow-nOS_client.h" 2


void p1(chanend c) ;
# 19 "Swallow-nOS_client.h"
void child1(unsigned parentid);

unsigned client_createThread(unsigned threadIdentifier, unsigned stackSize, unsigned childRank, unsigned tileIndex) ;
unsigned client_createThreadDynamic(unsigned startAddress,unsigned childRank,unsigned depth, unsigned go_deeper,unsigned coreNo);
unsigned client_createThreadRandom(unsigned startAddress, unsigned childRank,unsigned min,unsigned max);
channel client_connectNewLocalChannel(unsigned channelIndex, endpoint destination) ;
channel client_allocateNewLocalChannel(unsigned channelIndex) ;
endpoint client_getLocalChannelDest(unsigned channelIndex) ;
void client_updateLocalChannelDest(unsigned channelIndex, endpoint destination) ;
void client_releaseLocalChannel(unsigned channelIndex) ;
endpoint client_lookupLocalChanend(unsigned channelIndex) ;
endpoint client_lookupParentChanend(unsigned parentID, unsigned channelIndex) ;
endpoint client_lookupSpecificChanend(unsigned tileID, unsigned thread_no, unsigned channelIndex);
unsigned client_getThreadStatus(unsigned tileIndex) ;
# 12 "scmain_14.xc" 2
# 1 "Swallow-nOS_initialFunctions.h" 1
# 11 "Swallow-nOS_initialFunctions.h"
unsigned getStartAddress(unsigned index) ;
void installHandlerToFoo(unsigned c) ;
unsigned nOS_getEventID() ;

void select1A(unsigned c1, unsigned c2) ;
# 13 "scmain_14.xc" 2
# 1 "Swallow-prim.h" 1
# 17 "Swallow-prim.h"
void prim_main( unsigned  c_in, unsigned shouldIRun,  unsigned  control_channel);
void xc_listen_check_wall(unsigned parentCommunicationChannel, unsigned rank,  unsigned  north, unsigned  east, unsigned  south, unsigned  west, unsigned  com_channel, unsigned  consensus_channel);
void xc_prim_child_root(unsigned rank,  unsigned  com_channel);
void setFreqDivider(unsigned divider,unsigned rank);
void send_word( unsigned  id, unsigned value);
void consensus(unsigned rank,  unsigned  north, unsigned  east, unsigned  south, unsigned  west, unsigned  self_channel);
unsigned tally_votes(unsigned status[],unsigned flags[],unsigned rank);
void xc_getCompletedSignal( unsigned  child_channels[]);
select getValue( unsigned  child_channel,unsigned hi);
void submit_votes(unsigned rank,  unsigned  north,  unsigned  east,  unsigned  south,  unsigned  west, unsigned  consensus_channel, unsigned  self_channel);
void pass_func( unsigned  parentCommunicationChannel,unsigned rank, unsigned  north_connection, unsigned  east_connection, unsigned  south_connection, unsigned  west_connection, unsigned  siblingCommunicationChannel_north, unsigned  siblingCommunicationChannel_east, unsigned  siblingCommunicationChannel_south, unsigned  siblingCommunicationChannel_west, unsigned  consensus_channel);
unsigned exor(unsigned vis1, unsigned vis2, unsigned num_touched);
# 43 "Swallow-prim.h"
static inline void printOne(unsigned value);
void prim_child(unsigned parent_id, unsigned rank);
unsigned xc_check_maze(unsigned in_var,unsigned visited[][ 16 / 2 ],unsigned rank,unsigned north,unsigned east,unsigned south,unsigned west);
unsigned xc_check_edge(unsigned rank, unsigned in_var,unsigned north,unsigned east,unsigned south,unsigned west);
void delay_execution(unsigned delay);





extern unsigned core_list_prim[ 4 ];
# 14 "scmain_14.xc" 2
# 1 "blur.h" 1
# 12 "blur.h"
void xc_printPower(chanend powerChannel);



void blur_main( unsigned  c_in, unsigned shouldIRun,  unsigned  control_channel);
# 25 "blur.h"
void blur_child(unsigned parent_id, unsigned rank) ;
# 15 "scmain_14.xc" 2
# 1 "Power_Measure_Lib.h" 1
# 20 "Power_Measure_Lib.h"
void pintest(void);
void doWork(void) ;
void doWork4(void);
void doIdle(void);
void powerMeasure( unsigned  control);
void powerMeasureServer( unsigned  control);





void doWork(void);
# 16 "scmain_14.xc" 2
# 1 "Swallow-sobel.h" 1
# 15 "Swallow-sobel.h"
void sobel_main( unsigned  c_in, unsigned shouldIRun,  unsigned  control_channel);



void xc_sobelSelect(chanend c[],unsigned processed_image[][ 4 +2]);
# 25 "Swallow-sobel.h"
void sobel_child(unsigned parent_id, unsigned rank) ;
void sobel_pchild(unsigned parent_id, unsigned rank) ;






extern unsigned core_list_sobel[ 6 ];
# 17 "scmain_14.xc" 2
# 18 "scmain_14.xc"
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
# 26 "sys/types.h" 2 3
# 61 "sys/types.h" 3
# 1 "sys/_types.h" 1 3
# 62 "sys/types.h" 2 3
# 69 "sys/types.h" 3
# 1 "stddef.h" 1 3
# 152 "stddef.h" 3
typedef  int  ptrdiff_t;
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

# 19 "scmain_14.xc" 2
# 1 "swallow_comms.h" 1
# 65 "swallow_comms.h"
extern unsigned sw_nrows, sw_ncols;
# 113 "swallow_comms.h"
void io_redirect(void);
void xmp16Assert(unsigned assertion);
unsigned getChanend(unsigned dst);
void setDestination( unsigned  c, unsigned dst);
unsigned getLocalAnonChanend();
unsigned write_sswitch_reg_no_ack_clean(unsigned node, unsigned reg, unsigned val);
unsigned write_sswitch_reg_clean(unsigned node, unsigned reg, unsigned val);
void closeChanend( unsigned  c);
void freeChanend(unsigned c);
unsigned inUint(unsigned c);
void outUint(unsigned c, unsigned val);
unsigned char inByte(unsigned c);
void outByte(unsigned c, unsigned char val);
void ledOut(unsigned v);
unsigned getRemoteChanendId( unsigned  c);
unsigned getLocalChanendId( unsigned  c);
int _write_intercept_asm(unsigned notused, char buf[], unsigned len);
# 20 "scmain_14.xc" 2


void __initLinks()
{
  unsigned c, sync;

  io_redirect();

  sync = getChanend(( 0x8001  << 16) | 0xff02);

  asm("in %0,res[%1]":"=r"(sw_nrows):"r"(sync));
  asm("in %0,res[%1]":"=r"(sw_ncols):"r"(sync));



  c = getChanend( (( (((0xd0202 >> 16)/(sw_ncols) << ( ( ( 0 + 1 ) + 1 ) + 6 ) ) | ((0xd0202 >> 16)%(sw_ncols) << ( 0 + 1 ) )) << 16) | (0xd0202 & 0xffff)) );
  asm("ecallf %0"::"r"(c));
  c = getChanend( (( (((0xf0102 >> 16)/(sw_ncols) << ( ( ( 0 + 1 ) + 1 ) + 6 ) ) | ((0xf0102 >> 16)%(sw_ncols) << ( 0 + 1 ) )) << 16) | (0xf0102 & 0xffff)) );
  asm("ecallf %0"::"r"(c));

  asm("chkct res[%0],1"::"r"(sync));
  return;
}









int main(void)
{
  unsigned ctrl_data;
  __initLinks();
# 72 "scmain_14.xc"
  par
  {
    nOS_start( (( (((0x000e0102 >> 16)/(sw_ncols) << ( ( ( 0 + 1 ) + 1 ) + 6 ) ) | ((0x000e0102 >> 16)%(sw_ncols) << ( 0 + 1 ) )) << 16) | (0x000e0102 & 0xffff)) , (( (((0x000e0202 >> 16)/(sw_ncols) << ( ( ( 0 + 1 ) + 1 ) + 6 ) ) | ((0x000e0202 >> 16)%(sw_ncols) << ( 0 + 1 ) )) << 16) | (0x000e0202 & 0xffff)) ,0);

  }
# 93 "scmain_14.xc"
  asm("freet"::);
  return 0;
}
