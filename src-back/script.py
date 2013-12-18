#!/usr/bin/python -u
import os, subprocess, signal, shutil
from time import sleep
from tempfile import mkstemp

outputfile = "results.csv"
outputreadfile = "print_output.txt"

PARENTCORE_PRIM = 4
PARENTCORE_SOBEL = 5
PARENTCORE_BLUR = 3
PARENTCORE_MERGESORT = 1
PARENTCORE_ID = 1

NUMCORES_INIT = 36
INITIALFUNCTIONS_PATH_BASE = "Swallow-nOS_initialFunctions_base.c"
INITIALFUNCTIONS_PATH = "Swallow-nOS_initialFunctions.c"

PRIMS_BODY_BASE_PATH = "Swallow-prim_base.xc"
PRIMS_HEADER_BASE_PATH = "Swallow-prim_base.h"
PRIMS_BODY_PATH = "Swallow-prim.xc"
PRIMS_HEADER_PATH = "Swallow-prim.h"
PRIMS_CHECK_BASE = "Swallow-prim-checks_base.c"
PRIMS_CHECK_PATH = "Swallow-prim-checks.c"

BLUR_HEADER_BASE_PATH = "blur_base.h"
BLUR_BODY_BASE_PATH = "blur_base.xc"
BLUR_BODY_PATH = "blur.xc"
BLUR_HEADER_PATH = "blur.h"

SOBEL_HEADER_BASE_PATH = "Swallow-sobel_base.h"
SOBEL_BODY_BASE_PATH = "Swallow-sobel_base.xc"
SOBEL_HEADER_PATH = "Swallow-sobel.h"
SOBEL_BODY_PATH = "Swallow-sobel.xc"

MCMAIN_PATH = "mcmain.xc"
MCMAIN_BASE_PATH = "mcmain_base.xc"
BUILDFILE_BASE = "build_base"
BUILDFILE = "build"

MAXCORES = 16

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

def getReplacementsPrims(typeofEditing):
        return {
            'power' : {'//control_channel':'control_channel', '//printMany(8':'printMany(8'},
            'ratio' : {'//printer[0] = 1000*':'printer[0] = 1000*'},
            'time'  : {'//printer[0] = printer[1]':'printer[0] = printer[1]'},
            'none'  : {}
            }.get(typeofEditing,{'//control_channel':'control_channel', '//printMany(8':'printMany(8'})

def getReplacementsBlur(typeofEditing):
        return {
            'power' : {'//control_channel':'control_channel', '//printMany(8':'printMany(8'},
            'ratio' : {'//printer[0] = 1000*((double)Comptime':'printer[0] = 1000*((double)Comptime'},
            'time'  : {'//printer[0] = time_end':'printer[0] = time_end'},
            'none'  : {}
            }.get(typeofEditing,{'//control_channel':'control_channel', '//printMany(8':'printMany(8'})

def getReplacementsSobel(typeofEditing):
        return {
            'power' : {'//control_channel':'control_channel', '//printMany(8':'printMany(8'},
            'ratio' : {'//printer[0] = 1000*((double)Comptime':'printer[0] = 1000*((double)Comptime'},
            'time'  : {'//printer[0] = time_end':'printer[0] = time_end'},
            'none'  : {}
            }.get(typeofEditing,{'//control_channel':'control_channel', '//printMany(8':'printMany(8'})

