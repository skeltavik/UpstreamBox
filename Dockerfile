FROM alpine:latest
RUN apk add --no-cache tinyproxy openvpn
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
RUN mkdir /proxy
COPY up.sh /proxy/up.sh
RUN chmod +x /proxy/up.sh
ENV TINYPROXY_PORT=8888
EXPOSE ${TINYPROXY_PORT}
CMD ["/usr/sbin/tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf"]
