name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

hours = {}
for line in handle:
	line = line.rstrip()
	if not line.startswith("From "):
		continue
	hour =  line[line.find(":")-2:line.find(":")]
	hours[hour] = hours.get(hour,0) + 1

list_hours = []
for key, value in hours.items():
	list_hours.append( (key,value) )

list_hours.sort()

for key, value in list_hours:
	print key, value
