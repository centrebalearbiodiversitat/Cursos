#! /bin/bash

#introducing a number between 0 and 10, the program will give the output of all numbers except of the given one.

echo "write a number between 0 and 10"

read number

for ((i=0; i<10; i++))
do 
    if [ $i -eq $number ]
    then 
        echo "your number was $number"
        continue
    fi
    echo $i
done