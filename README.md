# qbittorrent-nox

Very minimal qbittorrent-nox image build from latest git master branch.

## Usage

```bash
$ docker create --name=qbittorrent-nox \
  -e WEBUI_PORT=8080 \
  -e CHUID=1000 \
  -e CHGID=1000 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 8080:8080 \
  -v /path/to/appdata/config:/config \
  -v /path/to/downloads:/downloads \
  --restart unless-stopped \
  caoli5288/qbittorrent-nox
```

## Changelogs

* 2020-09-18 rebuild for libtorrent-rasterbar 1.2.10
* 2020-06-23 rebuild for libtorrent-rasterbar 1.2.7 
