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

PARENTCORE_ID = 1
NUMCORES_INIT


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


def editMCMain(appToAdd):



def addPrim(coreList):
	editMCMain("prim")


def runExperiments(appList,coreNums):

	indices = [0] * len(appList)
	appinds = [0] * 3
	upperBound = 3 + sum(coreNums)
	lastInd = 0
	if any("prim" in s for s in appList):
		coreList = range(4,4+coreNums)
		addPrim(coreList)
	if any("blur" in s for s in appList):
		appinds[0] = curLastind
		lastInd += 1
	if any("sobel" in s for s in appList):
		appinds[1] = curLastind
		lastInd += 1
	if any("sobel" in s for s in appList):
		appinds[2] = curLastind
		lastInd += 1

	currentInd = lastInd

	while(--currentInd >= 0):
		if any("blur" in s for s in appList):
			coreList = range(4+indices[appinds[0]],4+indices[appinds[0]]+coreNums[appList.index("blur")])
			addBlur(coreList)

		if any("sobel" in s for s in appList):
			coreList = range(4+indices[appinds[1]],4+indices[appinds[1]]+coreNums[appList.index("sobel")])
			addSobel(coreList)

		if any("mergesort" in s for s in appList):
			coreList = range(4+indices[appinds[2]]4+indices[appinds[2]]+coreNums[appList.index("mergesort")])
			addMergeSort(coreList)

		if (indices[currentInd] != upperBound):
			indices[currentInd] += 1
			break
		else:
			indices[currentInd] = 0



#	if any("prim" in s for s in appList):
#		addPrim(coreNums[appList.index("prim")])


def main():
		# dummy example
	global applications = ["prim"]
	global chanMax = NUMCORES_INIT
	cores = ["4 8 12"]
	values = ["50","100","200","300","200","100","400","500"]	
	

	numCores = [4,4]

	print_to_csv(applications,cores,values)


#	for x in (8,12):

#		editFile(x)


	runExperiments(applications,numCores)


# 	add blur

#   add prim's		
	
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

