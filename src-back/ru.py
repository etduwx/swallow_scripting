#!/usr/bin/python

import sys, getopt 
from subprocess import Popen, PIPE

def main():

	p1 = Popen(["tftp", "192.168.128.3"], stdout=PIPE, stdin=PIPE)
	tftpargs = "mode binary\nput " + sys.argv[1] + ".sgb"
	tftpargs = ''.join(tftpargs) 
	output = p1.communicate(tftpargs)


if __name__ == "__main__":
        main()

