#ifndef MERGE_SORT_H_
#define MERGE_SORT_H_

#define INPUT_SIZE 512

#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void merge_sort_root(chanend c_in,chanend control_chan);
void merge_sort_child(unsigned parent_id,unsigned rank);
void childWorker(unsigned parentCommunicationChannel,unsigned rank, unsigned treeLevel);
#ifdef chanend
#undef chanend
#endif
#else
#endif
static inline void printOne(unsigned value);
#endif /* MERGE_SORT_H_ */
