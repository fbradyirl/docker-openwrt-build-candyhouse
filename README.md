# docker-openwrt-build-candyhouse
Builds a Docker image which allows you to build the latest OpenWRT for Candyhouse based routers.

The image simply consists of:
 - The latest Ubuntu
 - The required dependancies for building OpenWRT
 - A build script, which will be executed on run. See https://github.com/fbradyirl/Candyhouse-Linux-ROOter/blob/master/Makefile
Note: The OpenWRT code has not been pulled down at this point. That only happens during 'docker run' below.

To build the docker image, execute the following:

```bash
docker build -t="finbarrbrady/openwrt-e4200v2:latest" git://github.com/fbradyirl/docker-openwrt-build-candyhouse
```
Now we are ready to execute, and pull down the latest OpenWRT code and build.

To run the docker image and generate a build of OpenWRT for a Linksys EA4500 / E4200v2 router, run:
```bash
docker run -e TARGET=viper finbarrbrady/openwrt-e4200v2:latest
```

... or for a Linksys EA3500 router, run:
```bash
docker run -e TARGET=audi finbarrbrady/openwrt-e4200v2:latest
```
