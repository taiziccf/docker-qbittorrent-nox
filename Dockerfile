FROM alpine:edge

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing qbittorrent-nox shadow \
    && userdel -r qbittorrent

ADD qBittorrent.conf /etc/opt/qBittorrent.conf

ADD entrypoint.sh /entrypoint.sh

ENV WEBUI_PORT=8080 CHUID=1000 CHGID=1000

EXPOSE 6881 6881/udp 8080

VOLUME /config /downloads

ENTRYPOINT ["/entrypoint.sh"]
