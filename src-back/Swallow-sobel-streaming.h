#ifndef SWALLOW_SOBEL_STREAM_H_
#define SWALLOW_SOBEL_STREAM_H_

void c_coreSendWords(channel output, unsigned data[], unsigned data_length);
unsigned c_coreReceiveWords(channel input, unsigned receiveBuffer[]);

#endif /* SWALLOW_SOBEL_H_ */
