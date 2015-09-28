largest = None
smallest = None
while True:
   num = raw_input("Enter a number: ")    
   if num == "done":
      break
   else:
      try:
         num = int(num)
      except:
         print "Invalid input"
         continue
      if largest is None and smallest is None:
         largest = num
         smallest = num
      else:
         if num > largest:
            largest = num
         elif num < smallest:
            smallest = num

print "Maximum", largest
print "Minimum", smallest
