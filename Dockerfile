# Version 1.0

FROM devdb/elasticsearch:latest

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
	mkdir -p /opt/kibana /etc/service/kibana; \
	wget -O - https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA2.tar.gz \
	| tar xzf - --strip-components=1 -C "/opt/kibana";

COPY run /etc/service/kibana/

WORKDIR /opt/kibana

EXPOSE 80

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*