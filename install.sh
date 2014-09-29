export SRC_DIR=$HOME
export PREFIX=$HOME/openrtp
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig

sudo apt-get -y install subversion git

git clone https://github.com/fkanehiro/openhrp3.git
cd openhrp3/util
yes | ./installPackages.sh packages.list.ubuntu.12.04 
cd ..
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCOMPILE_JAVA_STUFF=OFF ..
make -j2 install
cd ../..

wget https://github.com/OctoMap/octomap/archive/v1.6.8.tar.gz
tar zxvf v1.6.8.tar.gz
cd octomap-1.6.8
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

mkdir robot
cd robot

yes p | svn co https://atom.a01.aist.go.jp/svn/HRP2/trunk HRP2
cd HRP2
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

svn co https://atom.a01.aist.go.jp/svn/HRP2SH/trunk HRP2SH
cd HRP2SH
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

cd ..

sudo add-apt-repository -y ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get -y install libxml2-dev libsdl-dev libglew-dev libcv-dev libcvaux-dev libhighgui-dev libqhull-dev freeglut3-dev libxmu-dev python-dev libboost-python-dev ipython openrtm-aist-python libpcl-all
git clone https://github.com/fkanehiro/hrpsys-base.git
cd hrpsys-base
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCOMPILE_JAVA_STUFF=OFF -DBUILD_KALMAN_FILTER=OFF -DBUILD_STABILIZER=OFF ..
make -j2 install
cd ../..

sudo apt-get -y install libyaml-dev libncurses5-dev
svn co https://atom.a01.aist.go.jp/svn/hmc2/trunk hmc2
cd hmc2
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

svn co https://atom.a01.aist.go.jp/svn/hrprtc/trunk hrpsys-humanoid
cd hrpsys-humanoid
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

svn co https://atom.a01.aist.go.jp/svn/hrpeyewalk/trunk hrpeyewalk
cd hrpeyewalk
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j2 install
cd ../..

GIT_SSL_NO_VERIFY=1 git clone https://choreonoid.org/git/choreonoid.git
cd choreonoid/ext
git clone ssh://atom.a01.aist.go.jp/git/hrpcnoid.git
cd ..
cd misc/script
yes | ./install-requisites-ubuntu-12.04.sh
cd ../..
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DENABLE_CORBA=ON -DBUILD_CORBA_PLUGIN=ON -DBUILD_OPENRTM_PLUGIN=ON -DBUILD_PCL_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN_FOR_3_0=ON -DBUILD_GRXUI_PLUGIN=ON -DBODY_CUSTOMIZERS=$SRC_DIR/robot/HRP2/customizer/HRP2Customizer ..
make -j2 install
cd ../..

echo "add the following environmental variable settings to your .bashrc"
echo "export PATH=\$PREFIX/bin:\$PATH"
echo "export LD_LIBRARY_PATH=\$PREFIX/lib"
echo "export PKG_CONFIG_PATH=\$PREFIX/lib/pkgconfig"
echo "export PYTHON_PATH=\$PREFIX/lib/python2.7/dist-packages/hrpsys"
