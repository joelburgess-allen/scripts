import random

# create lists for dice and numbers
die1 = [x for x in range(1,7)]
die2 = [x for x in range(1,7)]
result = [x for x in range(1,10)]

# find the chances of getting a certain number, note - I didn't bother /36.0 as we are only looking for the least 
prob = {}
for i in result:
   for j in die1:
      for k in die2:
         if i == j or i == k or i == (j + k):
            prob[i] = prob.get(i,0) + 1

while len(prob) >= 0:
   if len(prob) == 0:
      print 'Congrats, perfect score!'
      break
   else:
      # get values of dice and sum
      one = random.randrange(1, 7)
      two = random.randrange(1, 7)
      sum = one + two
      print 'Die roles: ' + str(one) + ' and ' + str(two)
      # get list of options we could close 
      result = sorted([one, two, sum])
      options = {}
      for key in prob:
         for i in result:
            if key == i:
               options[i] = prob[i]
      print 'Options:', options
      # end game if we have no options
      if len(options) == 0:
         score = 0
         for key in prob:
            score += key
         print 'GAME OVER, you scorred:', score
         break
      else:
         choice = None
         for i in options:
            if choice is None or options[i] < options[choice]:
               choice = i
         print 'Close:', choice
         prob.pop(choice, None)