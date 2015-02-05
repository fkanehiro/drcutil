source config.sh
cd $SRC_DIR

cd openhrp3/build
$SUDO make -j4 install
cd ../../


cd hrpsys-base/build
$SUDO make -j4 install
cd ../../


if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    cd HRP2/build
    $SUDO make -j4 install
    cd ../..
    # cd robot/HRP2SH/build
    # make -j4 install
    # cd ../..
fi


cd HRP2DRC/build
$SUDO make -j4 install
cd ../..


cd hmc2/build
$SUDO make -j4 install
cd ../../


cd hrpsys-humanoid/build
$SUDO make -j4 install
cd ../../

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    cd hrpsys-private/build
    $SUDO make -j4 install
    cd ../..
fi

cd choreonoid/build
$SUDO make -j4 install
cd ../../


