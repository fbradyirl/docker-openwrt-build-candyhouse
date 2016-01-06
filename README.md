[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/fbradyirl/docker-openwrt-build-candyhouse/blob/master/LICENSE)

# Overview
Builds a Docker image which allows you to build the latest OpenWRT for Candyhouse based routers (Cisco Linksys EA4500 / E4200v2 / EA3500 routers).

Step 1: Build or pull down the docker image
-------

The image simply consists of:
 - The latest Ubuntu
 - The required dependancies for building OpenWRT
 - A build script, which will be executed on run. See https://github.com/fbradyirl/Candyhouse-Linux-ROOter/blob/master/Makefile
Note: The OpenWRT code has not been pulled down at this point. That only happens during 'docker run' below.

To build the docker image, execute the following:

```bash
docker build --no-cache -t="finbarrbrady/openwrt-linksys-candyhouse:latest" git://github.com/fbradyirl/docker-openwrt-build-candyhouse
```
Or you can pull a pre-built version from my hub repository:
```bash
docker pull finbarrbrady/openwrt-linksys-candyhouse
```

Step 2: Build OpenWRT
-------
Now we are ready to execute, and pull down the latest OpenWRT code and build.

To run the docker image and generate a build of OpenWRT for a Linksys EA4500 / E4200v2 router, run:
```bash
docker run -it finbarrbrady/openwrt-linksys-candyhouse:latest
make viper
```

... or for a Linksys EA3500 router, run:
```bash
docker run -it finbarrbrady/openwrt-linksys-candyhouse:latest
make audi
```