def editPrimBody(coreList, typeOfEditing, threadNum,appList):
    global PRIMS_BODY_PATH
    global PRIMS_BODY_BASE_PATH
    global PRIMS_CHECK_PATH
    global PRIMS_CHECK_BASE

    create_match = "client_createThread(0,100,i,core_list_prim[i]);"
    main_match = "void prim_main"
    comms_match_in = "//Chan in here"
    comms_match_out = "//Chan out here"
    core_check_match = "//Insert core_list Here"
    print_thread_match = "//Do print here"
    replacements = getReplacementsPrims(typeOfEditing)
        
    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    editFile = open(PRIMS_BODY_BASE_PATH)
    for line in editFile:
        if main_match in line:
            if appList.index("prim") == 0:
                if len(appList) == 1:
                    arguments = "chanend c_in, unsigned shouldIRun, chanend control_channel"
                else:
                    arguments = "chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel"
            elif appList.index("prim") < len(appList) - 1:
                arguments = "chanend c_in, chanend c_out, unsigned shouldIRun"
            else:
                arguments = "chanend c_in, unsigned shouldIRun"
            newFile.write("void prim_main(" + arguments + "){\n")
        elif comms_match_in in line:
            newFile.write("\tc_in :> foo;\n")
        elif comms_match_out in line:
            if (appList.index("prim") < (len(appList) - 1)):
                newFile.write("\tc_out <: 42;\n")  
            else:
                newFile.write(line)
        elif core_check_match in line:
            newFile.write(line)
            for i in xrange(len(coreList)):
                line = "core_list_prim[" + str(i) + "] = " + str(coreList[i]) + ";\n"
                newFile.write(line)
        elif create_match in line:
            newFile.write("client_createThread(" + str(appList.index("prim")) + ",100,i,core_list_prim[i]);\n")
        elif print_thread_match in line:
            newFile.write(line)
            if(typeOfEditing=='time' or typeOfEditing=='ratio'):
                newFile.write("if(rank==" + str(threadNum)+") printMany(1,printer);\n")
        else:
            for src,target in replacements.iteritems():
                line = (line.replace(src,target))
            newFile.write(line)
    newFile.close()
    os.close(fh)
    editFile.close()
    os.remove(PRIMS_BODY_PATH)
    shutil.move(abs_path,PRIMS_BODY_PATH)

    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    editFile = open(PRIMS_CHECK_BASE)
    for line in editFile:
        if core_check_match in line:
            newFile.write(line)
            for i in xrange(len(coreList)):
                line = "core_list_prim[" + str(i) + "] = " + str(coreList[i]) + ";\n"
                newFile.write(line)
        else:
            newFile.write(line)

    newFile.close()
    os.close(fh)
    editFile.close()
    os.remove(PRIMS_CHECK_PATH)
    shutil.move(abs_path,PRIMS_CHECK_PATH)

def editSobelBody(coreList, typeOfEditing, threadNum,appList):
    global SOBEL_BODY_PATH
    global SOBEL_BODY_BASE_PATH

    create_match = "client_createThread(0,100,i,core_list_sobel[i]);"
    main_match = "void sobel_main"
    comms_match = "//Chan in-outs here"
    core_check_match = "//Insert core_list Here"
    print_thread_match = "//Do print here"
    replacements = getReplacementsSobel(typeOfEditing)
        
    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    editFile = open(SOBEL_BODY_BASE_PATH)
    for line in editFile:
        if main_match in line:
            if appList.index("sobel") == 0:
                if len(appList) == 1:
                    arguments = "chanend c_in, unsigned shouldIRun, chanend control_channel"
                else:
                    arguments = "chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel"
            elif appList.index("sobel") < len(appList) - 1:
                arguments = "chanend c_in, chanend c_out, unsigned shouldIRun"
            else:
                arguments = "chanend c_in, unsigned shouldIRun"
            newFile.write("void sobel_main(" + arguments + "){\n")
        elif comms_match in line:
            newFile.write("\tc_in :> foo;\n")
            if (appList.index("sobel") < (len(appList) - 1)):
                newFile.write("\tc_out <: 42;\n")  
            else:
                newFile.write(line)
        elif core_check_match in line:
            newFile.write(line)
            for i in xrange(len(coreList)):
                line = "core_list_sobel[" + str(i) + "] = " + str(coreList[i]) + ";\n"
                newFile.write(line)
        elif create_match in line:
            newFile.write("client_createThread(" + str(appList.index("sobel")) + ",100,i,core_list_sobel[i]);\n")
        elif print_thread_match in line:
            newFile.write(line)
            if(typeOfEditing=='time' or typeOfEditing=='ratio'):
                newFile.write("if(rank==" + str(threadNum)+") printMany(1,printer);\n")
        else:
            for src,target in replacements.iteritems():
                line = (line.replace(src,target))
            newFile.write(line)
    newFile.close()
    os.close(fh)
    editFile.close()
    os.remove(SOBEL_BODY_PATH)
    shutil.move(abs_path,SOBEL_BODY_PATH)

