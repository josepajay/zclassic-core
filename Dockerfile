FROM ubuntu:16.04
MAINTAINER Ajay <ajay@hatio.in>

WORKDIR /root
RUN apt update

RUN yes | apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake

RUN apt-get install -y wget
RUN apt-get install unzip

RUN wget https://github.com/z-classic/zclassic/archive/master.zip
RUN unzip master.zip

VOLUME ["/opt/zclassiccore"]

RUN ls

RUN ./zclassic-master/zcutil/build.sh -j$(nproc)
RUN ./zclassic-master/zcutil/fetch-params.sh

EXPOSE 8023
EXPOSE 18023

CMD ["./zclassic-master/src/zcashd", "--conf=/opt/zclassiccore/zclassic.conf", "--printtoconsole"]
