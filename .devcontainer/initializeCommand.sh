#!/bin/bash

ROOT_DIR_PATH=$(git rev-parse --show-toplevel)
DOCKER_IMAGE="darknessoup/petalinux-18.04.02_2024"

# ensure user and Ids are correct
USER=${USER:-${whoami}}

DEV_CONTAINER_FOLDER="${ROOT_DIR_PATH}/.devcontainer"
export DOCKER_IMAGE_NAME="darknessoup/petalinux-2019.2"
docker build -f ${DEV_CONTAINER_FOLDER}/Dockerfile \
    --build-arg DOCKER_IMAGE="${DOCKER_IMAGE}" \
    -t ${DOCKER_IMAGE_NAME}:"20240703_1" .
    #--build-arg USERNAME="${USER}" \
    #--build-arg USER_UID="$(id -u)" \
    #--build-arg USER_GID="$(id -g)" \

