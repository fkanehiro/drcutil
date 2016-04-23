source config.sh

sudo apt-get -y install git

git config --global credential.helper cache

cd $SRC_DIR
git clone https://github.com/fkanehiro/openhrp3.git
wget https://github.com/OctoMap/octomap/archive/v1.8.0.tar.gz
tar zxvf v1.8.0.tar.gz

git clone https://fkanehiro@bitbucket.org/fkanehiro/hrp2 HRP2
cd HRP2
git remote add atom ssh://atom.a01.aist.go.jp/git/HRP2.git
cd ..
git clone https://fkanehiro@bitbucket.org/fkanehiro/hrp2-kai HRP2KAI
cd HRP2KAI
git remote add atom ssh://atom.a01.aist.go.jp/git/HRP2KAI.git
cd ..
git clone https://fkanehiro@bitbucket.org/fkanehiro/hrpsys-private
cd hrpsys-private
git remote add atom ssh://atom.a01.aist.go.jp/git/hrpsys-private.git
cd ..

git clone https://github.com/fkanehiro/hrpsys-base.git
git clone https://github.com/jrl-umi3218/hmc2.git
git clone https://github.com/jrl-umi3218/hrpsys-humanoid.git
GIT_SSL_NO_VERIFY=1 git clone https://choreonoid.org/git/choreonoid.git
cd choreonoid/ext
git clone https://github.com/jrl-umi3218/hrpcnoid.git
cd ../..
