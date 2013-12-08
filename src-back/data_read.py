import os, tftpy, subprocess

from time import sleep
from subprocess import Popen, PIPE
from tempfile import mkstemp
from shutil import move
from os import remove, close

in_name = 'output.txt'
out_name = 'output.csv'

#config = [Threads_Prims/4  Threads_Sobel/4  Threads_Blur/4  Threads3_MergeSort/4 StartingCore_Prims StartingCore_Sobel StartingCore_Blur StartingCore_MergeSort ]

labels = 'Threads_Prims/4 , Threads_Sobel/4 , Threads_Blur/4 , Threads3_MergeSort/4, StartingCore_Prims, StartingCore_Sobel, StartingCore_Blur, StartingCore_MergeSort'
match_blur = "0xdeadbeef"


def data_read():
	in_fd = open(in_name, 'r')
        out_fd = open(out_name, 'w+')

	for line in in_fd
		

	

