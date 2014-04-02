<!-- Swallow Experiment Automation Script v0.1
Author: Edward Ma
GitHub: https://github.com/etduwx/swallow_scripting
Last Updated: 1 Apr 2014 by Edward Ma
-->

Changelog:

1 Apr 2014:
	- Versioning begins at v0.1
	- Added README

Files described in this README:

	- results.csv
	- ru.py
	- run.py
	- script.py

Preface: This document is intended to supplement the inline code comments of the Swallow experiment scripting environment. For ease of reading and better format, the code in script.py has been sectioned into different numbers, and this document will refer to each section with the number with which it is labeled in the code comments. Before the longest file (script.py) is introduced, we first describe the supplemental files:

results.csv : This is the CSV (comma-separated-values) file in which results from the scripts are automatically placed and formatted. Each ROW of the CSV represents the results of a single run, for which power and performance values are measured and kept. The columns are outlined below (note that it is much easier to view these results when opened in a spreadsheet application like Excel):
	
Column(s) #:

1-3: These are the applications in use for the particular run whose results are described by the numbers in the particular row. At the moment, note that there are only three columns for applications, but in the short-term future I intend to modify the script in such a way that it does not have any limitation. A blank entry for a row means that that app slot is not used.

4-6: These are the cores to which the child threads have been assigned. The length of each array corresponds to the number of child threads that the application in column n-3 has been told to spawn. For example, if in row 3 column 4 there is an entry of [20 21 22 23], and in row 3 column 1 the name there is "Blur", then in the run that is described by row 3, blur has been told to run with a degree of parallelization 4, and to create child threads on logical cores 20-23. Note that there can be overlap of core assignments for different applications, including reuse (i.e, it's usually okay to have something like [20 20 20 20] for one app, though in certain situations apps will break for some configurations)

7-9: Parent core logical ids for apps in column n-6.

10-13: Power Measurements (averaged) for stripes 1-4 on the board. Each stripe corresponds to 4 cores on a particular layer of Swallow. Column 10 is the measurement of the first four cores (top row) of the layer on which the power measurement thread goes. So if the thread is running on core 17, then column 10's reading is the averaged power measurement for cores 16-20 on that run, column 11 is for cores 21-24, and so forth. We refer to these rows as "top", "middle-top", "middle-bottom", and "bottom", or T,MT,MB,and B (Simon's terminology).

14-17 (App 1),18-21 (App 2),22-25 (App 3): These last columns are grouped in four columns each, one group for each application. The first of these is the ratio of time spent in computation to total execution time for each thread (min 0, max 1). Again, the length of the array corresponds to the number of child threads.  The second of these columns is the average of the first, of all threads. The third is an array of thread-level completion times (in reference clock cycles). The fourth is an average of the third.

ru.py: For easy running on the fly without the whole tftp'ing, setting mode to binary, and putting the binary manually on Swallow by sending it across the etherboot connection, you can use ru.py (shortened name from run.py, which is used by the script). Example usage:
	
	python ru.py binary

if the name of the binary that you want to run is named binary.sgb. This is useful for debugging purposes if you can isolate an error source to fix it using xgdb before running everything in automated format using the script.

run.py: This is used by the script.py script. All it does it start the etherboot if it isn't started, and put the new binary (after compilation) onto Swallow after a certain delay (can't send things too fast or we may not have enough time for Swallow to produce results from previous run iteration)

script.py: 

This script is the main python file that is to be executed when we want to automate experiments. This README will explain things section by section. To use, simply run "python script.py" (no further arguments). Whilst running, the script will print to the console what it's currently doing (what applications it's running on which cores). It works by editing the required files of the application and the other source files (headers, mcmain, build) and compiling things automatically for each iteration. Once the results are produced in the form of prints, those prints are taken and parsed into the results.csv file in a new row, before it changes the config up slightly and repeats itself.

Section by Section description and explanation: <!-- To be Completed -->

HOW TO USE:

Without a complete breakdown of what each section does, this will allow you to quickly get started with using the script by knowing how to change parameters quickly and easily.

For any given experiment, you'll want to have a few applications that you want to test in various configurations. First, you'll want to define the parent-thread cores for the applications that you want to run. You should do so by changing the values of the variables defined at the top of the file, like these:

PARENTCORE_PRIM = 25
PARENTCORE_SOBEL = 20
PARENTCORE_BLUR = 31
PARENTCORE_MERGESORT = 1

Next, say you want to run sobel with 4 children on cores 20-23, with the parent on core 25, along with blur with parent on 31, with children on the same 20-23 cores. Set PARENTCORE_SOBEL to 25 and PARENTCORE_BLUR to 31. Next, search for the following string in the file:

# CORE DEFINITION SECTION

Below it, you'll see some loops set up (three at the moment, because we I have it set up to run up to three apps simultaneously)

    for i in lim1:
        indices[0] = i
        for j in xrange(lim2):
            indices[1] = j
            for k in xrange(lim3):


These loops are there to easily iteratively test different configurations of core placements for each application. The list of cores for each child thread of a given application is actually defined in an array below, like the following: 


	coreList.append([28,29,30,31])

in its bigger context:

	if any("prim" in s for s in appList):   
                    coreList.append([28,29,30,31])
                    apps.append("prim")
                    parentcores.append(PARENTCORE_PRIM)

     as you can guess, for the prim's application. You may notice that in this case I only wanted to test prim's on those cores specifically, and those loops up there don't serve any particular purpose, so I set the limits (lim1, lim2, lim3) to 1. If I wanted to iteratively shift core placements to get different results each time to see how moving threads around affected things, I could do something like 

          coreList.append(range(20+i,24+i))

      Then as i updates the cores on which the children are placed shift as well.

For now ignore the "mode", and leave it as "normal". This param was introduced in order to allow for testing of both the random and dynamic thread placement routines. However, if you'd like to test it out, set it to either "dynamic" or "random" and they will invoke the dynamic or random thread create routines (defined in Swallow_nOS_client.xc). Note that this makes the core specifications above meaningless. Note that "random", for an as yet undetermined reason, still does not work properly and crashes the system.

Finally, in the main section of the code:

def main():


you should add to the applications array with append the apps that you want to use this time, e.g.:

 	applications.append("sobel")
    applications.append("blur")

.

then you can set the mode 

 mode = "append+"

 to either append+ or new. append+ appends to the existing results.csv file by adding a newline first, new creates a new file altogheter (deletes the old!)


This should be enough to get you started, but let me know if you have any more questions. Throughout the week, I'll add more to this README and make things more detailed. I'm sorry that the code is messy, but I originally wrote them up to get results as quickly as possible, without consideration of making things elegant and neat. Feel free to improve upon the script, but as good practice from now on document the changes.