def editBlurBody(coreList,typeOfEditing,threadNum,appList):
    global BLUR_BODY_PATH
    global BLUR_BODY_BASE_PATH

    create_match = "client_createThread(0, 100, rank + 1, nextCore);"
    comms_match = "//Chan in-outs here"
    main_match = "void blur_main"
    match_main = "//client_createThread(0, 100, 0,"
    match_coreList = "//Put Switch Statement Under Here"
    print_thread_match = "//Insert Printing Here"
    replacements = getReplacementsBlur(typeOfEditing)
    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    editFile = open(BLUR_BODY_BASE_PATH)
    for line in editFile:
        if main_match in line:
            if appList.index("blur") == 0:
                if len(appList) == 1:
                    arguments = "chanend c_in, unsigned shouldIRun, chanend control_channel"
                else:
                    arguments = "chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel"
            elif appList.index("blur") < len(appList) - 1:
                arguments = "chanend c_in, chanend c_out, unsigned shouldIRun"
            else:
                arguments = "chanend c_in, unsigned shouldIRun"

            newFile.write("void blur_main(" + arguments + "){\n")
        elif comms_match in line:
            newFile.write("\tc_in :> foo;\n")
            if appList.index("blur") < len(appList) - 1:
                newFile.write("\tc_out <: 42;\n")
        elif match_main in line:
            line =   "client_createThread(" + str(appList.index("blur")) + ", 100, 0," + str(coreList[0]) + ");\n"
            newFile.write(line)
        elif create_match in line:
            newFile.write("client_createThread(" + str(appList.index("blur")) +", 100, rank + 1, nextCore);\n")
        elif match_coreList in line:
            newFile.write(line)
            newFile.write("switch(rank){\n")
            for i in xrange(len(coreList)-1):
                newFile.write("case " + str(i) + ": " + "nextCore = " + str(coreList[i+1]) + ";\n")
                newFile.write("break; \n")
            newFile.write("}\n")
        elif print_thread_match in line:
            newFile.write(line)
            if(typeOfEditing=='time' or typeOfEditing=='ratio'):
                newFile.write("if(rank==" + str(threadNum)+") printMany(1,printer);\n")
        else:
            for src,target in replacements.iteritems():
                line = (line.replace(src,target))
            newFile.write(line)
    newFile.close()
    os.close(fh)
    editFile.close()
    os.remove(BLUR_BODY_PATH)
    shutil.move(abs_path,BLUR_BODY_PATH)

def editBlurHeader(coreList,appList):
    numChildren = len(coreList)
    match_header_xc = "void blur_main(chanend c_in"
    match_header_c = "void blur_main(unsigned c_in"
    match_children = "#define STAGES_OF_PIPELINE "
    baseFile = open(BLUR_HEADER_BASE_PATH)
    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    for line in baseFile:
        if match_children in line:
            newFile.write(match_children + str(numChildren) + "\n")
        elif match_header_xc in line:
            if appList.index("blur") == 0:
                if len(appList) == 1:
                    arguments = "chanend c_in, unsigned shouldIRun, chanend control_channel"
                else:
                    arguments = "chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel"
            elif appList.index("blur") < len(appList) - 1:
                arguments = "chanend c_in, chanend c_out, unsigned shouldIRun"
            else:
                arguments = "chanend c_in, unsigned shouldIRun"

            newFile.write("void blur_main(" + arguments + ");\n")
        elif match_header_c in line:
            if appList.index("blur") == 0:
                if len(appList) == 1:
                    arguments = "unsigned c_in, unsigned shouldIRun, unsigned control_channel"
                else:
                    arguments = "unsigned c_in, unsigned c_out, unsigned shouldIRun, unsigned control_channel"
            elif appList.index("blur") < len(appList) - 1:
                arguments = "unsigned c_in, unsigned c_out, unsigned shouldIRun"
            else:
                arguments = "unsigned c_in, unsigned shouldIRun"

            newFile.write("void blur_main(" + arguments + ");\n")
        else:
            newFile.write(line)

    newFile.close()
    os.close(fh)
    baseFile.close()
    os.remove(BLUR_HEADER_PATH)
    shutil.move(abs_path,BLUR_HEADER_PATH)

