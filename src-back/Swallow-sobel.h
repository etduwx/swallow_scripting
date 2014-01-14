#ifndef SWALLOW_SOBEL_H_
#define SWALLOW_SOBEL_H_

#define IMG_WIDTH_SOBEL 4
#define IMG_LENGTH_SOBEL 4

#define DIV_DEGREE_X_SOBEL 2
#define DIV_DEGREE_Y_SOBEL 2
#define NUM_CHILDREN_SOBEL 4

#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void sobel_main(chanend c_in, unsigned shouldIRun);
#ifdef chanend
#undef chanend
#endif
void xc_sobelSelect(chanend c[],unsigned processed_image[][IMG_LENGTH_SOBEL+2]);
#else
void sobel_main(unsigned c_in, unsigned shouldIRun);
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