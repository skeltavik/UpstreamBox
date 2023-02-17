FROM alpine:latest
RUN apk add --no-cache tinyproxy openvpn
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY up.sh /vpn/up.sh
RUN chmod +x /vpn/up.sh
ENV TINYPROXY_PORT=8888
EXPOSE ${TINYPROXY_PORT}
CMD ["/usr/sbin/tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf"]
