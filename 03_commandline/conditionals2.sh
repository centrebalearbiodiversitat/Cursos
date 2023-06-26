#! /bin/bash

age=11

if [ $age -le 10 ]
then 
    echo "el número es menor a 10"
else 
    echo "el número es mayor a 10"
fi

: ' opción 2
age=11

if  ((age == 10)) #usar >=, <=..
then 
    echo "el número es menor a 10"
else 
    echo "el número es mayor a 10"
fi
