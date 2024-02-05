#! /bin/bash

#loops 1.while

number=0

while [ $number -lt 10 ]
do
    echo "el número es menor que 10: $number"
    number=$((number + 1))

done