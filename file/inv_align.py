# -*- coding=utf-8 -*-
import argparse
import re

#构建命令行输入参数处理方法
parser = argparse.ArgumentParser()

#定义输入文件，输出文件
parser.add_argument('file')

#解析并获取参数
args = parser.parse_args()
#输入文本的路径
i_file = args.file

def clr_line(line):
	line = re.sub(' ','',line)
	line = re.sub('\n','',line)
	line = re.sub(';','',line)
	line = re.sub(',','',line)
	return line

def clr_inout(line):
	line = re.sub('input','',line)
	line = re.sub('output','',line)
	line = re.sub('inout','',line)
	return line

def match_io(string):
	stri = ''
	if(re.match('inout',string)):
		stri = 'inout'
	elif(re.match('input',string)):
		stri = 'input'
	elif(re.match('output',string)):
		stri = 'output'
	else:
		stri = ''
	return stri

def elt(i_file):
	fi = open(i_file,'r')
	dst_name = "dst.v"
	fo = open(dst_name,'w')
	lines = fi.readlines()
	for line in lines:
		line=clr_line(line)
		if(re.match('module',line)):
			line = line + '\n'
		elif(re.match('input',line)  or re.match('output',line) or re.match('inout',line)  ):
			line = line + '\n'
		else:
			line = ""
		fo.write(line)

	fi.close()
	fo.close()

def align():
	fi = open("dst.v",'r')
	fo = open('inst.v','w')
	lines = fi.readlines()
	longest = 0 ;
	str_len = 0 ;
	for line in lines:
		if(re.match('module',line)):
			str_len = str_len
		else:
			line = clr_line(line)
			str_len = len(line)
			if(longest < str_len):
				longest = str_len

	for line in lines:
		if(re.match('module',line)):
			line = line 
		elif (re.search('\[',line)):
			line = clr_line(line)
			line = clr_inout(line)
			a = line.index('[',0,len(line))
			b = line.index(']',0,len(line))
			arr = line[int(a):int(b)+1]
			line = line[int(b)+1:]
			arr = arr.ljust(10,' ')
			sig_name = line.ljust(longest,' ')
			line = "wire" +"    " + arr + "    " + sig_name +';'+ '\n'
		else:
			line = clr_line(line)
			line = clr_inout(line)
			sig_name = line.ljust(longest,' ')
			line = "wire"+"    " +'              '+sig_name +';' + '\n'
		fo.write(line)
	
	for line in lines:
		if(re.search('module',line)):
			line = re.sub(' ','',line)
			line = re.sub(';','',line)
			line = re.sub('module','',line)
			line = re.sub('\n','',line)
			line = line + '\t' + 'i_' +line + '(' +'\n'
		elif (re.search('\[',line)):
			io_st =match_io(line)
			line=clr_line(line)
			a = line.index('[',0,len(line))
			b = line.index(']',0,len(line))
			sub_line =line[int(b)+1:]
			sig_name = sub_line.ljust(longest,' ')
			print(line)
			line='.'+sig_name+'( '+sig_name+' )'+','+" //"+ io_st.ljust(8,' ')+line[a:b+1]+'\n'
		else:
			io_st = match_io(line)
			line=clr_line(line)
			line=clr_inout(line)
			sig_name = line.ljust(longest,' ')
			line = "."+sig_name+'( '+sig_name+" )"+','+' //'+ io_st.ljust(8,' ') +'[0:0]'+'\n'
		fo.write(line)
	fo.write(');')
	fi.close()
	fo.close()

if __name__ == '__main__':
	elt(i_file)
	align()






