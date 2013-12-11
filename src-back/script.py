#!/bin/sh 
import os, subprocess, signal, shutil
from time import sleep
from tempfile import mkstemp


filename = "blur.h"
filename_xc = "blur.xc"
match = "#define STAGES_OF_PIPELINE"

outputfile = "output2.txt"
outputreadfile = "print_output.txt"

PARENTCORE_ID = 1
NUMCORES_INIT = 36
PRIMS_BODY_BASE_PATH = "Swallow-prim_base.xc"
PRIMS_HEADER_BASE_PATH = "Swallow-prim_base.h"
PRIMS_BODY_PATH = "Swallow-prim.xc"
PRIMS_HEADER_PATH = "Swallow-prim.h"

MCMAIN_PATH = "mcmain_prim.xc"

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

def getReplacementsPrims(typeofEditing):
		return {
			'power' : {'//control_channel':'control_channel', '//printMany(8':'printMany(8'},
			'ratio' : {'//if(rank==0) printMany':'if(rank==0) printMany','//printer[0] = 1000*':'printer[0] = 1000*'},
			'time'  : {'//if(rank==0) printMany':'if(rank==0) printMany','//printer[0] = printer[1]':'printer[0] = printer[1]'}
			}.get(typeofEditing,{'//control_channel':'control_channel', '//printMany(8':'printMany(8'})

def editPrimBody(typeOfEditing):
	global PRIMS_BODY_PATH
	global PRIMS_BODY_BASE_PATH
	if (typeOfEditing != "none"):
		replacements = getReplacementsPrims(typeOfEditing)
		
		fh, abs_path = mkstemp()
		newFile = open(abs_path,'w')
		editFile = open(PRIMS_BODY_BASE_PATH)
		for line in editFile:
			for src,target in replacements.iteritems():
				line = (line.replace(src,target))
			newFile.write(line)
		newFile.close()
		os.close(fh)
		editFile.close()
		os.remove(PRIMS_BODY_PATH)
		shutil.move(abs_path,PRIMS_BODY_PATH)
	else:
		os.remove(PRIMS_BODY_PATH)
		copyfile(PRIMS_BODY_BASE_PATH,PRIMS_BODY_PATH)

def editPrimHeader(coreList,measurePower):
	numChildren = len(coreList)

	match_x = "#define DIV_DEGREE_SWALLOW_X "
	match_y = "#define DIV_DEGREE_SWALLOW_Y "
	match_children = "#define NUM_CHILDREN_SWALLOW "

	print numChildren
	print coreList

	if(numChildren==4):
		div_x = 2
		div_y = 2
	elif(numChildren==6):
		div_x = 3
		div_y = 2
	elif(numChildren==8):
		div_x=4
		div_y=2
	elif(numChildren==9):
		div_x=3
		div_y=3
	elif(numChildren==12):
		div_x=4
		div_y=3
	else:
		div_x=4
		div_y=4

	baseFile = open(PRIMS_HEADER_BASE_PATH)
	fh, abs_path = mkstemp()
	newFile = open(abs_path,'w')
	for line in baseFile:
		if match_x in line:
			newFile.write(match_x+ str(div_x) + "\n")
		elif match_y in line:
			newFile.write(match_y + str(div_y) + "\n")
		elif match_children in line:
			newFile.write(match_children + str(numChildren) + "\n")
		else:
			newFile.write(line)

	newFile.close()
	os.close(fh)
	baseFile.close()
	os.remove(PRIMS_HEADER_PATH)
	shutil.move(abs_path,PRIMS_HEADER_PATH)

def print_to_csv(appList,coreList,values):
	global outputfile
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

# Need to add power or not power functionality
def editMCMain(appToAdd,measurePower):
	global MCMAIN_BASE_PATH
	global MCMAIN_PATH
	match = "par (int i = " + str(PARENTCORE_ID + ' ;') 
	fh, abs_path = mkstemp()
	newFile = open(abs_path,'w')
	baseFile = open(MCMAIN_BASE_PATH)

	flag = 0

	for line in baseFile:
		if match in line:
			flag = 1
			newFile.write(line) 
		elif flag  == 1:
			newFile.write('\ton stdcore[i] : ' + str(appToAdd) + '_main(c[NCORES],1,k) ; \n')
			newFile.write(line)
			flag = 0
		else:
			newFile.write(line)

	os.close(fh)
	newFile.close()
	baseFile.close()

	os.remove(MCMAIN_PATH)
	shutil.move(abs_path,MCMAIN_PATH)

	MCMAIN_BASE_PATH = "mcmain_prim.xc"

