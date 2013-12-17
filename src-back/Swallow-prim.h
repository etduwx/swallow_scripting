#ifndef SWALLOW_PRIM_H_
#define SWALLOW_PRIM_H_

#define MAZEWIDTH 16
#define MAZELENGTH 16

#define DIV_DEGREE_PRIM_X 2
#define DIV_DEGREE_PRIM_Y 2
#define NUM_CHILDREN_PRIM 4
#define STARTDELAY 100000000
#define CONTROL_INTERVAL 10

#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void prim_main(chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel);
void startSync(chanend c_out);
void xc_listen_check_wall(unsigned parentCommunicationChannel, unsigned rank, chanend north,chanend east,chanend south,chanend west,chanend com_channel,chanend consensus_channel);
void xc_prim_child_root(unsigned rank, chanend com_channel);
void setFreqDivider(unsigned divider,unsigned rank);
void send_word(chanend id, unsigned value);
void consensus(unsigned rank, chanend north,chanend east,chanend south,chanend west,chanend self_channel);
unsigned tally_votes(unsigned status[],unsigned flags[],unsigned rank);
void xc_getCompletedSignal(chanend child_channels[]);
select getValue(chanend child_channel,unsigned hi);
void submit_votes(unsigned rank, chanend north, chanend east, chanend south, chanend west,chanend consensus_channel,chanend self_channel);
void pass_func(chanend parentCommunicationChannel,unsigned rank,chanend north_connection,chanend east_connection,chanend south_connection,chanend west_connection,chanend siblingCommunicationChannel_north,chanend siblingCommunicationChannel_east,chanend siblingCommunicationChannel_south,chanend siblingCommunicationChannel_west,chanend consensus_channel);
unsigned exor(unsigned vis1, unsigned vis2, unsigned num_touched);
#ifdef chanend
#undef chanend
#endif
#else
void xc_prim_child_root(unsigned rank, unsigned com_channel);
void xc_getCompletedSignal(unsigned child_channels[]);
void prim_main(unsigned c_in, unsigned c_out, unsigned shouldIRun, unsigned control_channel);
void startSync(unsigned c_out);
void xc_listen_check_wall(unsigned parentCommunicationChannel, unsigned rank, unsigned north, unsigned east, unsigned south, unsigned west,unsigned com_channel,unsigned consensus_channel);
unsigned tally_votes(unsigned status[],unsigned flags[],unsigned rank);
void send_word(unsigned id, unsigned value);
void pass_func(unsigned parentCommunicationChannel,unsigned rank,unsigned north_connection,unsigned east_connection,unsigned south_connection,unsigned west_connection,unsigned siblingCommunicationChannel_north,unsigned siblingCommunicationChannel_east,unsigned siblingCommunicationChannel_south,unsigned siblingCommunicationChannel_west,unsigned consensus_channel);
//select sync_edge(unsigned in_var, channel listenChannel, unsigned visited[][MAZELENGTH],unsigned walls_touched[]);
//select getMazeComponents(unsigned in_var, channel listenChannel, unsigned mazesol[][MAZELENGTH]) ;
#endif
static inline void printOne(unsigned value);
void prim_child(unsigned parent_id, unsigned rank);
unsigned xc_check_maze(unsigned in_var,unsigned visited[][MAZEWIDTH/DIV_DEGREE_PRIM_X],unsigned rank,unsigned north,unsigned east,unsigned south,unsigned west);
unsigned xc_check_edge(unsigned rank, unsigned in_var,unsigned north,unsigned east,unsigned south,unsigned west);
void delay_execution(unsigned delay);
#endif /* SWALLOW_PRIM_H_ */

#ifdef MAIN_FILE_PRIM
unsigned core_list_prim[NUM_CHILDREN_PRIM];
#else
extern unsigned core_list_prim[NUM_CHILDREN_PRIM];
#endif
