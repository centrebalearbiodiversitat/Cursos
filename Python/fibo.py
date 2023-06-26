#define a function that returns the fibonacci serie of n numbers

def fib(n):
    a,b = 0,1
    while a < n: 
        print (a,end=' ')
        a,b=b,a+b
    print()

def fib2(n):
    result=[] #creating an empty list 
    a,b=0,1
    while a < n: 
        result.append(a) #using a built-in function
        a,b = b,a+b
    return result