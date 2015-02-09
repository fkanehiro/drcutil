First copy config.sh.sample 
```
% cp config.sh.sample config.sh
```

edit contents of config.sh
ubuntu14.04LTS 64bit is highly recommended
set HAVE_ATOM_ACCESS zero, if you don't have access to atom

fetch source codes
```
% ./getsource.sh
```

install required packages
```
% ./setupenv.sh
```

configure, build and install
```
% ./install.sh
```

for daily development, execute update.sh
this script retrives the latest source codes, compiles and installs
```
% ./update.sh
```


