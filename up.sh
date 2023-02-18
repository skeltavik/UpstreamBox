#!/bin/sh

# All traffic via VPN
iptables -A OUTPUT -o tun0 -j ACCEPT
iptables -A OUTPUT -o eth0 -j DROP

# Start Tinyproxy
tinyproxy -c /proxy/tinyproxy.conf -d
