source config.sh
cd $SRC_DIR

cd openhrp3/build
make -j4 install
cd ../../


cd hrpsys-base/build
make -j4 install
cd ../../


cd robot/HRP2/build
make -j4 install
cd ../../..


# cd robot/HRP2SH/build
# make -j4 install
# cd ../../..


cd robot/HRP2DRC/build
make -j4 install
cd ../../..


cd hmc2/build
make -j4 install
cd ../../


cd hrpsys-humanoid/build
make -j4 install
cd ../../


#cd hrpeyewalk/build
#make -j4 install
#cd ../../

cd choreonoid/build
make -j4 install
cd ../../


