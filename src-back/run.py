#!/usr/bin/python -u

import sys, getopt 
import signal
from time import sleep
import os
import subprocess

def main():

	tmp = os.popen("ps -Af").read()

	#print "executing 0 \n"

    #print "executing 1 \n"


	p1 = subprocess.Popen(["python","file_print.py"],stderr=None,stdout=None)

	p2 = subprocess.Popen(["tftp", "192.168.128.3"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
	
	tftpargs = "mode binary\nput " + sys.argv[1] + ".sgb"
	tftpargs = ''.join(tftpargs) 
	output = p2.communicate(tftpargs)


	sleep(2)

	p1.kill()

if __name__ == "__main__":
        main()

