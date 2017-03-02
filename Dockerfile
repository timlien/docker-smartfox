FROM debian

MAINTAINER Tim Lien <timlientw@gmail.com>

ENV SMARTFOX_VERSION 2_12_0
ENV SMARTFOX_PATCH_VERSION 2.12.3

RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip

RUN mkdir -p /tmp

WORKDIR /tmp

RUN wget http://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    tar xf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz

RUN wget http://www.smartfoxserver.com/downloads/sfs2x/patches/SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip && \
    unzip SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip -d SmartFoxServer_2X && \
    cd SmartFoxServer_2X/SFS2X-Patch-${SMARTFOX_PATCH_VERSION} && \
    ./install-linux.sh

WORKDIR /opt/SmartFoxServer_2X

VOLUME /opt/SmartFoxServer_2X

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080 9933 8787
CMD ["smartfox"]