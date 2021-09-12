#!/bin/bash
# setup
cd ~/drumbash
mkdir bin
plugin=".drum"
input="drumrc"

# main loop
while IFS= read -r line
do
  #unescape
  inp="${line#[$'\r\t\n ']}"
  inp="${inp%[$'\r\t\n ']}"
  #only init if drumrc line has content
  if [[ ! $inp == "" ]]
  then
  if [[ -f "plugins/$inp$plugin" ]]
  then
    #make bin
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

# shell settings
PATH="~/drumbash/bin:$PATH"
run=1

#shell loop
while [[ $run == 1 ]]
do
printf "$ "
read com
if [ "$com" == "exit" ]
then
  run=0
else
  eval "$com"
fi
done

#finish
cd ~/drumbash
rm -r bin
