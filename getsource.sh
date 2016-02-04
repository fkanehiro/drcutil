source config.sh

sudo apt-get -y install subversion git

cd $SRC_DIR
git clone https://github.com/fkanehiro/openhrp3.git
wget https://github.com/OctoMap/octomap/archive/v1.7.1.tar.gz
tar zxvf v1.7.1.tar.gz

if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    svn co https://atom.a01.aist.go.jp/svn/HRP2/trunk HRP2
    # svn co https://atom.a01.aist.go.jp/svn/HRP2SH/trunk HRP2SH
    svn co https://atom.a01.aist.go.jp/svn/hrprtc/trunk hrpsys-private
    git clone https://atom.a01.aist.go.jp/git/HRP2JRVC.git
fi

git clone https://github.com/jrl-umi3218/hrp2-drc.git HRP2DRC
git clone https://github.com/fkanehiro/hrpsys-base.git
git clone https://github.com/jrl-umi3218/hmc2.git
git clone https://github.com/jrl-umi3218/hrpsys-humanoid.git
GIT_SSL_NO_VERIFY=1 git clone https://choreonoid.org/git/choreonoid.git
cd choreonoid/ext
git clone https://github.com/jrl-umi3218/hrpcnoid.git
if [ "$HAVE_ATOM_ACCESS" -eq 1 ]
then
    git clone https://atom.a01.aist.go.jp/git/jvrc.git
fi
cd ../..
