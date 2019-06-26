#!/bin/bash

#set -ex

#CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="static"
#TAG="${1}"

echo ${REGISTRY:-sivaprakash123}
echo ${TAG:-latest}
docker build -t ${REGISTRY:-sivaprakash123}/${IMAGE_NAME}:${TAG:-latest} .
docker push ${REGISTRY:-sivaprakash123}/${IMAGE_NAME}:${TAG:-latest}
