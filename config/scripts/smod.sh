#!/usr/bin/env bash

set -euo pipefail

rpm-ostree install cmake gcc gcc-c++ gmp-ecm gmp-ecm-devel

cd /tmp/atp/KWin/cpp_effects/kwin-effect-smodsnap-v2
cmake -B build-kf6 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_KF6=ON .
make -C build-kf6
make -C build-kf6 install

# i hope this works
mv /tmp/atp/KWin/smod/snapeffecttextures.smod.rcc /usr/share/smod/snapeffecttextures.smod.rcc

rpm-ostree remove cmake gcc gcc-c++ gmp-ecm-devel