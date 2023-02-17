FROM alpine:latest
LABEL maintainer="Bram Ruttens"
RUN apk add --no-cache tinyproxy openvpn
RUN modprobe tun
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY up.sh /vpn/up.sh
ENV TINYPROXY_PORT=8888
EXPOSE ${TINYPROXY_PORT}
WORKDIR /vpn
CMD ["openvpn", "--up", "/vpn/up.sh"]
