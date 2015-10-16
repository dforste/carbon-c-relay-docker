# Dockerfile
FROM gliderlabs/alpine

RUN apk --update add libgomp

ADD relay /bin/

VOLUME /conf

CMD /bin/relay -f /conf/carbon-c-relay.conf 