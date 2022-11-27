#!/bin/sh

export PROJ=tl

docker build -t ${PROJ} .

# in case you want to publish to another registrar.
# docker image tag ${PROJ}:latest 127.0.0.1:5000/${PROJ}:latest

