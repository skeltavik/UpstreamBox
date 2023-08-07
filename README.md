# UpstreamBox
UpstreamBox is an Alpine Linux based Docker container that acts as a transparent proxy and can be used as a jumpbox to access domains which are only accessible via VPN. It currently supports OpenVPN and allows you to set the listening port using an environment variable.

## WIP
Currently not functional!

## Features
- Minimal [Alpine](https://hub.docker.com/_/alpine) Linux base image
- [Tinyproxy](https://tinyproxy.github.io/)-based transparent proxy
- Support for OpenVPN
- Ability to set the listening port using an environment variable

## To-Do
- [ ] Support for WireGuard, Anyconnect, and IKE
- [ ] 2FA-based VPN authentication via `oathtool`

## Getting started
To use UpstreamBox, you will need to provide the necessary VPN configuration files and credentials, and set up the appropriate settings for each VPN client. You can then start the container and configure your upstream settings in Burp Suite to use the container as a proxy.

## Building the container
You can build the container manually using the Docker build command. Run the following command from the directory containing the Dockerfile:
```bash
docker build -t upstreambox .
```
