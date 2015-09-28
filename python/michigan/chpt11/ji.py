import re

# Settlement of DE.USD_2015Z\nWHEN\nDate is from 04/16/2014 to 04/16/2015\n

handle = open("ji.txt")

for line in handle:
    line = line.strip()
    if len(line) == 0: continue
    line_split = line.split('SHOW')
    for i in line_split:
        x=re.findall('(Settlement.*?)\\\\',i)
        y=re.findall('(Date.*)\\\\',i)
        if len(x) > 0 and len(y) > 0: print x[0], y[0]



