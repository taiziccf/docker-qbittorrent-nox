#!/bin/sh

apk add make cmake g++ openssl-dev boost-dev qt5-qtbase-dev qt5-qttools-dev

wget https://github.com/arvidn/libtorrent/archive/RC_2_0.zip

unzip RC_2_0.zip

cd libtorrent-RC_2_0/

mkdir build && cd build/

cmake -DCMAKE_INSTALL_LIBDIR=lib ..

make && make install && strip /usr/local/lib/libtorrent-rasterbar.so.2.0

wget https://github.com/qbittorrent/qBittorrent/archive/master.zip

unzip master.zip

cd qBittorrent-master/

./configure --disable-gui

make && make install

