# Use the file name mbox-short.txt as the file name
fname = raw_input("Enter file name: ")
fh = open(fname)
count = 0
total_val = 0
for line in fh:
    if not line.startswith("X-DSPAM-Confidence:"): 
        continue
    val = float(line[line.find(':') + 2:].strip())
    total_val += val
    count += 1

avg = total_val / count

print 'Average spam confidence:', avg
