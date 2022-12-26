#!/bin/bash
# Copyright (C) 2022 Vaisakh Murali
# SPDX-License-Identifier: GPL-3.0-only

# Dependency check
if command -v docker > /dev/null 2>&1 ; then
    echo "docker found"
    echo "$(docker -v)"
else
    echo "docker not found! Please install docker and run this script again!"
    exit
fi

if command -v awk > /dev/null 2>&1 ; then
    echo "awk found"
    echo "$(docker -v)"
else
    echo "awk not found! Please install awk and run this script again!"
    exit
fi

# set dir for tars
export TAR_DIR="$PWD"

# parse desired distro
DISTROS=(
    "alpine"
    "archlinux"
    "centos"
    "debian"
    "fedora"
    "ubuntu"
)

# begin tar generation
for ELEMENT in ${DISTROS[@]}; do
    docker run -t $ELEMENT sh ls /
    containerID=$(docker container ls -a | grep -i $ELEMENT | awk '{print $1}')
    docker export $containerID > $TAR_DIR/$ELEMENT-$(date +%d%m%y).tar
    # Remove the docker image to avoid piling up of containers
    docker rm $containerID
done