def editPrimHeader(coreList,appList):
    numChildren = len(coreList)
    match_header_xc = "void prim_main(chanend c_in"
    match_header_c = "void prim_main(unsigned c_in"

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
        elif match_header_xc in line:
            if appList.index("prim") == 0:
                if len(appList) == 1:
                    arguments = "chanend c_in, unsigned shouldIRun, chanend control_channel"
                else:
                    arguments = "chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel"
            elif appList.index("prim") < len(appList) - 1:
                arguments = "chanend c_in, chanend c_out, unsigned shouldIRun"
            else:
                arguments = "chanend c_in, unsigned shouldIRun"

            newFile.write("void prim_main(" + arguments + ");\n")
        elif match_header_c in line:
            if appList.index("prim") == 0:
                if len(appList) == 1:
                    arguments = "unsigned c_in, unsigned shouldIRun, unsigned control_channel"
                else:
                    arguments = "unsigned c_in, unsigned c_out, unsigned shouldIRun, unsigned control_channel"
            elif appList.index("prim") < len(appList) - 1:
                arguments = "unsigned c_in, unsigned c_out, unsigned shouldIRun"
            else:
                arguments = "unsigned c_in, unsigned shouldIRun"

            newFile.write("void prim_main(" + arguments + ");\n")
        else:
            newFile.write(line)

    newFile.close()
    os.close(fh)
    baseFile.close()
    os.remove(PRIMS_HEADER_PATH)
    shutil.move(abs_path,PRIMS_HEADER_PATH)

def editSobelHeader(coreList,appList):
    numChildren = len(coreList)
    match_header_xc = "void sobel_main(chanend c_in"
    match_header_c = "void sobel_main(unsigned c_in"

    match_x = "#define DIV_DEGREE_X_SOBEL "
    match_y = "#define DIV_DEGREE_Y_SOBEL "
    match_width = "#define IMG_WIDTH_SOBEL "
    match_length = "#define IMG_LENGTH_SOBEL "
    match_children = "#define NUM_CHILDREN_SOBEL "

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

    baseFile = open(SOBEL_HEADER_BASE_PATH)
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
            newFile.write(match_width + str(div_x*4) + "\n")
        elif match_length in line:
            newFile.write(match_length + str(div_y*4) + "\n")
        elif match_header_xc in line:
            if appList.index("sobel") == 0:
                if len(appList) == 1:
                    arguments = "chanend c_in, unsigned shouldIRun, chanend control_channel"
                else:
                    arguments = "chanend c_in, chanend c_out, unsigned shouldIRun, chanend control_channel"
            elif appList.index("sobel") < len(appList) - 1:
                arguments = "chanend c_in, chanend c_out, unsigned shouldIRun"
            else:
                arguments = "chanend c_in, unsigned shouldIRun"

            newFile.write("void sobel_main(" + arguments + ");\n")
        elif match_header_c in line:
            if appList.index("sobel") == 0:
                if len(appList) == 1:
                    arguments = "unsigned c_in, unsigned shouldIRun, unsigned control_channel"
                else:
                    arguments = "unsigned c_in, unsigned c_out, unsigned shouldIRun, unsigned control_channel"
            elif appList.index("sobel") < len(appList) - 1:
                arguments = "unsigned c_in, unsigned c_out, unsigned shouldIRun"
            else:
                arguments = "unsigned c_in, unsigned shouldIRun"

            newFile.write("void sobel_main(" + arguments + ");\n")
        else:
            newFile.write(line)

    newFile.close()
    os.close(fh)
    baseFile.close()
    os.remove(SOBEL_HEADER_PATH)
    shutil.move(abs_path,SOBEL_HEADER_PATH)

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

    for x in xrange(len(appList)):
        for i in xrange(4):
            f.write(values[4+4*x+i] + ",")

    difference = 3 - len(appList)

    for j in xrange(difference):
        if j == difference - 1:
            lim_k = 3
        else:
            lim_k = 4
        for k in xrange(lim_k):
            f.write(",")
        
    f.write("\n")
    f.close()        

