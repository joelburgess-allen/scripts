import random

#six different numbers between 1 and 49

def lottery():
    numbers = []
    for i in range(6):
        numbers.append(random.randrange(1,50))
        numbers = sorted(numbers)
    return numbers

for i in range(3):
    print lottery()

