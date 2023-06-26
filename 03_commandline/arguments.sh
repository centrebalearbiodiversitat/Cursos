#! /bin/bash

echo $1 $2 $3 
echo $@
echo $# #count n arguments

args=("$@")
echo "Results: ${args[0]} - ${args[1]}"