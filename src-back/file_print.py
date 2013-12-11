#!/usr/bin/python -u

from __future__ import print_function
import socket,time


IP_MTU_DISCOVER   = 10
IP_PMTUDISC_DONT  =  0  # Never send DF frames.
IP_PMTUDISC_WANT  =  1  # Use per route hints.
IP_PMTUDISC_DO    =  2  # Always DF.
IP_PMTUDISC_PROBE =  3  # Ignore dst pmtu.

sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
sock.setsockopt(socket.SOL_IP, IP_MTU_DISCOVER, IP_PMTUDISC_DONT)
output_file = "print_output.txt"
RX_IP = "192.168.128.4"
RX_PORT = 0x5b5b

rxsoc = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
rxsoc.setsockopt(socket.SOL_IP, socket.SO_REUSEADDR, 1)
rxsoc.bind((RX_IP, RX_PORT))

# print('Receiving data')


outfile = open(output_file,'w+')

while 1:
	# 128 is maximum data buffer size
	rxdata, rxadr = rxsoc.recvfrom(0xffff)
	l = len(rxdata.encode("hex"))
	l = l-20
	i = 1
	while i < l:
		i = i + 8
		outfile.write(str(rxdata.encode("hex")[4:12]) + ': ')
		if i < l:
			outfile.write(str(rxdata.encode("hex")[11+i:19+i]) + ',')
		else:
			outfile.write(str(rxdata.encode("hex")[11+i:19+i]) + '\n')

	outfile.close()
	outfile = open(output_file,'a')
	
rxsoc.close()

