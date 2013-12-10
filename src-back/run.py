#!/usr/bin/python

import sys, getopt 
import signal
import os
import subprocess

def main():

	p1 = Popen(["tftp", "192.168.128.3"], stdout=PIPE, stdin=PIPE, shell=True,preexec_fn=os.setsid)
	tftpargs = "mode binary\nput " + sys.argv[1] + ".sgb"
	tftpargs = ''.join(tftpargs) 
	output = p1.communicate(tftpargs)

	sleep(2)

	os.killpg(p1.pid,signal.SIGTERM)

if __name__ == "__main__":
        main()

