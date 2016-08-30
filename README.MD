# jdel/docker-ffrk-proxy:0.8.0

- [Introduction](#introduction)
  - [Contributing](#contributing)
  - [Issues](#issues)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Persistence](#persistence)
- [Maintenance](#maintenance)
  - [Upgrading](#upgrading)
  - [Shell Access](#shell-access)
- [References](#references)

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [FFRK-Proxy](https://github.com/thauex/ffrk-proxy).

FFRK Proxy is a proxy for Final Fantasy Record Keeper written in node.js.

## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your awesome features and bug fixes
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).

## Issues

Before reporting your issue please try updating Docker to the latest version and check if it resolves the issue. Refer to the Docker [installation guide](https://docs.docker.com/installation) for instructions.

# Getting started

## Installation

Builds are available on [Docker Hub](https://hub.docker.com/r/jdel/ffrk-proxy/).

```bash
docker pull jdel/ffrk-proxy:0.8.0
```

Alternatively you can build the image yourself.

```bash
docker build -t jdel/ffrk-proxy github.com/jdel/docker-ffrk-proxy
```

## Quickstart

Start Openfire using:

```bash
docker run --name ffrk-proxy -d --restart=always \
  --publish 5050:5050 --publish 5051:5051 \
  jdel/ffrk-proxy:0.8.0
```

*Alternatively, you can use the sample [docker-compose.yml](docker-compose.yml) file to start the container using [Docker Compose](https://docs.docker.com/compose/)*

*Keep in mind to modify or delete the volume from docker-compose.yml if you just want the quick setup*

## Persistence

In order to be able to change the config file, you should mount a volume at `/ffrk/config`.

> *The [Quickstart](#quickstart) command already mounts a volume for persistence.*

When using a you need to set environment variables matching the ports in the config

```bash
docker run --name ffrk-proxy -d --restart=always \
  -p 6050:6050 -p 6051:6051 -e config=my_config_6050 \
  -e proxy_port=6050 -e cert_port=6051 \
  -v /srv/docker/ffrk/:/ffrk/config \
  jdel/ffrk-proxy:0.8.0
```

# Maintenance

## Upgrading

To upgrade to newer releases:

  1. Download the updated Docker image:

  ```bash
  docker pull jdel/ffrk-proxy:0.8.0
  ```

  2. Stop the currently running image:

  ```bash
  docker stop ffrk-proxy
  ```

  3. Remove the stopped container

  ```bash
  docker rm -v ffrk-proxy
  ```

  4. Start the updated image

  ```bash
  docker run -name ffrk-proxy -d \
    [OPTIONS] \
    jdel/ffrk-proxy:0.8.0
  ```

## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version `1.3.0` or higher you can access a running containers shell by starting `ash` using `docker exec`:

```bash
docker exec -it ffrk-proxy ash
```

# References

  * https://github.com/ThauEx/ffrk-proxy
