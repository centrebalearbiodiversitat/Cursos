#! /bin/bash
#break & continue

for ((i=0; i<10;i++))
do 
    if [ $i -lt 3 ] || [ $i -eq 8 ]
    then 
        continue
    fi
    echo $i
done