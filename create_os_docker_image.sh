#!/bin/bash

# This script is used to create a custome docker image from an OS ISO
# Ensure you've downloaded the correct version and are aware of the ISO size
# Large sizes can slow down image pulling/pushing and introduce bloat

# Create file system folders for parsing
# Function to display usage/help
usage() {
    echo "Usage: $0 -i os image -d docker repository import -u for custom user"
    echo -e "\t-i Name of the Docker image name to be created."
    echo -e "\t-d Docker OS iso."
    ehoo -e "\t-u Custom docker user <user>/docker_image"
    echo -e "\t-h Display this help message."
    exit 1
}

# Initialize variables
image_name=""
docker_image_name=""
docker_user="darknessoup"
docker_image_name="myDockerImage:${USER}"

# Parse command-line options
while getopts ":i:u:d:h" opt; do
    case "${opt}" in
        i) image_name=${OPTARG} ;;
        d) docker_image_name=${OPTARG} ;;
        u) docker_user=${OPTARG} ;;
        h) usage ;;
        *) usage ;;
    esac
done
# Display the constructed docker_image_name for debugging
echo "Docker User: $docker_user"
echo "Docker Image Name: $docker_image_name"

docker_image_fullname="${docker_user}"/"${docker_image_name}"
echo "Docker Image Full Name: $docker_image_fullname"
mkdir rootfs unsquashfs

sudo mount -o loop "${image_name}" rootfs
find . -type f | grep filesystem.squashfs
sudo unsquashfs -f -d unsquashfs/ rootfs/install/filesystem.squashfs
sudo tar -C unsquashfs -c . | docker import - "${docker_image_fullname}"
docker run -h ubuntu -i -t "${docker_image_fullname}"