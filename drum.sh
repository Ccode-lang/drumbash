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
  chmod +x plugins/$inp$plugin 2> /dev/null && plugins/$inp$plugin || echo "skipping plugin $inp$plugin because it does not exist."
  fi
done < "$input"
run=1
while [[ $run == 1 ]]
do
printf "$"
read com
if [ $com == "exit" ]
then
  run=0
else
  $com
fi
done
