#!/bin/bash

####################
#
# for loops
#
####################



#1 basic number loop

for i in apple banana cup dog elephant 
do
  echo "Number: $i"
done






#2 range based loop

for i in {1..10}
do
  echo "Iteration $i"
done






#3 loop over array values

servers=("dev" "qa" "prod")

for server in "${servers[@]}"
do
  echo "Deploying to $server server"
done






# 4 directory

for file in *.txt
do
  echo "File name: $file"
done




# c-style for loop

for ((i=1; i<=5; i++))
do
  echo "Count = $i"
done

