import random

"""
Europe
37 numbers
Green * 1
Black * 18
Red * 18
"""

odds_of_win = 18 / 37.0

overall_winnings = []
losses = []
winnings = []
iterations = []

for i in range(100):
   bet = 5
   win = 0
   loss = 0
   iteration = 0
   while True:
      x = random.random()
      iteration += 1
      if x <= odds_of_win:
         win = bet * 2
         break
      else:
         loss += bet
         bet *=2  
   overall_winnings.append(win - loss)
   losses.append(loss)
   winnings.append(win)
   iterations.append(iteration)

print overall_winnings
print '****'
print winnings
print '****'
print losses
print '****'
print iterations
