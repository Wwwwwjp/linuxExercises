#!/bin/bash

rm -rf five

mkdir five

for i in $seq(5); do
  mkdir "five/dir$i"
  for j in $seq(4); do
    for ((k=1; k<=j; k++)); do
      echo "$j" >> "five/dir$i/file$j"
    done
  done
done