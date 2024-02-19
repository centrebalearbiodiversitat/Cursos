# ------------------------------------ #
# Introduction to R                    #
# Centre Balear de Biodiversitat       #
# Tommaso Cancellario                  #
# 20 - 22 February 2024                #
# ------------------------------------ #

# Create a Fibonacci sequence

# Function to create the Fibonacci sequence using a loop
fibonacci <- function(n) {
  a <- 0
  b <- 1
  
  fib <- c()
  
  for (i in 1:n) {
    next_num <- a + b
    a <- b
    b <- next_num
  
    fib <- c(fib, a)
    }
  return(fib)
  
}

# Example usage
x <- fibonacci(20)
