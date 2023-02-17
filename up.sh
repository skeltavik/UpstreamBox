#!/bin/sh

# Add a default route to the VPN gateway
ip route add default via $(ip route show 0.0.0.0/0 dev tun0 | awk '{print $3}')

# Redirect all traffic to the VPN gateway
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

# Drop all other traffic that is not going through the VPN
iptables -I FORWARD -i eth0 ! -o tun0 -j DROP

# Start Tinyproxy
tinyproxy -c /proxy/tinyproxy.conf -d
