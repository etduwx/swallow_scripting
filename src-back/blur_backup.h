#ifndef MATRIXMUL_H_
#define MATRIXMUL_H_

#define IMG_LENGTH 25
#define IMG_WIDTH 25
#define XFACTOR 5
#define YFACTOR 5
#define XDIV IMG_LENGTH/XFACTOR
#define YDIV IMG_WIDTH/YFACTOR
#define STAGES_OF_PIPELINE 4
#ifdef __XC__
void xc_printPower(chanend powerChannel);
#ifdef MCMAIN
#define chanend unsigned
#endif
void piping_main(unsigned parent_id,unsigned rank);
void startSync(chanend c_out);
#ifdef chanend
#undef chanend
#endif
#else
#define chanend unsigned
void xc_printPower(unsigned powerChannel);
void piping_main(unsigned parent_id,unsigned rank);
void startSync(unsigned c_out);
#endif
void piping_child(unsigned parent_id, unsigned rank) ;
#endif /* MATRIXMUL_H_ */
