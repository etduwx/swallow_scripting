#ifndef HAVE_PLATFORM_H
#define HAVE_PLATFORM_H

#include <xs1.h>

/*
 * Platform description header file.
 * Automatically generated from "/home/sld-user/swallow/tool_xmp16_manycore/include/XMP16-unicore.xn".
 */

#ifdef __XC__
/* Core array declaration. */
extern core stdcore[1];
#endif

#ifdef __XC__
/* Service prototypes. */
/* none */
#endif

#if !defined(__ASSEMBLER__)
#define PORT_LED on stdcore[0]: XS1_PORT_4F
#else
#define PORT_LED XS1_PORT_4F
#endif


/* Reference frequency definition. */
#define PLATFORM_REFERENCE_HZ 100000000
#define PLATFORM_REFERENCE_KHZ 100000
#define PLATFORM_REFERENCE_MHZ 100

#endif /* HAVE_PLATFORM_H */

