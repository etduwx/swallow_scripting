# 1 "Swallow-nOS_initialFunctions.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "Swallow-nOS_initialFunctions.c"

# 1 "Swallow-nOS.h" 1
# 45 "Swallow-nOS.h"
void begin1(unsigned parentID, unsigned rank) ;
void begin2(unsigned parentID, unsigned rank) ;
void begin3(unsigned parentID, unsigned rank) ;
void startSync(unsigned c_out);
void select1B(unsigned c1, unsigned c2) ;



static inline void printOne(unsigned value);
# 3 "Swallow-nOS_initialFunctions.c" 2
# 1 "Swallow-nOS_client.h" 1
# 11 "Swallow-nOS_client.h"
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
# 44 "Swallow-helpers.h"
void connectChanend(unsigned c, endpoint dest) ;
void freeChanend_sjh(unsigned c) ;
endpoint chanendListen(unsigned c) ;


void coreSendWords(unsigned output, unsigned data[], unsigned length) ;
unsigned coreReceiveWords(unsigned input, unsigned data_buffer[]) ;
void coreSendBytes(unsigned output, char data[], unsigned data_length) ;


void SwPrintUnsigned(unsigned output, unsigned value) ;
void SwPrintString(unsigned output, const char string[]) ;
# 12 "Swallow-nOS_client.h" 2




void p1(unsigned c) ;


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
# 4 "Swallow-nOS_initialFunctions.c" 2
# 1 "Swallow-nOS_asm.h" 1
# 16 "Swallow-nOS_asm.h"
enum nOS_action {nOS_allocateNewChannel_action, nOS_connectNewChannel_action, nOS_getChannelDest_action, nOS_updateChannelDest_action, nOS_releaseChannel_action, nOS_lookupChanend_action, nOS_createThread_action, nOS_getThreadStatus_action } ;
typedef struct chanMapping {unsigned chanID; } chanMapping ;

unsigned nOS_createThread(unsigned parentID, unsigned startAddress, unsigned childRank, unsigned stacks[5][2048]) ;
void nOS_waitForEvent() ;
void nOS_disableAllEvents() ;
unsigned nOS_getEventID() ;
# 38 "Swallow-nOS_asm.h"
void nOS_listenForAction(unsigned c, unsigned stacks[5][2048], chanMapping chanMap[5][24]) ;
unsigned nOS_requestAction(unsigned dest, unsigned action, unsigned arg1, unsigned arg2) ;
void nOS_addEventHandler(unsigned c, unsigned handler) ;
void nOS_disableEvent(unsigned c) ;
void nOS_setChannelDest(unsigned c, unsigned dest) ;
void printManyC(unsigned printChannel, unsigned length, unsigned data[]) ;
unsigned GetLock() ;
void ClaimLock(unsigned l) ;
void FreeLock(unsigned l) ;
void FreerLock(unsigned l) ;
# 5 "Swallow-nOS_initialFunctions.c" 2

# 1 "blur.h" 1
# 22 "blur.h"
void xc_printPower(unsigned powerChannel);
void blur_main(unsigned c_in, unsigned shouldIRun, unsigned control_channel);

void blur_child(unsigned parent_id, unsigned rank) ;
# 7 "Swallow-nOS_initialFunctions.c" 2
# 1 "Swallow-prim.h" 1
# 33 "Swallow-prim.h"
void xc_prim_child_root(unsigned rank, unsigned com_channel);
void xc_getCompletedSignal(unsigned child_channels[]);
void prim_main(unsigned c_in, unsigned shouldIRun, unsigned control_channel);
void xc_listen_check_wall(unsigned parentCommunicationChannel, unsigned rank, unsigned north, unsigned east, unsigned south, unsigned west,unsigned com_channel,unsigned consensus_channel);
unsigned tally_votes(unsigned status[],unsigned flags[],unsigned rank);
void send_word(unsigned id, unsigned value);
void pass_func(unsigned parentCommunicationChannel,unsigned rank,unsigned north_connection,unsigned east_connection,unsigned south_connection,unsigned west_connection,unsigned siblingCommunicationChannel_north,unsigned siblingCommunicationChannel_east,unsigned siblingCommunicationChannel_south,unsigned siblingCommunicationChannel_west,unsigned consensus_channel);



static inline void printOne(unsigned value);
void prim_child(unsigned parent_id, unsigned rank);
unsigned xc_check_maze(unsigned in_var,unsigned visited[][16/2],unsigned rank,unsigned north,unsigned east,unsigned south,unsigned west);
unsigned xc_check_edge(unsigned rank, unsigned in_var,unsigned north,unsigned east,unsigned south,unsigned west);
void delay_execution(unsigned delay);





extern unsigned core_list_prim[4];
# 8 "Swallow-nOS_initialFunctions.c" 2

# 1 "Swallow-sobel.h" 1
# 21 "Swallow-sobel.h"
void sobel_main(unsigned c_in, unsigned shouldIRun, unsigned control_channel);
void xc_sobelSelect(unsigned c[],unsigned processed_image[][6 +2]);


void sobel_child(unsigned parent_id, unsigned rank) ;
void sobel_pchild(unsigned parent_id, unsigned rank) ;






extern unsigned core_list_sobel[12];
# 10 "Swallow-nOS_initialFunctions.c" 2




unsigned getStartAddress(unsigned index)
{
 void (*starts[1])(unsigned,unsigned) ;
 starts[0] = sobel_child;


 return (unsigned) starts[index] ;
}
# 36 "Swallow-nOS_initialFunctions.c"
void fooEventHandler()
{
 unsigned theEventChannel ;
 unsigned someData ;
 theEventChannel = nOS_getEventID() ;


 someData = channelReceiveWord(theEventChannel) ;
}





void installHandlerToFoo(unsigned c)
{
 void (*pFoo)(void) ;
 pFoo = fooEventHandler ;
 nOS_addEventHandler(c, (unsigned) pFoo) ;
}

void select1A(unsigned a, unsigned b)
{
 select1B(a, b) ;
}


void allocateChanByRef(unsigned *c)
{
 *c = 0x02 ;
}
