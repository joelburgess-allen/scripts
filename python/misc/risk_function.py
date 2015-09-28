import random

"""
for i in range(3):
    attack.append(random.randrange(1,7))
"""

#Assume you fight with the maximum possible numbers






def risk_fun(a_troops, d_troops):
    result = []
    while a_troops > 1:
        #print 'before round conflict'
        #print 'Attack', a_troops
        #print 'Defend', d_troops
        
        a_dice = 0
        d_dice = 0
        
        if a_troops == 2: 
            a_dice = 1
        elif a_troops == 3:
            a_dice = 2
        elif a_troops > 3:
            a_dice = 3
        
        if d_troops > 2: 
            d_dice = 2
        else:
            d_dice = d_troops
        
        a_rolls = []
        d_rolls = []
        
        for i in range(a_dice):
            a_rolls.append(random.randrange(1,7))
        
        for i in range(d_dice):
            d_rolls.append(random.randrange(1,7))
        
        #print sorted(a_rolls, reverse = True)
        #print sorted(d_rolls, reverse = True)
        
        if d_dice == 0:
            print "defending army defeated"
            print "Attackers remaining: ", a_troops
            break
        elif a_troops == 1:
            print "Attacking Army defeated, it cannot attach as it only has 1 person"
            print "Defenders remaining: ", d_troops
            break
        elif d_dice == 1:
            if max(a_rolls) > d_rolls[0]:
                d_troops -= 1
            else:
                a_troops -= 1
        else:
            if max(a_rolls) > max(d_rolls):
                d_troops -= 1
            else:
                a_troops -= 1
            if a_dice == 2:
                if min(a_rolls) > min(d_rolls):
                    d_troops -= 1
                else:
                    a_troops -= 1
            elif a_dice > 2:
                if sorted(a_rolls)[1] > min(d_rolls):
                    d_troops -= 1
                else:
                    a_troops -= 1
        tmp_list = []
        tmp_list.append(a_troops)
        tmp_list.append(d_troops)
        
        print tmp_list
    print tmp_list

        #print 'After round conflict'
        #print 'Attack', a_troops
        #print 'Defend', d_troops
        #print '>>>>>>>'


risk_fun(12,12)