# Need to add power or not power functionality
def editMCMain_initialFunctions(appList,parentCores):
    global MCMAIN_BASE_PATH
    global MCMAIN_PATH
    global INITIALFUNCTIONS_PATH_BASE
    global INITIALFUNCTIONS_PATH
    global MAXCORES

    cur_line = 0
    next_line = 0
    def_cores_match = "#define NCORES "
    initials_match = "void (*starts[NUMBEROFSTARTS])(unsigned,unsigned) ;"
    num_starts_match = "#define NUMBEROFSTARTS "
    channel_match = "chan k;"
    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    baseFile = open(MCMAIN_BASE_PATH)
    sortedcores = sorted(parentCores)

    z = 0

    for line in baseFile:
        if def_cores_match in line:
            newFile.write(def_cores_match +"(" + str(MAXCORES) + ")\n")
        elif channel_match in line:
            newFile.write(line)
            if len(appList) > 1:
                if len(appList) > 2:
                    newFile.write("\tchan p[" + str(len(appList) - 1) + "];\n")
                else:
                    newFile.write("\tchan p;\n")
            while(cur_line < MAXCORES):
                newFile.write("\n")
                newFile.write("\n")
                if z < len(sortedcores) or cur_line < 2:
                    if cur_line != sortedcores[z] and cur_line > 1:
                        newFile.write("\tpar (int i = " + str(cur_line) + "; i < " + str(sortedcores[z]) + " ; i += 1) {\n")
                        newFile.write("\ton stdcore[i] : nOS_start(c[i],c[i+1],0) ;\n")
                        next_line = sortedcores[z]
                    elif cur_line == 0:
                        newFile.write("\tpar (int i = 0 ; i < 1 ; i += 1) {\n")
                        newFile.write("\ton stdcore[i] : nOS_start(c[i],c[i+1],0) ;\n")
                        newFile.write("\ton stdcore[i] : startSync(c[i]) ;\n")
                        next_line = 1
                    elif(cur_line == 1):
                        newFile.write("\tpar (int i = 1 ; i < 2 ; i += 1) {\n")
                        newFile.write("\ton stdcore[i] : nOS_start(c[i],c[i+1],0) ;\n")
                        newFile.write("\ton stdcore[i] : powerMeasure(k) ;\n")
                        next_line = 2
                    else:
                        newFile.write("\tpar (int i = " + str(cur_line) + "; i < " + str(cur_line+1) + " ; i += 1) {\n")
                        newFile.write("\ton stdcore[i] : nOS_start(c[i],c[i+1],0) ;\n")
                        next_line = cur_line+1
                    
                    while(z < len(sortedcores)):
                        if sortedcores[z] == cur_line:
                            if parentCores.index(sortedcores[z]) == 0:
                                if len(appList) > 1:
                                    if len(appList) == 2:
                                        newFile.write('\ton stdcore[i] : ' + str(appList[parentCores.index(sortedcores[z])]) + '_main(c[NCORES],p,1,k) ; \n')
                                    else:
                                        newFile.write('\ton stdcore[i] : ' + str(appList[parentCores.index(sortedcores[z])]) + '_main(c[NCORES],p[0],1,k) ; \n')
                                else:
                                    newFile.write('\ton stdcore[i] : ' + str(appList[parentCores.index(sortedcores[z])]) + '_main(c[NCORES],1,k) ; \n')
                            elif parentCores.index(sortedcores[z]) < len(appList) - 1:
                                newFile.write('\ton stdcore[i] : ' + str(appList[parentCores.index(sortedcores[z])]) + '_main(p[' + str(parentCores.index(sortedcores[z])-1) + '],p[' + str(parentCores.index(sortedcores[z])) + '],1) ; \n')
                            else:
                                if len(appList) == 2:
                                    newFile.write('\ton stdcore[i] : ' + str(appList[parentCores.index(sortedcores[z])]) + '_main(p,1) ; \n')
                                else:
                                    newFile.write('\ton stdcore[i] : ' + str(appList[parentCores.index(sortedcores[z])]) + '_main(p[' + str(parentCores.index(sortedcores[z])-1) + '],1) ; \n')
                            parentCores[parentCores.index(sortedcores[z])] = 99
                            z += 1
                        else:
                             break
                    cur_line = next_line            
                    newFile.write("}")        

                else:
                    newFile.write("\tpar (int i = " + str(cur_line) + "; i < " + str(MAXCORES) + " ; i += 1) {\n")
                    newFile.write("\ton stdcore[i] : nOS_start(c[i],c[i+1],0) ;\n")
                    newFile.write("}")
                    cur_line = MAXCORES

        else:
            newFile.write(line)        

                  
    os.close(fh)
    newFile.close()
    baseFile.close()

    os.remove(MCMAIN_PATH)
    shutil.move(abs_path,MCMAIN_PATH)


    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    baseFile = open(INITIALFUNCTIONS_PATH_BASE)

    flag = 0

    for line in baseFile:
        if num_starts_match in line:
            newFile.write(num_starts_match + str(len(appList)) + '\n')
        elif initials_match in line:
            newFile.write(line)
            for y in xrange(len(appList)):
                newFile.write("\tstarts[" + str(y) +"] = " + str(appList[y]) + "_child; \n")
        else:
            newFile.write(line)

    os.close(fh)
    newFile.close()
    baseFile.close()

    os.remove(INITIALFUNCTIONS_PATH)
    shutil.move(abs_path,INITIALFUNCTIONS_PATH)

