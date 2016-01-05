# Installs OpenWRT build system dependancies on Ubuntu
FROM ubuntu
MAINTAINER Finbarr Brady github.com/fbradyirl

RUN apt-get update
RUN apt-get install -y git-core build-essential libssl-dev libncurses5-dev unzip subversion mercurial gawk wget

RUN git clone https://github.com/fbradyirl/Candyhouse-Linux-ROOter.git

ENV FORCE_UNSAFE_CONFIGURE=1

CMD echo 'Going to run make for target $TARGET' && cd Candyhouse-Linux-ROOter/ && make $TARGET
