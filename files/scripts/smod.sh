#!/usr/bin/env bash

set -euo pipefail

rpm-ostree install git cmake make gcc gcc-c++ extra-cmake-modules qt6-qtbase-devel kf6-kcmutils-devel kf6-kcrash-devel kf6-ki18n-devel kf6-kio-devel kf6-kwindowsystem-devel kf6-kguiaddons-devel kf6-knotifications-devel libepoxy-devel kwin-devel wayland-devel kdecoration-devel xcb-util-devel kf6-kiconthemes-devel kf6-kirigami-devel kf6-frameworkintegration-devel

mkdir /tmp/atp/kwin/effects_cpp/kde-effects-forceblur/build
cd /tmp/atp/kwin/effects_cpp/kde-effects-forceblur/build
cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
make
make install

cd /tmp/atp/kwin/effects_cpp/kwin-effect-smodsnap-v2
cmake -B build-kf6 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_KF6=ON .
make -C build-kf6
make -C build-kf6 install

mkdir /tmp/atp/kwin/decoration/breeze-v5.93.0/build
cd /tmp/atp/kwin/decoration/breeze-v5.93.0/build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
make install
