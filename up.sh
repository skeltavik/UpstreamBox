#!/bin/sh

# Route HTTP(S) traffic via VPN
iptables -I OUTPUT -p tcp --dport 80 -j MARK --set-mark 1
iptables -I OUTPUT -p tcp --dport 443 -j MARK --set-mark 1
ip rule add fwmark 1 table 100
ip route add default via $(ip route show 0.0.0.0/0 dev tun0 | awk '{print $3}') table 100

# Start Tinyproxy
tinyproxy -c /proxy/tinyproxy.conf -d
