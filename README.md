# qbittorrent-nox

Very minimal qbittorrent-nox image build from latest git master branch.

## Usage

```
docker create --name=qbittorrent-nox \
  -e WEBUI_PORT=8080 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  -p 8080:8080 \
  -v /path/to/appdata/config:/config \
  -v /path/to/downloads:/downloads \
  --restart unless-stopped \
  --user $(id -u $USER):$(id -g $USER) \
  caoli5288/qbittorrent-nox
```
