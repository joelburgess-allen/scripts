fh = open('romeo.txt')
lst = list()

for line in fh:
    lst.append(line.rstrip().split())

words_used = list()

for line in range(len(lst)):
    for word in lst[line]:
        if word not in words_used:
            words_used.append(word)

print sorted(words_used)
