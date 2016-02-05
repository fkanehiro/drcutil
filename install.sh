source config.sh

export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig

cmake_install_with_option() {
    # check existence of the build directory
    if [ ! -d "$SRC_DIR/$1/build" ]; then
        mkdir "$SRC_DIR/$1/build"
    fi
    cd "$SRC_DIR/$1/build"

    if [ $# = 1 ]; then
        cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
    else
        cmake -DCMAKE_INSTALL_PREFIX=$PREFIX $2 ..
    fi

    $SUDO make -j2 install
}

cmake_install_with_option "openhrp3" "-DCOMPILE_JAVA_STUFF=OFF"
cmake_install_with_option "octomap-1.7.1"
cmake_install_with_option "hrpsys-base" "-DCOMPILE_JAVA_STUFF=OFF -DBUILD_KALMAN_FILTER=OFF -DBUILD_STABILIZER=OFF"

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    cmake_install_with_option "HRP2" "-DROBOT_NAME=HRP2DRC"
fi

cmake_install_with_option "HRP2DRC"
cmake_install_with_option "hmc2" "-DCOMPILE_JAVA_STUFF=OFF"
cmake_install_with_option "hrpsys-humanoid" "-DCOMPILE_JAVA_STUFF=OFF"


if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    cmake_install_with_option "hrpsys-private"
fi

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    cmake_install_with_option "choreonoid" "-DENABLE_CORBA=ON -DBUILD_CORBA_PLUGIN=ON -DBUILD_OPENRTM_PLUGIN=ON -DBUILD_PCL_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN=ON -DBUILD_GRXUI_PLUGIN=ON -DBODY_CUSTOMIZERS=$SRC_DIR/HRP2/customizer/HRP2Customizer -DBUILD_DRC_USER_INTERFACE_PLUGIN=ON"
else
    cmake_install_with_option "choreonoid" "-DENABLE_CORBA=ON -DBUILD_CORBA_PLUGIN=ON -DBUILD_OPENRTM_PLUGIN=ON -DBUILD_PCL_PLUGIN=ON -DBUILD_OPENHRP_PLUGIN=ON -DBUILD_GRXUI_PLUGIN=ON"
fi

echo "add the following environmental variable settings to your .bashrc"
echo "export PATH=$PREFIX/bin:\$PATH"
echo "export LD_LIBRARY_PATH=$PREFIX/lib:\$LD_LIBRARY_PATH"
echo "export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig"
echo "export PYTHONPATH=$PREFIX/lib/python2.7/dist-packages/hrpsys:\$PYTHONPATH"
