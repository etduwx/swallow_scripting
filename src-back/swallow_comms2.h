/*
 * swallow_comms - Channel tools for XMP16 multicore->single-core compilation
 *
 * Provides a compatibility layer when needed, some stuff for initialisation,
 * and enables hybrid streaming channels that replace the "streaming chanend"
 * concept by allowing regular channels to be temporarily used for streaming.
 * 
 * Copyright (C) 2012 Steve Kerrison <github@stevekerrison.com>
 *
 * This software is freely distributable under a derivative of the
 * University of Illinois/NCSA Open Source License posted in
 * LICENSE.txt and at <http://github.xcore.com/>
 */

unsigned listenForPrint(void);
void printone(unsigned value);
void printMany(unsigned length,unsigned data[]);
void printManyBytes(unsigned length,char data[]);
