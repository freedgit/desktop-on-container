#!/bin/sh

# if you want to build:
# bash build.sh

export pwd=$(pwd)
docker rm -f ctl
docker-compose -f tchelinux.yml up -d

