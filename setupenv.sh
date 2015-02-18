source config.sh

cd $SRC_DIR/openhrp3/util
./installPackages.sh packages.list.ubuntu.$UBUNTU_VER
cd ..

sudo add-apt-repository -y ppa:v-launchpad-jochen-sprickerhof-de/pcl
sudo apt-get update
sudo apt-get -y install libxml2-dev libsdl-dev libglew-dev libopencv-dev libcvaux-dev libhighgui-dev libqhull-dev freeglut3-dev libxmu-dev python-dev libboost-python-dev ipython openrtm-aist-python libpcl-all
sudo apt-get -y install libyaml-dev libncurses5-dev

cd $SRC_DIR/choreonoid/misc/script
./install-requisites-ubuntu-$UBUNTU_VER.sh

