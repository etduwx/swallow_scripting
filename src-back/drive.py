#!/bin/sh

import os, tftpy, subprocess

from time import sleep
from subprocess import Popen, PIPE
from tempfile import mkstemp
from shutil import move
from os import remove, close

match = 'nOS_start'
match_string = "\ton stdcore[i] : nOS_start(c[i],c[i+1],0) ;\n"
do_work_str = "\ton stdcore[i] : doWork();\n"
mc_file_path = 'mcmain_prim.xc'
old_file_path = 'mcmain_prim_back.xc'
old_file_check = 'Swallow-prim-checks_back.c'
prim_checks_path = 'Swallow-prim-checks.c'

aec_path_old = 'Swallow-nOS_back.xc'
aec_path = 'Swallow-nOS.xc'
commented_aec = '\t//enableAEC(STANDBY_CLOCK_DIVIDER) ;\n'
uncommented_aec = '\tenableAEC(STANDBY_CLOCK_DIVIDER) ;\n'

number_stripes = 4

def stripeEdit(a, b, d):
	
	fh, abs_path = mkstemp()
	new_file = open(abs_path, 'w')
	old_file = open(old_file_path, 'r+')

	count =  0
	next = 0

	match_string_1 = list(match_string)
	match_string_1[39] = str(a)
	match_string_1 = "".join(match_string_1)

	match_string_2 = list(match_string)
	match_string_2[39] = str(b)
	match_string_2 = "".join(match_string_2)

	d_index = 0

	for line in old_file:
		if match in line:
			if count < 3 and count != 1:
				new_file.write(match_string_1)
				next = 1
			elif count == 3:
				new_file.write(match_string_2)
				next = 1
			elif count+1 >= number_stripes:
				new_file.write(line)
				next = 1
			else:
				new_file.write(line)
			count += 1
		else:
			if next == 1 and count == 1:
				next += 1
			elif next == 1 and count <= number_stripes+2 and count > 2:
				for i in xrange(0,d[d_index]):
					new_file.write(do_work_str)
				next = 0
				d_index += 1
			elif next == 2:
				for k in xrange(0,d[0]):
					new_file.write(do_work_str)
				next = 0
			new_file.write(line)			

	new_file.close()
	close(fh)
	old_file.close()

	remove(mc_file_path)

	move(abs_path, mc_file_path)

	fk, abs_path_2 = mkstemp()
	new_file_2 = open(abs_path_2, 'w')
	old_file_2 = open(old_file_check, 'r+')
	
	new_count = 1

	for line in old_file_2:
		if "#define" in line and new_count <= number_stripes:
			string = "#define THREAD_NO_" + str(new_count) + " " + str(d[new_count-1]+1) + '\n'
			new_count += 1
			new_file_2.write(string)
		else:
			new_file_2.write(line)

	new_file_2.close()
	close(fk)
	old_file_2.close()

	remove(prim_checks_path)

	move(abs_path_2, prim_checks_path)

def edit_aec(toggle):

	fh, abs_path = mkstemp()

	new_file = open(abs_path, 'w')
	old_file = open(aec_path_old, 'r+')
	count = 0
	
	for line in old_file:
		if count == 187:
			if toggle == 1:
				new_file.write(uncommented_aec)
			else:
				new_file.write(commented_aec)
		else:
			new_file.write(line)
		count += 1

	new_file.close()
	close(fh)
	old_file.close()

	remove(aec_path)

	move(abs_path, aec_path)	

def main1():

	counter = 0			
	
	d = []
	for i in xrange(0, number_stripes):
		d.append(0)

	print "Kill xgdb"
	os.system("killall xgdb")
	print "Running swallow_etherboot"
	p = Popen(["xrun","--io", "--id", "1", "swallow_etherboot.xe"])			

	sleep (10)

	for k in xrange(0,6):
		for l in xrange(0,6):
			for i in xrange(0,4):
				for j in xrange(0,4):
					d[0] = k #first stripe
					d[1] = l #second stripe
					d[2] = 0 #third stripe
					d[3] = 0 #fourth stripe
					stripeEdit(i, j, d)
					os.system('./build3')

					p1 = Popen(["tftp", "192.168.128.3"], stdout=PIPE, stdin=PIPE)
					output = p1.communicate("mode binary\nput prim.sgb")

					
					counter += 1
					file1 = open("count.txt", "w+")
					file1.write(str(counter)+'\n')
					file1.close()
					print str(counter)+'\n'

					sleep(10)
			# do aec stuff
			edit_aec(1)
			os.system('./build3')

			p1 = Popen(["tftp", "192.168.128.3"], stdout=PIPE, stdin=PIPE)
			output = p1.communicate("mode binary\nput prim.sgb")

			edit_aec(0)

			counter += 1
			file1 = open("count.txt", "w+")
			file1.write(str(counter)+'\n')
			file1.close()			
			print str(counter)+'\n'
			
			sleep (10)

			print "Kill xgdb"
			os.system("killall xgdb")
			print "Running swallow_etherboot"
			p = Popen(["xrun","--io", "--id", "1", "swallow_etherboot.xe"])			
			
			sleep(10)

	os.system("rm cc*")

if __name__ == "__main__":
	main()
