#include "Swallow-helpers.h"
#include "Swallow-nOS_client.h"
#include "Swallow-prim-checks.h"
#include "Swallow-prim.h"
#include <platform.h>
#include <xs1.h>



void delay_execution(unsigned delay)
{
timer t;
unsigned time;
//start delay
    t :> time;

    time += STARTDELAY;

    t when timerafter(time) :> void;

return;

}
