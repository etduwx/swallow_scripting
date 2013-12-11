#!/usr/bin/python -u

import sys, getopt 
import signal
from time import sleep
import os
import subprocess

def main():

	tmp = os.popen("ps -Af").read()

	#print "executing 0 \n"

	if "xrun" not in tmp:
		print "ho"
		p0 = subprocess.Popen(["xrun","--io", "--id", "1", "swallow_etherboot.xe"],stderr=subprocess.PIPE)
		sleep(5)


    #print "executing 1 \n"


	p1 = subprocess.Popen(["python","file_print.py"],stderr=None,stdout=None)

	p2 = subprocess.Popen(["tftp", "192.168.128.3"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
	
	tftpargs = "mode binary\nput " + sys.argv[1] + ".sgb"
	tftpargs = ''.join(tftpargs) 
	output = p2.communicate(tftpargs)


	sleep(3)

	p1.kill()

if __name__ == "__main__":
        main()

