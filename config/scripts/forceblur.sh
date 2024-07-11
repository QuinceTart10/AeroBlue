dnf install git cmake make
git clone https://gitgud.io/wackyideas/kde-effects-forceblur.git /tmp/forceblur
mkdir /tmp/forceblur/build
cd /tmp/forceblur/build
cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
make