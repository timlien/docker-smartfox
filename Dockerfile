FROM debian

MAINTAINER Tim Lien <timlientw@gmail.com>

ENV SMARTFOX_VERSION 2_12_0

RUN apt-get update && \
    apt-get install -y wget \
    unzip \
    git

RUN mkdir -p /var

WORKDIR /var

RUN wget http://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    tar xf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    rm SFS2X_unix_${SMARTFOX_VERSION}.tar.gz

RUN wget http://www.smartfoxserver.com/downloads/sfs2x/patches/SFS2X-Patch-2.12.1.zip && \
    unzip SFS2X-Patch-2.12.1.zip -d SmartFoxServer_2X && \
    rm SFS2X-Patch-2.12.1.zip && \
    cd SmartFoxServer_2X/SFS2X-Patch-2.12.1 && \
    ./install-linux.sh && \
    cd .. && \
    rm -rf SFS2X-Patch-2.12.1

WORKDIR /var/SmartFoxServer_2X/SFS2X

CMD ./sfs2x.sh

EXPOSE 8080 9933 8787