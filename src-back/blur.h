#ifndef MATRIXMUL_H_
#define MATRIXMUL_H_

#define IMG_LENGTH_BLUR 16
#define IMG_WIDTH_BLUR 16
#define XFACTOR 4
#define YFACTOR 4
#define XDIV IMG_LENGTH_BLUR/XFACTOR
#define YDIV IMG_WIDTH_BLUR/YFACTOR
#define STAGES_OF_PIPELINE 8
#ifdef __XC__
void xc_printPower(chanend powerChannel);
#ifdef MCMAIN
#define chanend unsigned
#endif
void blur_main(chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel);
#ifdef chanend
#undef chanend
#endif
#else
#define chanend unsigned
void xc_printPower(unsigned powerChannel);
void blur_main(chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel);
#endif
void blur_child(unsigned parent_id, unsigned rank) ;
#endif /* MATRIXMUL_H_ */
