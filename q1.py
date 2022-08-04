#!/usr/bin/env python3

import re

datafile=open("./DataFiles/hosts.real","r")

next(datafile)

import re
with open('./DataFiles/hosts.real', 'r') as infile, open('file2', 'w') as outfile:
    temp = re.sub("#.*", "", datafile.read())
    outfile.write(temp)


with open('file2', 'r') as infile, open('file3', 'w') as outfile: 
    temp = re.sub("([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})", "", infile.read())
    outfile.write(temp)


datafile1=open("file3","r")
with open('file3', 'r') as infile, open('output_for_q1', 'w') as outfile: 
    outfile.write('HostName -> IP\n')
    for line in infile:
        line = line.split()
        if len(line)>0:
            line = ', '.join(line[1:]) + ' -> ' +line[0]
            outfile.write(line+'\n')


datafile1.close()
infile.close()
datafile.close()