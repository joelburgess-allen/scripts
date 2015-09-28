import re 

example = ' firstname.secondname.thirdname'

greed = re.findall('^\s(\S+)\.',example)
print greed

nongreed = re.findall('\s(\S+?)\.',example)
print nongreed

x = 'From: Using the :character'
y = re.findall('^F.+:',x)
print y
y1 = re.findall('^F.+?:',x)
print y1

nongreed = re.findall('(\S+?)\.',example)
print nongreed

for i in range(len(nongreed)):
    print nongreed[i]