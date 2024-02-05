#! /bin/bash

nota=7

if (( $nota >= 7 && $nota <= 8 ))
then 
    echo "tienes un notable"
elif (( $nota >= 5 || $nota <= 6 ))
then 
    echo "tienes un bien"
elif ( $nota < 5 )
then
    echo "has suspendido"
fi
