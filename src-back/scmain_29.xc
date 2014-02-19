/************* CORE 29 ***************/
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
#include "blur.h"
#include "Power_Measure_Lib.h"
#include "Swallow-sobel.h"
#define NCORES (32)
#include <stdio.h>
#include "swallow_comms.h"

/* __initLinks for core 29*/
void __initLinks()
{
  unsigned c, sync;
  /* Hot-patch the I/O subroutine so that _write is replaced by _write_intercept */
  io_redirect();
  /* Grab the sync chanend first, so it's always CID 0 */
  sync = getChanend((SWXLB_BOOT_ID << 16) | 0xff02);
  /* Get these board dimensions before anything tries to evaluate a real grid ID */
  asm("in %0,res[%1]":"=r"(sw_nrows):"r"(sync));
  asm("in %0,res[%1]":"=r"(sw_ncols):"r"(sync));
  
  /* Now we declare any channels we need */

  c = getChanend(swallow_cvt_chanend(0x1c0202));
  asm("ecallf %0"::"r"(c));
  c = getChanend(swallow_cvt_chanend(0x1e0102));
  asm("ecallf %0"::"r"(c));
  /* Do sync after all chanends are allocated. */
  asm("chkct res[%0],1"::"r"(sync));
  return;
}

/* Main for core 29*/

#if defined(AEC_FORCE_29) || defined(AEC_FORCE)
#define AEC_VAL 0x10
#else
#define AEC_VAL 0x30
#endif

int main(void)
{
  unsigned ctrl_data; //Used by AEC code, maybe
  __initLinks();
//Enable dynamic AEC if we want AEC enabled even on cores that are in use
#ifdef AEC_ON_INUSE_CORE
#if AEC_DIVIDER_29 > 1
  write_pswitch_reg(swallow_id(29),XS1_PSWITCH_PLL_CLK_DIVIDER_NUM,AEC_DIVIDER_29 - 1);
  ctrl_data = getps(XS1_PS_XCORE_CTRL0);
  ctrl_data &= 0xffffffcf;
  ctrl_data |= AEC_VAL;
  setps(XS1_PS_XCORE_CTRL0, ctrl_data);
#elif AEC_DIVIDER > 1
  write_pswitch_reg(swallow_id(29),XS1_PSWITCH_PLL_CLK_DIVIDER_NUM,AEC_DIVIDER - 1);
  ctrl_data = getps(XS1_PS_XCORE_CTRL0);
  ctrl_data &= 0xffffffcf;
  ctrl_data |= AEC_VAL;
  setps(XS1_PS_XCORE_CTRL0, ctrl_data);
#endif
#endif
  par
  {
    nOS_start(swallow_cvt_chanend(0x001d0102),swallow_cvt_chanend(0x001d0202),0);

  }
//Enable dynamic AEC just before we free the final thread, meaning AEC is always active on this unused core
#ifndef AEC_ON_INUSE_CORE
#if AEC_DIVIDER_29 > 1
  write_pswitch_reg(swallow_id(29),XS1_PSWITCH_PLL_CLK_DIVIDER_NUM,AEC_DIVIDER_29 - 1);
  ctrl_data = getps(XS1_PS_XCORE_CTRL0);
  ctrl_data &= 0xffffffcf;
  ctrl_data |= AEC_VAL;
  setps(XS1_PS_XCORE_CTRL0, ctrl_data);
#elif AEC_DIVIDER > 1
  write_pswitch_reg(swallow_id(29),XS1_PSWITCH_PLL_CLK_DIVIDER_NUM,AEC_DIVIDER - 1);
  ctrl_data = getps(XS1_PS_XCORE_CTRL0);
  ctrl_data &= 0xffffffcf;
  ctrl_data |= AEC_VAL;
  setps(XS1_PS_XCORE_CTRL0, ctrl_data);
#endif
#endif
  asm("freet"::);
  return 0;
}
