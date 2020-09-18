FROM alpine AS builder

ADD build.sh /build.sh

RUN sh /build.sh

FROM alpine

RUN apk add --no-cache shadow libstdc++ qt5-qtbase

COPY --from=builder /usr/local/lib/libtorrent-rasterbar.so.1.2.10 /usr/local/lib/libtorrent-rasterbar.so.10

COPY --from=builder /usr/local/bin/qbittorrent-nox /usr/local/bin/qbittorrent-nox

ADD qBittorrent.conf /etc/opt/qBittorrent.conf

ADD entrypoint.sh /entrypoint.sh

ENV WEBUI_PORT=8080 CHUID=1000 CHGID=1000

EXPOSE 6881 6881/udp 8080

VOLUME /config /downloads

ENTRYPOINT ["/entrypoint.sh"]
