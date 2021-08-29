# Drum Bash
A plugin framework for bash!
# Install
```bash
cd ~
git clone https://github.com/Ccode-lang/drumbash
cd drumbash
chmod +x drum.sh
```
# Installing plugins
Put the .drum plugins in the plugins folder and list there names in the drumrc file.  
example plugins content:
```
plugins
__
  |
  |_test.drum
```
example drumrc content:
```
test
```
# running
After installing plugins run this in ~/drumbash:
```bash
./drum.sh
```
This will load the plugin files listed in drumrc then run a the modded version of bash.
# using api
> api is in very early stages. It may have dramatic changes at any time!!!!
## python
To import the api in drum bash you need to do a few things first.
1. instead of naming the file whatever.py name it whatever.drum
2. add the below lines of code to the file
```python
#!/usr/bin/env python3
import os
import sys
home = os.path.expanduser('~')
mymodule_dir = os.path.join( home, 'drumbash', 'api')
sys.path.append( mymodule_dir )
import api
```
Now you can call the api with api.command_you_want_to_use()
