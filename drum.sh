#!/bin/bash
plugin=".drum"
input="drumrc"
while IFS= read -r line
do
  inp="${line#[$'\r\t\n ']}"
  inp="${inp%[$'\r\t\n ']}"
  if [[ ! $inp == "" ]]
  then
  chmod +x plugins/$inp$plugin 2> /dev/null && plugins/$inp$plugin || echo "skiping plugin $inp$plugin"
  fi
done < "$input"
