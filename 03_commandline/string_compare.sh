#! /bin/bash

echo "Escribe una contraseña"
read passw1
echo "Escribe de nuevo la contraseña"
read passw2

if [ $passw1 == $passw2 ]
then
    echo "contraseña correcta"
else
    echo "contraseña incorrecta"
fi