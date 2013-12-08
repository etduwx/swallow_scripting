#!/bin/sh 
import os, tftpy, subprocess
from time import sleep
from subprocess import Popen, PIPE
from tempfile import mkstemp
from shutil import move
from os import remove, close

filename = "blur.h"
filename_xc = "blur.xc"
match = "#define STAGES_OF_PIPELINE"

outputfile = "output2.txt"


trolling
def editFile(x):

	editingFile = open(filename,"r")

	lines = editingFile.readlines()

	editingFile.close()

	f = open(filename,"w")
	for line in lines:
		if match in line:
			f.write(match + " " + str(x) + "\n")
		else:
			f.write(line)
	f.close()

#def edit_xc_File(x):

#	editingFile = open(filename,"r")

#	lines = editingFile.readlines()

#	editingFile.close()

#	f = open(filename,"w")
#	for line in lines:
#		if match in line:
#			f.write(match + " " + str(x) + "\n")
#		else:
#			f.write(line)
#	f.close()


 	



def print_to_csv(appList,coreList,values):
	f = open(outputfile,"a+")
	for i in xrange(3):
		if i < len(appList):
			f.write(appList[i] + ",")
		else:
			f.write(",")

	for i in xrange(3):
		if i < len(coreList):
			f.write(coreList[i] + ",")
		else:
			f.write(",")

	for i in xrange(4):
		f.write(values[i] + ",")

	for x in xrange(2):
	#	for i in xrange(len(appList)):
		for i in xrange(3):
			if(i < len(appList)):
				f.write((values[4+len(appList)*x+i]) + ",")
			elif(x == 1 and i== 2):
				break
			else:
				f.write(",")


	#		if(x == 1 and i==(len(appList)-1)):	
	#			f.write((values[4+len(appList)*x+i]))
	#		else:		
	#			f.write((values[4+len(appList)*x+i]) + ",")

	#	for j in xrange(3-len(appList)):
	#		f.write(",")
		
	f.write("\n")
	f.close()		

def main():
		# dummy example
	applications = ["prim"]
	cores = ["4 8 12"]
	values = ["50","100","200","300","200","100","400","500"]	
		
	print_to_csv(applications,cores,values)


#	for x in (8,12):

#		editFile(x)

		
	
#		os.system('./build3')

#		sleep(10)

#		p1 = Popen(["python", "run.py", "prim"], stdout=PIPE, stdin=PIPE)
       	
#		sleep(10)

# once file(s) are edited, print to the CSV file with 
# application names in a string list (arg1)
# core configurations in array list (arg2)
# values {power stripe 1, power stripe 2, power stripe 3, power stripe 4, comp-to-comm ratio 1, comp-to-comm ratio 2,comp-to-comm ratio 3,exec 1, exec 2, exec 3} 


if __name__ == "__main__":
        main()

