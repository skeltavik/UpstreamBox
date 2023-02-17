#!/bin/sh

# Debug
ls -la /proxy

# Start Tinyproxy
tinyproxy -d -c tinyproxy.conf
