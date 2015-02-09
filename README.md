## This package provides a set of shell script to setup and maintain development environment for DRC.

### Initial setup

First copy config.sh.sample.
```
% cp config.sh.sample config.sh
```

Edit contents of config.sh. ubuntu14.04LTS 64bit is highly recommended.
Set HAVE_ATOM_ACCESS zero, if you don't have access to atom.

Fetch source codes.
```
% ./getsource.sh
```

Install required packages.
```
% ./setupenv.sh
```

Configure, build and install.
```
% ./install.sh
```

### Daily development
update.sh fetches the latest source codes, builds and installs.
```
% ./update.sh
```


