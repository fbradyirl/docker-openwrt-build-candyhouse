# Installs OpenWRT build system dependancies on Ubuntu
FROM ubuntu
MAINTAINER Finbarr Brady github.com/fbradyirl

RUN apt-get update
RUN apt-get install -y git-core build-essential libssl-dev libncurses5-dev unzip subversion mercurial
RUN echo 'openwrt build system dev image v1.0.0' > /README.md

RUN git clone https://github.com/fbradyirl/Candyhouse-Linux-ROOter.git

CMD echo 'Going to run make for target $TARGET' && cd Candyhouse-Linux-ROOter/ && make $TARGET
