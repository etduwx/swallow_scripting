#include <platform.h>

#ifndef SWALLOW_PRIM_CHECK_H_
#define SWALLOW_PRIM_CHECK_H_
#define OFFSET 4
void listen_check_wall(unsigned parent_id, unsigned rank);
void prim_child_root(unsigned rank);
void set_up_consensus(unsigned parent_id, unsigned rank);
void getCompletedSignal(unsigned child_channels[]);
#endif /* SWALLOW_PRIM_CHECK_H_ */

