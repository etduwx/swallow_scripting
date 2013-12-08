#include <string.h> // for strlen()
#include <platform.h>
#include <print.h>
#include "test.h"
#include "swallow_comms.h" // for Steve's tools
#define BOARDS_W 5
#define DEBUG_STRING_MAXLENGTH 1024

/*
 * "chanend" means native xc chan with chanend
 * "channel" means chanends being treated as unsigned
 */

void test_print()
{
     printstr("test! \n");
     printstrln("testnewline");
}
