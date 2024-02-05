#! /bin/bash

echo "Escoge entre las opciones 1 y 2: "

read opcion

case $opcion in
    1)
    echo "opcion escogida 1"
    ;;
    2)
    echo "opcion escogida 2"
    ;;
    *)
    echo "opción escogida invalida"
    ;;
esac