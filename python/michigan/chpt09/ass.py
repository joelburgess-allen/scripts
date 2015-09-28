name = raw_input("Enter file:")
if len(name) < 1 : name = "mbox-short.txt"
handle = open(name)

address = {}

for line in handle:
   if not line.startswith("From:"):
      continue
   name = line.split()[1]
   address[name] = address.get(name,0) + 1
	 
"""    
bigcount = None
bigname = None
for i in address:
   if bigcount is None or address[i] > bigcount:
      bigcount = address[i]
      bigname = i
print bigname, bigcount
"""

bigcount = None
bigname = None
for name,count in address.items():
   if bigcount is None or count > bigcount:
      bigcount = count
      bigname = name

print bigname, bigcount
