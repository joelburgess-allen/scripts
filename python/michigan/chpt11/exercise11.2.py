import re

handle = open("mbox-short.txt")

value_list = []

for line in handle:
    line = line.rstrip()
    x = re.findall('^New Revision: (\d+)',line)
    if len(x) > 0:
        value_list.append(int(x[0]))

total = 0

for i in value_list:
    total += i

print total 
print len(value_list)
print total * 1.0 / len(value_list)
