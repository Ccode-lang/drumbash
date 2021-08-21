# Drum Bash
A plugin framework for bash!
# Install
```bash
wget https://raw.githubusercontent.com/Ccode-lang/drumbash/main/easyinst.sh
chmod +x easyinst.sh
./easyinst.sh
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
