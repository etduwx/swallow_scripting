#include "Swallow-helpers.h"
#include "Swallow-nOS_client.h"
#include "Swallow-prim-checks.h"
#include "Swallow-prim.h"
#include "swallow_comms2.h"


unsigned check_maze(unsigned in_var,unsigned visited[][MAZEWIDTH/DIV_DEGREE_X],unsigned rank,channel north,channel east,channel south,channel west){

	xc_check_maze(in_var,visited,rank,north,east,south,west);
}

unsigned check_edge(unsigned rank, unsigned in_var,channel north,channel east,channel south,channel west){

	xc_check_edge(rank,in_var,north,east,south,west);

}

