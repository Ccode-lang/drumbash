#!/bin/bash
input="drumrc"
while IFS= read -r line
do
  inp="${line#[$'\r\t\n ']}"
  inp="${inp%[$'\r\t\n ']}"
  if [[ ! $inp == "~/drum_bash/plugins/" ]]
  then
  echo "~/drum_bash/plugins/$inp"
  fi
done < "$input"
