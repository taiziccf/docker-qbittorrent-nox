FROM alpine:latest AS builder

COPY libtorrent-rasterbar libtorrent-rasterbar

RUN cd libtorrent-rasterbar && \
    apk add --no-cache make cmake g++ boost-dev openssl-dev && \
    cmake -DCMAKE_INSTALL_LIBDIR=lib . && \
    make -j`nproc` && \
    make install && \
    strip /usr/local/lib/libtorrent-rasterbar.so*

COPY qbittorrent qbittorrent

RUN cd qbittorrent && \
    apk add --no-cache qt5-qttools-dev && \
    ./configure --disable-gui && \
    make -j`nproc` && \
    make install

FROM alpine:latest

COPY --from=builder /usr/local/lib/libtorrent-rasterbar.so* /usr/lib/

COPY --from=builder /usr/local/bin/qbittorrent-nox /usr/bin/qbittorrent-nox

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache qt5-qtbase

ENV WEBUI_PORT="8080"

EXPOSE 6881 6881/udp 8080

VOLUME /config /downloads

ENTRYPOINT ["/entrypoint.sh"]
