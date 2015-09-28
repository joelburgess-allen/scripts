import re

name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

#print '*** non regex ****'
#
#for line in handle:
#    line = line.rstrip()
#    if line.startswith('From:'):
#        start = line.find(' ')
#        end = line.find('@',start)
#        print line [start + 1:end]

#print '*** one ***'
#
#for x in open("mbox-short.txt"):
#    x = x.rstrip()
#    if re.search('^From:\s\S',x):
#        y = re.findall('^From:\s(\S*)@',x)
#        print y
#        
#print '*** two ***'

namedict = dict()

for line in open("mbox-short.txt"):
    line = line.rstrip()
    name = re.findall('^From:\s(\S*)@',line)
    if len(name) < 1:
        continue
    else:
        name = name[0]
        namedict[name] = namedict.get(name,0) + 1


print namedict


for line in open ("mbox-short.txt"):
    line = line.rstrip()
    proc = re.findall('^X-DSPAM-Processed:\s\S+\s(\S+)',line)
    if len(proc) >= 1:
        print proc
