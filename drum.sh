#!/bin/bash
cd ~/drum_bash
plugin=".drum"
input="drumrc"
while IFS= read -r line
do
  inp="${line#[$'\r\t\n ']}"
  inp="${inp%[$'\r\t\n ']}"
  if [[ ! $inp == "" ]]
  then
  if [[ -f "/plugin/$inp$plugin" ]]
  then
    while IFS= read -r comm
    do
      eval "$comm"
    done < "/plugin/$inp$plugin"
  else
    echo "file does not exist: $inp$plugin"
  fi
  fi
done < "$input"
run=1
while [[ $run == 1 ]]
do
printf "$"
read com
if [ "$com" == "exit" ]
then
  run=0
else
  eval "$com";
fi
done
