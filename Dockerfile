FROM debian:7.11-slim as builder
MAINTAINER Tim Lien <timlientw@gmail.com>

ENV SMARTFOX_VERSION 2_13_0
ENV SMARTFOX_PATCH_VERSION 2.13.4

WORKDIR /tmp

RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get install -y wget unzip && \
	wget --no-check-certificate -q https://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
	wget --no-check-certificate -q https://www.smartfoxserver.com/downloads/sfs2x/patches/SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip && \
	tar xzf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
	unzip SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip -d SmartFoxServer_2X && \
	cd SmartFoxServer_2X/SFS2X-Patch-${SMARTFOX_PATCH_VERSION} && \
	./install-linux.sh && \
	cd .. && \
	rm -rf SFS2X-Patch-${SMARTFOX_PATCH_VERSION} SFS2X_unix_${SMARTFOX_VERSION}.tar.gz SFS2X-Patch-${SMARTFOX_PATCH_VERSION}.zip

FROM debian:7.11-slim

RUN mkdir -p /opt/SmartFoxServer_2X
COPY --from=builder /tmp/SmartFoxServer_2X /opt/SmartFoxServer_2X/
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh

WORKDIR /opt/SmartFoxServer_2X/SFS2X
#VOLUME docker-smartfox

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080 9933 9933/udp 8787 5000
