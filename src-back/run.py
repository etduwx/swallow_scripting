#!/usr/bin/python

import sys, getopt 
import signal
import os
import subprocess

def main():

	tmp = os.popen("ps -Af").read()

	if "xrun" not in tmp[:]:
    	p0 = Popen(["xrun","--io", "--id", "1", "swallow_etherboot.xe"],shell=True,preexec_fn=os.setsid,stderr=PIPE)
    	sleep(5)

	if "file_print.py" not in tmp[:]:
		p1 = Popen(["python","file_print.py"],shell=True,preexec_fn=os.setsid)

	p2 = Popen(["tftp", "192.168.128.3"], stdout=PIPE, stdin=PIPE, shell=True,preexec_fn=os.setsid)
	tftpargs = "mode binary\nput " + sys.argv[1] + ".sgb"
	tftpargs = ''.join(tftpargs) 
	output = p2.communicate(tftpargs)

	sleep(3)

	os.killpg(p1.pid,signal.SIGTERM)
	os.killpg(p2.pid,signal.SIGTERM)

if __name__ == "__main__":
        main()

