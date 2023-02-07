#!/bin/bash

# Declare a 2D array
declare -A abilityModifiers

# Initialize variables
row=1
abilityScore=2
abilityModifier=-4

# assign the first row manually
abilityModifiers[0,0]=1
abilityModifiers[0,1]=-5

# Loop to populate the 2D array
while [ $abilityScore -le 30 ]
do
  abilityModifiers[$row,0]=$abilityScore
  abilityModifiers[$row,1]=$abilityModifier

  ((row++))
  abilityScore=$((abilityScore+2))
  ((abilityModifier++))
done

# Print the 2D array for SQL INSERT statement
for ((i=0; i<row; i++))
do
  # use ";" at the end of the line if it's the last line
  if [[ $i -ne $row-1 ]]
  then
    echo "(${abilityModifiers[$i,0]}, ${abilityModifiers[$i,1]}),"
  else
    echo "(${abilityModifiers[$i,0]}, ${abilityModifiers[$i,1]});"
  fi
done
