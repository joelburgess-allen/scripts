try:
    score = raw_input('Enter Score:')
    s = float(score)
except:
    print "Error, please enter numeric input"
    quit()

if s < 0.0 or s > 1.0:
    print 'Error: a score must be between 0 and 1'
else:
    if s >= 0.9:
        print 'A'
    elif s >= 0.8:
        print 'B'
    elif s >= 0.7:
        print 'C'
    elif s >= 0.6:
        print 'D'
    else:
        print 'F'