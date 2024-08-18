#!/usr/bin/env bash

set -euo pipefail

rpm-ostree install git cmake make gcc gcc-c++ extra-cmake-modules qt6-qtbase-devel kf6-kcmutils-devel kf6-kcrash-devel kf6-ki18n-devel kf6-kio-devel kf6-kwindowsystem-devel kf6-kguiaddons-devel kf6-knotifications-devel libepoxy-devel kwin-devel wayland-devel kdecoration-devel xcb-util-devel
git clone https://gitgud.io/wackyideas/kde-effects-forceblur.git /tmp/forceblur
mkdir /tmp/forceblur/build
cd /tmp/forceblur/build
cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
make
make install

# Remove devel packages (I hope)
rpm-ostree uninstall gc gcc gcc-c++ make cmake cmake-data extra-cmake-modules clang-libs clang-resource-filesystem compiler-rt guile30 qt6-rpm-macros kf6-rpm-macros qt6-linguist qt6-designer qt6-doctools qt6-qtlanguageserver $(rpm -qa | grep devel) $(rpm -qa | grep headers)