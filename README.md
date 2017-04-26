## Simple and the latest nginx image on top of the latest Ubuntu

This repository contains **Dockerfile** of [Nginx](https://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://hub.docker.com/r/sgrio/ubuntu-nginx/) published to the public [Docker Hub](https://hub.docker.com/).

The default server is listening to port 80 and port 443 with a self-signed certificate. If you send **GET** request to **/ping** will return code 200 and plain text "I'm up!", other locations will return 404 error. For more details of the configuration, please check the source code hosted at [Github](https://github.com/sgr-io/docker-ubuntu-nginx).

### Docker Tags

`sgrio/ubuntu-nginx` provides only one single tagged image:

* `latest` (default): build on top of `sgrio/ubuntu-base:latest`

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/sgrio/ubuntu-nginx/) from public [Docker Hub](https://hub.docker.com/): `docker pull sgrio/ubuntu-nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="sgrio/ubuntu-nginx" https://raw.githubusercontent.com/sgr-io/docker-ubuntu-nginx/master/Dockerfile`)

### Usage

    docker run -d sgrio/ubuntu-nginx
