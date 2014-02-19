# 1 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c"
# 15 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c"
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 1 3 4
# 31 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_g4000b-512.h" 1 3 4
# 32 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 2 3 4





# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_user.h" 1 3 4
# 20 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_user.h" 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1b_user.h" 1 3 4
# 21 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_user.h" 2 3 4
# 38 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 2 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_kernel.h" 1 3 4
# 20 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_kernel.h" 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1b_kernel.h" 1 3 4
# 21 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_kernel.h" 2 3 4
# 39 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 2 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_registers.h" 1 3 4
# 20 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_registers.h" 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1b_registers.h" 1 3 4
# 29 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1b_registers.h" 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_g_registers.h" 1 3 4
# 30 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1b_registers.h" 2 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_l_registers.h" 1 3 4
# 31 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1b_registers.h" 2 3 4
# 21 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_registers.h" 2 3 4
# 40 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 2 3 4
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_clock.h" 1 3 4
# 39 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1_clock.h" 3 4
typedef unsigned clock;
# 41 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 2 3 4
# 1556 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
unsigned getps(unsigned reg);
# 1567 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
void setps(unsigned reg, unsigned value);
# 1590 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
int read_pswitch_reg(unsigned tileid, unsigned reg, unsigned *data);
# 1614 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
int read_sswitch_reg(unsigned tileid, unsigned reg, unsigned *data);
# 1634 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
int write_pswitch_reg(unsigned tileid, unsigned reg, unsigned data);
# 1654 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
int write_pswitch_reg_no_ack(unsigned tileid, unsigned reg, unsigned data);
# 1673 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
int write_sswitch_reg(unsigned tileid, unsigned reg, unsigned data);
# 1694 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
int write_sswitch_reg_no_ack(unsigned tileid, unsigned reg, unsigned data);
# 1927 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
unsigned get_local_tile_id(void);







unsigned get_logical_core_id(void);
# 1952 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xs1.h" 3 4
__attribute__((deprecated)) static inline unsigned get_core_id(void) {
  return get_local_tile_id();
}
__attribute__((deprecated)) static inline unsigned get_thread_id(void) {
  return __builtin_getid();
}
# 16 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c" 2
# 1 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xccompat.h" 1 3 4
# 78 "/home/sld-user/Downloads/XMOS/xTIMEcomposer/12.2.0/target/include/xccompat.h" 3 4
typedef unsigned chanend;






typedef unsigned timer;






typedef unsigned port;
# 17 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c" 2
# 1 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.h" 1
# 65 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.h"
extern unsigned sw_nrows, sw_ncols;
# 113 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms.h"
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
# 18 "/home/sld-user/swallow/sc_swallow_communication/module_swallow_comms/src/swallow_comms_c.c" 2


unsigned write_sswitch_reg_no_ack_clean(unsigned node, unsigned reg, unsigned val)
{
 unsigned ret = 0, c = getLocalAnonChanend(), d;
 freeChanend(c);
 ret = write_sswitch_reg_no_ack(node, reg, val);
 d = getLocalAnonChanend();
 if (d != c)
 {
  freeChanend(c);
 }
 freeChanend(d);
 return ret;
}


unsigned write_sswitch_reg_clean(unsigned node, unsigned reg, unsigned val)
{
 unsigned ret = 0, c = getLocalAnonChanend(), d;
 freeChanend(c);
 ret = write_sswitch_reg(node, reg, val);
 d = getLocalAnonChanend();
 if (d != c)
 {
  freeChanend(c);
 }
 freeChanend(d);
 return ret;
}

void freeChanend(unsigned c)
{
  if (c)
  {
   asm("freer res[%0]"::"r"(c));
 }
}
