## Module 2. Introduction to R ##
##Exercice 1

# create variables 
randomlist <- vector()

# create and save 10 random numbers in n list-variable
for (i in 1:10){

    n <- runif(1, min=1, max=30) # Generate 1 random number
    n <- round(n, digits = 0) # Remove decimals
    randomlist <- c(randomlist, n) # Save in randomlist

print(i)

}

randomlist

# 2. Sort the numbers (increasing)
sort(randomlist, decreasing = FALSE)
# 3. Sort the numbers (decreasing)
sort(randomlist, decreasing = TRUE)

# 4. Retrieve the maximum number of the list
max(randomlist)

# 5. Retrieve the minimum number of the list
min(randomlist)


# 5. Print the mean
### Option 5.1, not using library
listMean = sum(randomlist)/10

### Option 5.2, not using library
listMean = sum(randomlist)/length(randomlist)

### Option 2, using statistics library
mean(randomlist)