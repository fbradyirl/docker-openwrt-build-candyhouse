# docker-openwrt-build-candyhouse
Builds a Docker image which allows you to build the latest OpenWRT for Candyhouse based routers.

To build the docker image, execute the following:

```bash
docker build -t="finbarrbrady/openwrt-e4200v2:latest" git://github.com/fbradyirl/docker-openwrt-build-candyhouse
```

To then run the docker image and generate a build of OpenWRT for a Linksys EA4500 / E4200v2 router, run:
```bash
docker run -e TARGET=viper finbarrbrady/openwrt-e4200v2:latest
```

... or for a Linksys EA3500 router, run:
```bash
docker run -e TARGET=audi finbarrbrady/openwrt-e4200v2:latest
```