def addPrim(coreList, measurementType, threadNum, appList):

    #editMCMain("prim",measurePower) #(isMethodRunningPowerMeasurements) ? True : False
    editPrimHeader(coreList,appList)
    editPrimBody(coreList, measurementType, threadNum,appList) # power=1,ratio=2,time=3

def addBlur(coreList,measurementType,threadNum, appList):

    #editMCMain("blur",measurePower)
    editBlurHeader(coreList,appList)
    editBlurBody(coreList,measurementType,threadNum,appList)

def addSobel(coreList,measurementType,threadNum, appList):

    #editMCMain("blur",measurePower)
    editSobelHeader(coreList,appList)
    editSobelBody(coreList,measurementType,threadNum,appList)


def edit_buildfile(appList):
    global BUILDFILE
    global BUILDFILE_BASE

    fh, abs_path = mkstemp()
    newFile = open(abs_path,'w')
    editFile = open(BUILDFILE_BASE)
    lookfor = "mcsc.py"

    for line in editFile:
        if lookfor in line:
            for x in xrange(len(appList)):
                if appList[x] == "prim":
                    line = line + " Swallow-prim.xc Swallow-prim-checks.c"
                elif appList[x] == "blur":
                    line = line + " blur.xc"
                elif appList[x] == "sobel":
                    line = line + " Swallow-sobel.xc"
                else:
                    line = line + " mergesort.xc"
            line = line + " -O3 -o binary.sgb"
        newFile.write(line)

    os.close(fh)
    newFile.close()
    editFile.close()

    os.remove(BUILDFILE)
    shutil.move(abs_path,BUILDFILE)
    os.system("chmod a+x ./build")

