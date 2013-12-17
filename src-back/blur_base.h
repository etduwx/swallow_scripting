#ifndef MATRIXMUL_H_
#define MATRIXMUL_H_

#define IMG_LENGTH_BLUR 25
#define IMG_WIDTH_BLUR 25
#define XFACTOR 5
#define YFACTOR 5
#define XDIV IMG_LENGTH_BLUR/XFACTOR
#define YDIV IMG_WIDTH_BLUR/YFACTOR
#define STAGES_OF_PIPELINE 8
#ifdef __XC__
void xc_printPower(chanend powerChannel);
#ifdef MCMAIN
#define chanend unsigned
#endif
void blur_main(chanend c_in,unsigned shoulldIRun,chanend control_channel);
void startSync(chanend c_out);
#ifdef chanend
#undef chanend
#endif
#else
#define chanend unsigned
void xc_printPower(unsigned powerChannel);
void blur_main(chanend c_in,unsigned shouldIRun,chanend control_channel);
void startSync(unsigned c_out);
#endif
void blur_child(unsigned parent_id, unsigned rank) ;
#endif /* MATRIXMUL_H_ */
