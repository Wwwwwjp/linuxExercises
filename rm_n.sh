#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n>" 1>&2
    exit 1
fi

dir=$1
n=$2

if [ ! -d "$dir" ]; then
    echo "Error: $dir is not a valid directory." 1>&2
    exit 1
fi

if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: $n is not a valid number." 1>&2
    exit 1
fi

find "$dir" -type f -size +"$n"c -exec rm -f {} \;

echo "Files larger than $n bytes in $dir have been removed."
