FROM alpine:latest
RUN apk add --no-cache tinyproxy openvpn
RUN mkdir /proxy
COPY tinyproxy.conf /proxy/tinyproxy.conf
COPY up.sh /proxy/up.sh
RUN chmod +x /proxy/up.sh
ENV TINYPROXY_PORT=8888
EXPOSE ${TINYPROXY_PORT}
CMD ["/usr/sbin/tinyproxy", "-d", "-c", "/proxy/tinyproxy.conf"]
