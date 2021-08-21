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
