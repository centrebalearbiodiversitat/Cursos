#! /bin/bash

echo 'dime tu edad' # display message
read age # input

if [ $age -ge 18 ]  #comparison 1.
then 
    echo "eres adulto "

elif [ $age -gt 13 ] && [ $age -le 17 ] #comparison 2.
then
    echo "eres un adolescente"
else
    echo "eres un niño"
fi



: ' 
if (( $age > 18 ))
then 
    echo "eres menor de edad "
elif (( $age >= 13  && $age <= 17 ))
then
    echo "eres un adolescente"
else
    echo "eres un niño"
fi

'
