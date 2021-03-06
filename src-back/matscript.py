#!/usr/bin/python -u
import os, subprocess, signal, shutil
from time import sleep
from tempfile import mkstemp

outputfile = "results.csv"
outputreadfile = "print_output.txt"

PARENTCORE_ID = 1
NUMCORES_INIT = 36
PRIMS_BODY_BASE_PATH = "Swallow-prim_base.xc"
PRIMS_HEADER_BASE_PATH = "Swallow-prim_base.h"
PRIMS_BODY_PATH = "Swallow-prim.xc"
PRIMS_HEADER_PATH = "Swallow-prim.h"

BLUR_HEADER_BASE_PATH = "blur_base.h"
BLUR_BODY_BASE_PATH = "blur_base.xc"
BLUR_BODY_PATH = "blur.xc"
BLUR_HEADER_PATH = "blur.h"

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
			'ratio' : {'//if(rank==3) printMany':'if(rank==3) printMany','//printer[0] = 1000*':'printer[0] = 1000*'},
			'time'  : {'//if(rank==3) printMany':'if(rank==3) printMany','//printer[0] = printer[1]':'printer[0] = printer[1]'}
			}.get(typeofEditing,{'//control_channel':'control_channel', '//printMany(8':'printMany(8'})

def getReplacementsBlur(typeofEditing):
		return {
			'power' : {'//control_channel':'control_channel', '//printMany(8':'printMany(8'},
			'ratio' : {'//if(rank==2) printMany':'if(rank==2) printMany','//if(rank==2) printer[0] = 1000*':'printer[0] = 1000*'},
			'time'  : {'//if(foo==42) printMany':'if(foo==42) printMany'}
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

def editBlurBody(typeOfEditing):
	global BLUR_BODY_PATH
	global BLUR_BODY_BASE_PATH
	if (typeOfEditing != "none"):
		replacements = getReplacementsBlur(typeOfEditing)
		
		fh, abs_path = mkstemp()
		newFile = open(abs_path,'w')
		editFile = open(BLUR_BODY_BASE_PATH)
		for line in editFile:
			for src,target in replacements.iteritems():
				line = (line.replace(src,target))
			newFile.write(line)
		newFile.close()
		os.close(fh)
		editFile.close()
		os.remove(BLUR_BODY_PATH)
		shutil.move(abs_path,BLUR_BODY_PATH)
	else:
		os.remove(BLUR_BODY_PATH)
		copyfile(BLUR_BODY_BASE_PATH,BLUR_BODY_PATH)

def editBlurHeader(coreList,measurePower):
	numChildren = len(coreList)

	match_children = "#define STAGES_OF_PIPELINE "
	baseFile = open(BLUR_HEADER_BASE_PATH)
	fh, abs_path = mkstemp()
	newFile = open(abs_path,'w')
	for line in baseFile:
		if match_children in line:
			newFile.write(match_children + str(numChildren) + "\n")
		else:
			newFile.write(line)

	newFile.close()
	os.close(fh)
	baseFile.close()
	os.remove(BLUR_HEADER_PATH)
	shutil.move(abs_path,BLUR_HEADER_PATH)


def editPrimHeader(coreList,measurePower):
	numChildren = len(coreList)

	match_x = "#define DIV_DEGREE_PRIM_X "
	match_y = "#define DIV_DEGREE_PRIM_Y "
	match_width = "#define MAZEWIDTH "
	match_length = "#define MAZELENGTH "
	match_children = "#define NUM_CHILDREN_PRIM "

	#print numChildren
	#print coreList

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
		elif match_width in line:
			newFile.write(match_width + str(div_x*8) + "\n")
		elif match_length in line:
			newFile.write(match_length + str(div_y*8) + "\n")
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
		for i in xrange(len(appList)):
		#for i in xrange(3):
		#	if(i < len(appList)):
		#		f.write((values[4+len(appList)*x+i]) + ",")
		#	elif(x == 1 and i== 2):
		#		break
		#	else:
		#		f.write(",")


			if(x == 1 and i==(len(appList)-1)):	
				f.write((values[4+len(appList)*x+i]))
			else:		
				f.write((values[4+len(appList)*x+i]) + ",")

		for j in xrange(3-len(appList)):
			f.write(",")
		
	f.write("\n")
	f.close()		

# Need to add power or not power functionality
def editMCMain(appToAdd,measurePower):
	global MCMAIN_BASE_PATH
	global MCMAIN_PATH
	match = "par (int i = " + str(PARENTCORE_ID) + ' ;' 
	fh, abs_path = mkstemp()
	newFile = open(abs_path,'w')
	baseFile = open(MCMAIN_BASE_PATH)

	flag = 0

	for line in baseFile:
		if match in line:
			flag = 1
			newFile.write(line) 
		elif flag  == 1:
			#newFile.write('\ton stdcore[i] : ' + str(appToAdd) + '_main(c[NCORES],1,k) ; \n')
			newFile.write(line)
			flag = 2
		elif flag == 2:
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

def addBlur(coreList,measurementType):
	if measurementType == "power":
		measurePower = True
	else:
		measurePower = False
	editMCMain("blur",measurePower)
	editBlurHeader(coreList,measurePower)
	editBlurBody(measurementType)

def runExperiments(appList,coreNums):

	global values
	global outputfile


	indices = [0] * 3
	states = ["none","none","none","none"]
	appinds = [0] * 3
	upperBound = 3 + sum(coreNums)
	lastInd = 0
	cores = [0] * 3
	curLastind = 0
	primflag = 0

	if any("prim" in s for s in appList):
		lastInd += 1
		cores[curLastind] = coreNums[appList.index("prim")]
		curLastind += 1
		primflag = 1
	if any("blur" in s for s in appList):
		appinds[0] = curLastind
		lastInd += 1
		cores[curLastind] = coreNums[appList.index("blur")]
		curLastind += 1
	if any("sobel" in s for s in appList):
		appinds[1] = curLastind
		lastInd += 1
		cores[curLastind] = coreNums[appList.index("sobel")]
		curLastind += 1
	if any("mergesort" in s for s in appList):
		appinds[2] = curLastind
		cores[curLastind] = coreNums[appList.index("mergesort")]
		curLastind += 1
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

	if lastInd >=1 and primflag == 0:
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

				abc = []		
				for z in xrange(len(coreList)):
					temp = str(coreList[z])
					temp = temp.replace(",","")
					abc.append(temp)
				#print(values)

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

						print("Now compiling and running " + str(apps) + " on cores" + str(abc) +", getting " + states[coreAppIndex] + " from " + str(apps[coreAppIndex]) +"... \n")

						compileandRun()
						parseOutput(i,coreAppIndex)
						i += 1

				
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

	for i in xrange(len(outputs)):
		if outputType == 1:
			temporary = float(float(int(outputs[i],16))/float(1000))
		else:
			temporary = int(outputs[i],16)

		outputs[i] = str(temporary)

	if outputType == 0:
		values[0:4] = outputs[1:5]
	elif outputType == 1:
		values.append(outputs[0])
	elif outputType == 2:
		values.append(outputs[0])

def compileandRun():
	os.system('./build3')
	sleep(5)
	p1 = subprocess.Popen(["python", "run.py", "prim"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
	sleep(5)

	p1.kill()

def main():
		# dummy example
	global applications
	global chanMax 
	global values	
	global MCMAIN_BASE_PATH
	global outputfile


	applications = []
#	applications.append("prim")
	applications.append("blur")
	numCores = [4]

	#print_to_csv(applications,cores,values)


#	for x in (8,12):

#		editFile(x)




	if os.path.exists(outputfile):
		os.remove(outputfile)

	f = open(outputfile,'w+')

	f.write("Application 1, Application 2, Application 3, Cores App 1, Cores App 2, Cores App 3, Power Stripe 1, Power Stripe 2, Power Stripe 3, Power Stripe 4, Ratio App 1, Ratio App 2, Ratio App 3, Time App 1, Time App 2, Time App 3 \n")

	f.close()

	for i in (4,6,8,9,12):
		numCores = [i]
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

