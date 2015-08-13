source config.sh
cd $SRC_DIR

build_install() {
    for dir_name in $@; do
        cd "$dir_name/build"
	echo -n "building $dir_name ... "
        $SUDO make -j2 install > $SRC_DIR/${dir_name}.log 2>&1
	if [ "$?" -eq 0 ]
	then
	    echo "success"
	else
	    echo -e "\e[31mfail\e[m"
	fi
        cd ../../
    done
}

build_install "openhrp3" "hrpsys-base"

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    build_install "HRP2"
    # build_install "robot/HRP2SH"
fi

build_install "HRP2DRC" "HRP2JVRC" "hmc2" "hrpsys-humanoid"

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    build_install "hrpsys-private"
fi

build_install "choreonoid"

