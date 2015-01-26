cd $HOME/src

cd openhrp3
git pull
cd ..


cd hrpsys-base
git pull
cd ..


cd robot/HRP2
svn update 
cd ../..


cd robot/HRP2SH
svn update 
cd ../..


cd robot/HRP2DRC
git pull
cd ../..


cd hmc2
git pull
cd ..


cd hrpsys-humanoid
git pull
cd ..


#cd hrpeyewalk
#svn update 
#cd ..

cd choreonoid
GIT_SSL_NO_VERIFY=1 git pull
cd ext/hrpcnoid
git pull
cd ../../..



