msg = 'Please enter an integer great than 2'

def check(value):
    try:
        value = float(value)
    except:
        print msg
        print '\"' + value + '\"'+ ' is NOT a Number!'
        quit()
    if value - int(value) != 0:
        print msg
        print str(value) + ' is NOT an integer'
        quit()
    elif value <= 2:
        print msg
        print str(int(value)) + ' is NOT > 2'
        quit()
    return int(value)

def checkdividers(number):
    x = 2
    dividers = []
    while x < number:
        if number % x == 0:
            dividers.append(x)
        x += 1
    return dividers

def checkprime(dividerslist):
    if len(dividerslist) == 0:
        return True

def checkdividerspairs(number):
    x = 2
    key = 1
    pairs = {}
    while x < number:
        if number % x == 0:
            templist = []
            y = number / x
            templist.append(x)
            templist.append(y)
            pairs[key] = templist
            key += 1
        x += 1
    return pairs

def minsumfinder(input_value):
    if checkprime(checkdividers(num)) is True:
        print 'Prime Number'
        quit()
    else:
        print 'Non-Prime, so let\'s play'
        mutlidict = checkdividerspairs(num)    
        minpair = []
        minsum = None
        for i in mutlidict:
            if minsum is None or minsum > mutlidict[i][0] + mutlidict[i][1]:
                minsum = mutlidict[i][0] + mutlidict[i][1]
                minpair = mutlidict[i]
        return minpair

### user input    
num = raw_input('Enter integer greater than 2: ')

### processing the shizzle
num = check(num)

### outputtting the shizzle, if it adheres to our strong beliefs
print minsumfinder(num)