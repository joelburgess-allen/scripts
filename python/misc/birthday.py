people = raw_input('Number of People: ')

try:
    people = int(people)
except:
    print 'You must enter a positive integer'
    quit()

if people == 1:
    print "Obviously one person can't share a birthday with anyone"
    quit()

# Ignore leap years, therefore 365 days in the year

iterations = people - 1
numerator = 1
for x in range(iterations):
    iter_num = 364 - x
    numerator *= iter_num

denominator = 365 ** iterations

prob = 1 - (float(numerator) / denominator)

print prob


