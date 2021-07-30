#!/bin/bash
input="~/drum_bash/drumrc"
while IFS= read -r line
do
  inp="${line#[$'\r\t\n ']}"
  inp="${inp%[$'\r\t\n ']}"
  echo "~/drum_bash/plugins/$inp"
done < "$input"
