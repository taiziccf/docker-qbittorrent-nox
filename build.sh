#!/bin/sh

apk add make cmake g++ openssl-dev boost-dev qt5-qtbase-dev qt5-qttools-dev

wget https://github.com/arvidn/libtorrent/releases/download/v1.2.11/libtorrent-rasterbar-1.2.11.tar.gz

tar xvf libtorrent-rasterbar-1.2.11.tar.gz

cd libtorrent-rasterbar-1.2.11/

mkdir build && cd build/

cmake -DCMAKE_INSTALL_LIBDIR=lib ..

make && make install && strip /usr/local/lib/libtorrent-rasterbar.so.1.2.11

wget https://github.com/qbittorrent/qBittorrent/archive/master.zip

unzip master.zip

cd qBittorrent-master/

./configure --disable-gui

make && make install

