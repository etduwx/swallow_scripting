import sys

in_name = 'output.txt'
out_name = 'output.csv'

header = "FreqDivider, Threads Running, Power Stripe 1, Power Stripe 2, Power Stripe 3, Power Stripe 4, Completion Time 1, Completion Time 2, Completion Time 3, Completion Time 4, Maximum Completion Time, Average Completion Time, Strip1 Energy (microJ), Strip 2 Energy (microJ), Strip 3 Energy (microJ), Strip 4 Energy (microJ), Total Energy (microJ)\n"

#converts to microJ
divisor = 100000

#num_stripes = 4

def data_check():
	num_finished = 0
	input_file = open(in_name, 'r')
	for line in input_file:
		if len(line.split(',')) > 2:
			num_finished += 1
	if num_finished != 612:
		print "Only finished " + str(num_finished) + "\n"
		sys.exit(0) 
	input_file.close()

def get_info(num):
	str1 = (num%17)/4
	str2 = (num%17)%4
	dow1 = (num%102)/17 + 2
	dow2 = num/102 + 2
	if str1 == 4:
		return_str = ("AEC,", str(dow1)+"/"+str(dow2)+"/0/0")
	else:
		return_str = (str(str1)+"/"+str(str2)+"/0/0,", str(dow1)+"/"+str(dow2)+"/0/0")
	return return_str

def data_read():
	
	in_fd = open(in_name, 'r')
	out_fd = open(out_name, 'w+')

	csvline = ['','','','','','','','']
	maxint = 0
	count = 0
	secondary_count = 0
	total_count = 0

	for line in in_fd:

		edit = line.split(',')
		if secondary_count == 0:
			secondary_count += 1
			out_fd.write(header)
			continue

		elif len(edit) == 1:
			total_count = int(edit[0])
			if count != 0:
				count = 0
				csvline = ['','','','','','','','']
			continue

		elif len(edit) == 2:
			csvline[int(edit[0])+4] = edit[1].strip('\n')

			if int(edit[1]) > maxint:
				maxint = int(edit[1])

		elif len(edit) > 2:

			for i in xrange(0,4):
				csvline[i] = edit[i+1]
		else:
			print "Improper data"

		if count == 4:
			tot_energy = 0
			csvline.append(" "+str(maxint))

			temp_list = map(int, csvline)
			csvline.append(" "+str(sum(temp_list[4:8])/4))
			
			for j in xrange(0,4):
				num = temp_list[j]*maxint/float(divisor)
				csvline.append(' '+str(num))
				tot_energy += num

			csvline.append(" "+str(tot_energy))
			csvline.insert(0, get_info(total_count)[1])
			csvline.insert(0, get_info(total_count)[0])
			out_fd.write("".join(csvline).replace(' ', ',').lstrip(',')+'\n')
			if "AEC" in get_info(total_count)[0]:
				out_fd.write('\n')
			csvline = ['','','','','','','','']
			maxint = 0
			count = 0
		else:
			count += 1


	in_fd.close()
	out_fd.close()

def main():
	#data_check();
	data_read();


if __name__ == "__main__":
	main()