def runExperiments(appList,coreNums):

    global values
    global outputfile
    global ratioVals
    global timeVals
    global ratioSum
    global timeSum
    global PARENTCORE_BLUR
    global PARENTCORE_SOBEL
    global PARENTCORE_PRIM
    global PARENTCORE_MERGESORT

    indices = [0] * 3
    states = ["none","none","none","none"]
    appinds = [0] * 3
    upperBound = sum(coreNums)
    lastInd = 0
    cores = [0] * 3
    curLastind = 0
    primflag = 0
    parentcores =[]

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
        lim3 = upperBound - cores[2] + 1
    else:
        lim3 = 1

    #if lastInd >=2:
     #   lim2 = upperBound - cores[1] + 1
    #else:
    lim2 = 1

    if lastInd >=1 and primflag == 0:
        lim1 = upperBound - cores[0] + 1
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
                    coreList.append(range(8,8+coreNums[appList.index("prim")]))
                    apps.append("prim")
                    parentcores.append(PARENTCORE_PRIM)
                if any("blur" in s for s in appList):
                    #coreList.append([12,12,12,12])
                    coreList.append(range(8+indices[appinds[0]],8+indices[appinds[0]]+coreNums[appList.index("blur")]))
                    apps.append("blur")
                    parentcores.append(PARENTCORE_BLUR)
                if any("sobel" in s for s in appList):
                    coreList.append(range(10+indices[appinds[1]],10+indices[appinds[1]]+coreNums[appList.index("sobel")]))
                    apps.append("sobel")
                    parentcores.append(PARENTCORE_SOBEL)
                if any("mergesort" in s for s in appList):
                    coreList.append(range(4+indices[appinds[2]],4+indices[appinds[2]]+coreNums[appList.index("mergesort")]))
                    apps.append("mergesort")
                    parentcores.append(PARENTCORE_MERGESORT)

                abc = []        
                for z in xrange(len(coreList)):
                    temp = str(coreList[z])
                    temp = temp.replace(",","")
                    abc.append(temp)
                #print(values)


                edit_buildfile(apps)
                editMCMain_initialFunctions(apps,parentcores)

                for coreAppIndex in xrange(len(apps)):
                    timeSum = 0
                    ratioSum = 0
                    ratioVals = "["
                    timeVals = "["
                    threadNum = 0
                    i = 0
                    iLim = 2+ 2*coreNums[coreAppIndex]
                    while(i<iLim):
                        if states[coreAppIndex] == "none" :
                            states[coreAppIndex] = "power"
                            if coreAppIndex != 0:
                                i += 1
                                continue
                        elif states[coreAppIndex] == "power":
                            states[coreAppIndex] = "ratio"
                            threadNum = 0
                        elif states[coreAppIndex] == "ratio":
                            if threadNum < coreNums[coreAppIndex] - 1:
                                threadNum += 1
                            else:    
                                states[coreAppIndex] = "time"
                                ratioVals = str(ratioVals) + "]"
                                ratioSum = ratioSum / coreNums[coreAppIndex]
                                values.append(ratioVals)
                                values.append(str(ratioSum))
                                threadNum = 0;
                        else:
                            if threadNum < coreNums[coreAppIndex] - 1:
                                threadNum += 1;
                            else:
                                timeVals = str(timeVals) + "]"
                                timeSum = timeSum / coreNums[coreAppIndex]
                                values.append(timeVals)
                                values.append(str(timeSum))
                                states[coreAppIndex] = "none"
                                i += 1
                                continue

                        if any("prim" in s for s in appList):
                            addPrim(coreList[0],states[0],threadNum,apps)
                        if any("blur" in s for s in appList):
                            addBlur(coreList[appinds[0]],states[appinds[0]],threadNum,apps)
                        if any("sobel" in s for s in appList):
                            addSobel(coreList[appinds[1]],states[appinds[1]],threadNum,apps)
                        if any("mergesort" in s for s in appList):
                            addMergeSort(coreList[appinds[2]],states[appinds[2]],threadNum,apps)

                        print("Now compiling and running " + str(apps) + " on cores" + str(abc) +", getting " + states[coreAppIndex] + " from " + str(apps[coreAppIndex]) + " on thread of rank " + str(threadNum) + "... \n")


                        compileandRun()
                        parseOutput(states[coreAppIndex],threadNum,coreAppIndex)
                        i += 1

                
                print_to_csv(apps,abc,values)


