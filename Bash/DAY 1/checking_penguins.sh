#!/bin/bash

#  Delete all NA data
awk '!/NA/' penguins.csv > clean_penguins.csv 

# Count how many penguins of each species are there
tail -n +2 clean_penguins.csv | awk '{print $1}' | uniq -c > output2.txt

# Count how many penguins of each sex are there
tail -n +2 clean_penguins.csv | awk '{print $7}' | sort | uniq -c >> output2.txt