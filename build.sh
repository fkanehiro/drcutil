source config.sh
cd $SRC_DIR

build_install() {
    for dir_name in $@; do
        cd "$dir_name/build"
        $SUDO make -j4 install
        cd ../../
    done
}

build_install "openhrp3" "hrpsys-base"

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    build_install "HRP2"
    # build_install "robot/HRP2SH"
fi

build_install "HRP2DRC" "hmc2" "hrpsys-humanoid"

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]; then
    build_install "hrpsys-private"
fi

build_install "choreonoid"

