#Exercise 2 solved

# 1. Create and save 20 random numbers in n list-variable, numbers from 30 to 120


# 2. Sort the numbers
# 3. Retrieve the maximum number of the list
# 4. Retrieve the minimum number of the list
# 5. Print the median
# 6. Print the mode

import random
from statistics import mode, mean, median

# create variables 
randomlist_2 = []

# create and save 10 random numbers in n list-variable

for i in range(0,10):
    n = random.randint(30,120)
    randomlist_2.append(n)
print(randomlist_2)

# 2. Sort the numbers
print(sorted(randomlist_2))
# 3. Retrieve the maximum number of the list
print(max(randomlist_2))
# 4. Retrieve the minimum number of the list
print(min(randomlist_2))
# 5. Print the mean
### Option 5.1, not using library
print(median(randomlist_2))

### Option 2, using statistics library
print(mode(randomlist_2)) 