#!/bin/bash                                                                                            

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
   echo "usage: $0 <column> [file.csv]" 1>&2
   exit 1
fi

column=$1
file=${2:-/dev/stdin}

if ! [[ $column =~ ^[0-9]+$ ]]; then
  echo "usage: $0 <n> <file>" 1>&2
  exit 1
fi

cut -d',' -f"$column" "$file" | tail -n +2 | {
  sum=0
  count=0
  while read value; do
    sum=$(echo "$sum + $value" | bc)
    count=$((count + 1))
  done
  if [ "$count" -eq 0 ]; then
    echo "Error: No data in column $column" 1>&2
    exit 1
  fi
  mean=$(echo "scale=2; $sum / $count" | bc)
  echo "$mean"
}
