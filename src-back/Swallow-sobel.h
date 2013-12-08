#ifndef SWALLOW_SOBEL_H_
#define SWALLOW_SOBEL_H_

#define IMG_WIDTH 16
#define IMG_LENGTH 12

#define DIV_DEGREE_X 4 // the degree to which the image is divided along each dimension (can only result in a square number of small images)
#define DIV_DEGREE_Y 3
#define NUM_CHILDREN 12

#ifdef __XC__
#ifdef MCMAIN
#define chanend unsigned
#endif
void sobel_main(unsigned parent_id, unsigned rank);
void startSync(chanend c_out);
#ifdef chanend
#undef chanend
#endif
void xc_sobelSelect(chanend c[],unsigned processed_image[][IMG_LENGTH+2]);
#else
void sobel_main(unsigned parent_id, unsigned rank);
void startSync(unsigned c_out);
void xc_sobelSelect(unsigned c[],unsigned processed_image[][IMG_LENGTH+2]);
#endif

void sobel_child(unsigned parent_id, unsigned rank) ;
void sobel_pchild(unsigned parent_id, unsigned rank) ;

#endif /* SWALLOW_SOBEL_H_ */
