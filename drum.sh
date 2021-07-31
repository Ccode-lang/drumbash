#!/bin/bash
cd ~/drumbash
mkdir bin
plugin=".drum"
input="drumrc"
while IFS= read -r line
do
  inp="${line#[$'\r\t\n ']}"
  inp="${inp%[$'\r\t\n ']}"
  if [[ ! $inp == "" ]]
  then
  if [[ -f "plugins/$inp$plugin" ]]
  then
    cp "plugins/$inp$plugin" bin
    cd bin
    mv "$inp$plugin" "$inp"
    chmod +x "$inp"
    cd ..
  else
    echo "file does not exist: $inp$plugin"
  fi
  fi
done < "$input"
PATH="~/drumbash/bin:$PATH"
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
cd ~/drumbash
rm -r bin
