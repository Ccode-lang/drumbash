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


run=1
while [[ $run == 1 ]]
do
printf "$ "
read com
first=$(echo "$com" | awk '{print $1;}')
if [ "$com" == "exit" ]
then
  run=0
else
  if command -v "$first" &> /dev/null
  then
    eval $com
  else
    firstplug=$(echo "~/drumbash/bin/$com" | awk '{print $1;}')
    if command -v "$firstplug" &> /dev/null
      eval "~/drumbash/bin/$com"
    else
      eval "$com"
    fi
  fi
fi
done
cd ~/drumbash
rm -r bin
