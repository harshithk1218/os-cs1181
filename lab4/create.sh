#!/bin/bash
usage() {
    echo "Usage : $0 {create|copy|move|rename} <source> [destination]"
    exit 1
}
if [ "$#" -lt 2 ]; then
    usage
fi

operation=$1
source=$2
dest=$3

if [ $1 = "create" ]; then
touch "$source"
   if [ $? -eq 0 ]; then
   echo "$source created successfully"
   else
   echo "Error: Could not create $source"
   fi
else
echo "Wrong command"
fi
