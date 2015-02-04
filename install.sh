source config.sh

export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig

cd $SRC_DIR/openhrp3/util
yes | ./installPackages.sh packages.list.ubuntu.$UBUNTU_VER
cd ..
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCOMPILE_JAVA_STUFF=OFF ..
make -j2 install

cd $SRC_DIR/octomap-1.6.8
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install

cd $SRC_DIR/HRP2
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install

# svn co https://atom.a01.aist.go.jp/svn/HRP2SH/trunk HRP2SH
# cd HRP2SH
# mkdir build
# cd build
# cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
# make -j2 install
# cd ../..

cd $SRC_DIR/HRP2DRC
mkdir build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install

sudo add-apt-repository -y ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get -y install libxml2-dev libsdl-dev libglew-dev libcv-dev libcvaux-dev libhighgui-dev libqhull-dev freeglut3-dev libxmu-dev python-dev libboost-python-dev ipython openrtm-aist-python libpcl-all

cd $SRC_DIR/hrpsys-base
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCOMPILE_JAVA_STUFF=OFF -DBUILD_KALMAN_FILTER=OFF -DBUILD_STABILIZER=OFF ..
make -j2 install
cd ../..

sudo apt-get -y install libyaml-dev libncurses5-dev

cd $SRC_DIR/hmc2
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

cd $SRC_DIR/hrpsys-humanoid
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .. -DCOMPILE_JAVA_STUFF=OFF
make -j2 install
cd ../..

cd $SRC_DIR/choreonoid/misc/script
yes | ./install-requisites-ubuntu-$UBUNTU_VER.sh
cd ../..
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_CORBA=ON -DBUILD_CORBA_PLUGIN=ON -DBUILD_OPENRTM_PLUGIN=ON -DBUILD_PCL_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN=ON -DBUILD_GRXUI_PLUGIN=ON -DBODY_CUSTOMIZERS=$SRC_DIR/robot/HRP2/customizer/HRP2Customizer ..
make -j2 install
cd ../..

echo "add the following environmental variable settings to your .bashrc"
echo "export PATH=\$PREFIX/bin:\$PATH"
echo "export LD_LIBRARY_PATH=\$PREFIX/lib"
echo "export PKG_CONFIG_PATH=\$PREFIX/lib/pkgconfig"
echo "export PYTHON_PATH=\$PREFIX/lib/python2.7/dist-packages/hrpsys"
