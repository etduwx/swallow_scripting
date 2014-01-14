#ifndef SWALLOW_SOBEL_H_
#define SWALLOW_SOBEL_H_

#define IMG_WIDTH_SOBEL 8
#define IMG_LENGTH_SOBEL 6

#define DIV_DEGREE_X_SOBEL 4 // the degree to which the image is divided along each dimension (can only result in a square number of small images)
#define DIV_DEGREE_Y_SOBEL 3
#define NUM_CHILDREN_SOBEL 12

#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void sobel_main(chanend c_in,unsigned shouldIRun, chanend control_channel);
#ifdef chanend
#undef chanend
#endif
void xc_sobelSelect(chanend c[],unsigned processed_image[][IMG_LENGTH_SOBEL+2]);
#else
void sobel_main(unsigned c_in, unsigned shouldIRun, unsigned control_channel);
void xc_sobelSelect(unsigned c[],unsigned processed_image[][IMG_LENGTH_SOBEL+2]);
#endif

void sobel_child(unsigned parent_id, unsigned rank) ;
void sobel_pchild(unsigned parent_id, unsigned rank) ;

#endif /* SWALLOW_SOBEL_H_ */

#ifdef MAIN_FILE_SOBEL
unsigned core_list_sobel[NUM_CHILDREN_SOBEL];
#else
extern unsigned core_list_sobel[NUM_CHILDREN_SOBEL];
#endif