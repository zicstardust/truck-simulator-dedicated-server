FROM debian:13.7-slim

ENV DEBIAN_FRONTEND="noninteractive"

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
COPY src/* /usr/local/bin/

RUN chmod +x /entrypoint.sh; \
	chmod +x /usr/local/bin/*; \
	\
	apt-get update; \
	apt-get -y upgrade; \
	apt-get -y --no-install-recommends install \
		ca-certificates \
		gosu \
		wget \
		lib32gcc-s1 \
		libx11-6 \
		libatomic1; \
	apt-get -y autoremove; \
	apt-get -y autoclean; \
	apt-get -y clean; \
	rm -Rf /var/lib/apt/lists/*; \
	\
	wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"; \
	mkdir -p /opt/steamcmd; \
	tar zxvf steamcmd_linux.tar.gz -C /opt/steamcmd/; \
	rm -f steamcmd_linux.tar.gz

EXPOSE 27015/tcp
EXPOSE 27015/udp
EXPOSE 27016/tcp
EXPOSE 27016/udp

VOLUME [ "/data" ]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["run.sh"]
