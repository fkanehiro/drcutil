source config.sh

export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig

cd $SRC_DIR/openhrp3
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCOMPILE_JAVA_STUFF=OFF ..
$SUDO make -j2 install

cd $SRC_DIR/octomap-1.6.8
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
$SUDO make -j2 install

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    cd $SRC_DIR/HRP2
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    $SUDO make -j2 install
fi

cd $SRC_DIR/HRP2DRC
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
$SUDO make -j2 install

cd $SRC_DIR/hrpsys-base
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCOMPILE_JAVA_STUFF=OFF -DBUILD_KALMAN_FILTER=OFF -DBUILD_STABILIZER=OFF ..
$SUDO make -j2 install

cd $SRC_DIR/hmc2
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .. -DCOMPILE_JAVA_STUFF=OFF
$SUDO make -j2 install

cd $SRC_DIR/hrpsys-humanoid
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .. -DCOMPILE_JAVA_STUFF=OFF
$SUDO make -j2 install

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    cd $SRC_DIR/hrpsys-private
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    $SUDO make -j2 install
fi

cd $SRC_DIR/choreonoid
mkdir build
cd build
if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_CORBA=ON -DBUILD_CORBA_PLUGIN=ON -DBUILD_OPENRTM_PLUGIN=ON -DBUILD_PCL_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN=ON -DBUILD_GRXUI_PLUGIN=ON -DBODY_CUSTOMIZERS=$SRC_DIR/HRP2/customizer/HRP2Customizer ..
else
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_CORBA=ON -DBUILD_CORBA_PLUGIN=ON -DBUILD_OPENRTM_PLUGIN=ON -DBUILD_PCL_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN=ON -DBUILD_GRXUI_PLUGIN=ON ..
fi
$SUDO make -j2 install

echo "add the following environmental variable settings to your .bashrc"
echo "export PATH=\$PREFIX/bin:\$PATH"
echo "export LD_LIBRARY_PATH=\$PREFIX/lib"
echo "export PKG_CONFIG_PATH=\$PREFIX/lib/pkgconfig"
echo "export PYTHON_PATH=\$PREFIX/lib/python2.7/dist-packages/hrpsys"
