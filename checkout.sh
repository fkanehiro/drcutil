source config.sh

pull_source() {
    for dir_name in $@; do
	echo $dir_name
        cd "$dir_name"
	git pull
        cd ..
    done
}

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
    export REPO=atom
then
    export REPO=
fi

cd $SRC_DIR

pull_source openhrp3 hrpsys-base hmc2 hrpsys-humanoid

cd HRP2
git pull $REPO
cd ..

cd HRP2KAI
git pull $REPO
cd ..

cd hrpsys-private
git pull $REPO
cd ..

cd choreonoid
GIT_SSL_NO_VERIFY=1 git pull
cd ext/hrpcnoid
git pull
cd ../../..



