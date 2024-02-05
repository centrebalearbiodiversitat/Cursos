#! /bin/bash


echo "dime un número"
read numero
if [ $numero -eq 5 ] #very important to place the spaces between brackets.
then
    echo "correcto, el número es igual a 5"
fi
