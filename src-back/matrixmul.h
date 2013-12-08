#ifndef MATRIXMUL_H_
#define MATRIXMUL_H_

#define A_COLS 10
#define A_ROWS 2
#define B_COLS 2
#define B_ROWS 10
#define PER_CHILD 10
#define MAT_CHILDREN 4
#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void matrix_main(unsigned parent_id,unsigned rank);
void startSync(chanend c_out);
#ifdef chanend
#undef chanend
#endif
#else
#define chanend unsigned
void matrix_main(unsigned parent_id,unsigned rank);
void startSync(unsigned c_out);
#endif
void matrix_child(unsigned parent_id, unsigned rank) ;
#endif /* MATRIXMUL_H_ */
