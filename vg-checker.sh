#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Usage:"
    echo "  ./vg-checker.sh <path/to/valgrind-log>"
    echo "Example:"
    echo "  ./vg-checker.sh valgrind/output.txt"
    echo "Return:"
    echo "  1 You don't care about your memory (eg. free, errors, SISSEGV, ...)"
    echo "      (or there was an error during the execution of the program)"
    echo "  0 You care about your memory (thank you)"
    exit 1
fi

INPUT=$1
ERRORS="ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)"
FREE="All heap blocks were freed -- no leaks are possible"
GOOD=0

while IFS= read -r INPUT
do
  if grep -q "$ERRORS" <<< "$INPUT"; then
    let "GOOD+=1"
  fi
  if grep -q "$FREE" <<< "$INPUT"; then
    let "GOOD+=1"
  fi
done < "$INPUT"

if [[ ${GOOD} == 2 ]]
then
    echo "Well, You take care congratulation"
    exit 0
else
    echo "Please do something about it, it's bad"
    exit 1
fi