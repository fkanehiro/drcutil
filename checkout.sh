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

echo HRP2
cd HRP2
git pull $REPO
cd ..

echo HRP2KAI
cd HRP2KAI
git pull $REPO
cd ..

echo hrpsys-private
cd hrpsys-private
git pull $REPO
cd ..

echo choreonoid
cd choreonoid
GIT_SSL_NO_VERIFY=1 git pull
echo choreonoid/ext/hrpcnoid
cd ext/hrpcnoid
git pull
cd ../../..