def addPrim(coreList, measurementType):
	if measurementType == "power":
		measurePower = True
	else:
		measurePower = False
	editMCMain("prim",measurePower) #(isMethodRunningPowerMeasurements) ? True : False
	editPrimHeader(coreList,measurePower)
	editPrimBody(measurementType) # power=1,ratio=2,time=3

def runExperiments(appList,coreNums):
	
	indices = [0] * 3
	states = ["none","none","none","none"]
	appinds = [0] * 3
	upperBound = 3 + sum(coreNums)
	lastInd = 0
	cores = [0] * 3

	if any("blur" in s for s in appList):
		appinds[0] = curLastind
		lastInd += 1
		cores[curLastind] = coreNums[appList.index("blur")]
	if any("sobel" in s for s in appList):
		appinds[1] = curLastind
		lastInd += 1
		cores[curLastind] = coreNums[appList.index("sobel")]
	if any("mergesort" in s for s in appList):
		appinds[2] = curLastind
		cores[curLastind] = coreNums[appList.index("mergesort")]
		lastInd += 1

	currentInd = lastInd - 1

	if lastInd >=3:
		lim3 = upperBound - cores[2]
	else:
		lim3 = 1

	if lastInd >=2:
		lim2 = upperBound - cores[1]
	else:
		lim2 = 1

	if lastInd >=1:
		lim1 = upperBound - cores[0]
	else:
		lim1 = 1

	for i in xrange(lim1):
		indices[0] = i
		for j in xrange(lim2):
			indices[1] = j
			for k in xrange(lim3):
				indices[2] = k
				apps = []
				values = []
				coreList = []
				if any("prim" in s for s in appList):
					coreList.append(range(4,4+coreNums[appList.index("prim")]))
					apps.append("prim")
				if any("blur" in s for s in appList):
					coreList.append(range(4+indices[appinds[0]],4+indices[appinds[0]]+coreNums[appList.index("blur")]))
					apps.append("blur")
				if any("sobel" in s for s in appList):
					coreList.append(range(4+indices[appinds[1]],4+indices[appinds[1]]+coreNums[appList.index("sobel")]))
					apps.append("sobel")
				if any("mergesort" in s for s in appList):
					coreList.append(range(4+indices[appinds[2]],4+indices[appinds[2]]+coreNums[appList.index("mergesort")]))
					apps.append("mergesort")
				for coreAppIndex in xrange(len(appList)):
					i = 0
					while(i<4):
						global MCMAIN_BASE_PATH
						MCMAIN_BASE_PATH = "mcmain_prim_base.xc"
						if states[coreAppIndex] == "none" :
							if coreAppIndex == 0:
								states[coreAppIndex] = "power"
							else:
								i += 1
								break
						elif states[coreAppIndex] == "power":
							states[coreAppIndex] = "ratio"
						elif states[coreAppIndex] == "ratio":
							states[coreAppIndex] = "time"
						else:
							states[coreAppIndex] = "none"
							break

						if any("prim" in s for s in appList):
							addPrim(coreList[0],states[0])
						if any("blur" in s for s in appList):
							addBlur(coreList[appinds[0]],states[appinds[0]])
						if any("sobel" in s for s in appList):
							addSobel(coreList[appinds[1]],states[appinds[1]])
						if any("mergesort" in s for s in appList):
							addMergeSort(coreList[appinds[2]],states[appinds[2]])

						compileandRun()
						parseOutput(i,coreAppIndex)
						i += 1
				abc = []		
				for z in xrange(len(coreList)):
					abc.append(str(coreList[z]))
				print_to_csv(apps,abc,values)


#	if any("prim" in s for s in appList):
#		addPrim(coreNums[appList.index("prim")])

def parseOutput(outputType,coreAppIndex):
	global applications
	global values
	global outputreadfile
	readFile = open(outputreadfile,'r')
	outputs = []

	for line in readFile:
		outputs.append(line.split()[1])

	readFile.close()

	if outputType == 0:
		values[0:4] = outputs[1:5]
	elif outputType == 1:
		values[4+coreAppIndex] = outputs[0]
	elif outputType == 2:
		values[4+len(applications)+coreAppIndex] = outputs[0]


def compileandRun():
	os.system('./build3')
	sleep(10)
	p1 = Popen(["python", "run.py", "prim"], stdout=PIPE, stdin=PIPE, shell=True, preexec_fn=os.setsid)
	sleep(10)
	os.killpg(p1.pid,signal.SIGTERM)

def main():
		# dummy example
	global applications
	global chanMax 
	global values	
	global MCMAIN_BASE_PATH

	applications = []
	applications.append("prim")

	numCores = [4]

	#print_to_csv(applications,cores,values)


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

