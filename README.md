# Overview
Builds a Docker image which allows you to build the latest OpenWRT for Candyhouse based routers (Cisco Linksys EA4500 / E4200v2 / EA3500 routers).

To get Docker on your machine, download and install the [Docker Toolbox][1].

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

To run the docker image and generate a build of OpenWRT, run:
```bash
docker run -it finbarrbrady/openwrt-linksys-candyhouse:latest
# for a Linksys EA4500 / E4200v2 router
make viper
# ... or for a Linksys EA3500 router, run:
make audi
```
Now go and have a cup of tea, because this can take about 45 minutes to complete.

In the end, you can type 'exit' to get out of the docker container.

```bash
root@c8e42178d1c3:/Candyhouse-Linux-ROOter# exit
```

Step 3: Copy the files from the docker container and install on your router
-------
Run this command to copy the build artifacts from the docker container to your host computer
```bash
docker cp c8e42178d1c3:/Candyhouse-Linux-ROOter/artifacts .
```
Note the container ID is the hostname of the container, which you can see when you typed 'exit' earlier.

You should now see a couple of files in the artifacts directory.
```bash
bash-3.2$ cd artifacts/
bash-3.2$ ls -l
total 24184
-rw-r--r--  1 finb  staff  7208960  6 Jan 14:33 openwrt-kirkwood-linksys-viper-squashfs-factory.bin
-rw-r--r--  1 finb  staff  5171200  6 Jan 14:34 openwrt-kirkwood-linksys-viper-squashfs-sysupgrade.tar
```

You can use the factory bin to flash from stock Linksys firmware, or if you already have a version of OpenWRT installed, you can use the sysupgrade tar file.

[1]: https://www.docker.com
