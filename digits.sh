#!/bin/bash
sum=0

for i in $(seq 1000 2000); do
  if [[ $i =~ ^[01]+$ ]]; then
    sum=$((sum + i))
  fi
done

echo "Sum: $sum"