#    if any("prim" in s for s in appList):
#        addPrim(coreNums[appList.index("prim")])

def parseOutput(outputType,threadNum,coreAppIndex):
    global applications
    global values
    global outputreadfile
    global ratioVals
    global timeVals
    global timeSum
    global ratioSum

    readFile = open(outputreadfile,'r')
    outputs = []

    for line in readFile:
        outputs.append(line.split()[1])

    readFile.close()

    for i in xrange(len(outputs)):
        if outputType == "ratio":
            temporary = float(float(int(outputs[i],16))/float(1000))
        else:
            temporary = int(outputs[i],16)

        outputs[i] = str(temporary)

    if outputType == "power":
        values[0:4] = outputs[1:5]
    elif outputType == "ratio":
        if threadNum != 0:
            ratioVals = str(ratioVals) + " " + outputs[0]
        else:
            ratioVals = str(ratioVals) + outputs[0] 
        ratioSum += temporary
    else:
        if threadNum != 0:
            timeVals = str(timeVals) + " " + outputs[0]
        else:
            timeVals = str(timeVals) + outputs[0]
        timeSum += temporary

def compileandRun():
    os.system('./build')
    sleep(5)
    p1 = subprocess.Popen(["python", "run.py", "binary"], stdout=subprocess.PIPE, stdin=subprocess.PIPE)
    sleep(3)

    p1.kill()

def main():
        # dummy example
    global applications
    global chanMax
    global values    
    global outputfile


    applications = []

    applications.append("prim")
    applications.append("blur")
    applications.append("sobel")

    numCores = [4,4,4]


    mode = "append"


    if mode == "append":
        f = open(outputfile,'a')
        f.write('\n')
        f.close()
    else:
        if os.path.exists(outputfile):
            os.remove(outputfile)
        f = open(outputfile,'w+')
        f.write("Application 1, Application 2, Application 3, Cores App 1, Cores App 2, Cores App 3, Power Stripe 1, Power Stripe 2, Power Stripe 3, Power Stripe 4, Ratio App 1, Avg. Ratio 1, Time App 1, Avg. Time 1, Ratio App 2, Avg. Ratio 2, Time App 2, Avg. Time 2, Ratio App 3, Avg. Ratio 3, Time App 3, Avg. Time 3 \n")
        f.close()


  
  

    runExperiments(applications,numCores)



    #print_to_csv(applications,cores,values)


#    for x in (8,12):

#        editFile(x)


# Append to Existing results.csv



    

# Start New File

    


#     add blur

#   add prim's        
    
#        os.system('./build3')

#        sleep(10)

#        p1 = Popen(["python", "run.py", "prim"], stdout=PIPE, stdin=PIPE)
           
#        sleep(10)

# once file(s) are edited, print to the CSV file with 
# application names in a string list (arg1)
# core configurations in array list (arg2)
# values {power stripe 1, power stripe 2, power stripe 3, power stripe 4, comp-to-comm ratio 1, comp-to-comm ratio 2,comp-to-comm ratio 3,exec 1, exec 2, exec 3} 


if __name__ == "__main__":
        main()

