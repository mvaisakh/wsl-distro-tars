#!/usr/bin/env bash

# Copyright (C) 2022 Vaisakh Murali
# SPDX-License-Identifier: GPL-3.0-only

# Dependency check
if command -v docker > /dev/null 2>&1 ; then
    echo "docker found"
    docker -v
else
    echo "docker not found! Please install docker and run this script again!"
    exit
fi

if command -v awk > /dev/null 2>&1 ; then
    echo "awk found"
else
    echo "awk not found! Please install awk and run this script again!"
    exit
fi

# set dir for tars
export TAR_DIR="$PWD/tars"

# Create tar dir
mkdir -p "$TAR_DIR"

# parse desired distro
DISTROS=(
    "adelielinux/adelie"
    "almalinux:latest"
    "almalinux:minimal"
    "alpine:latest"
    "alpine:edge"
    "amazonlinux:2"
    "amazonlinux:latest"
    "archlinux"
    "archlinux:base-devel"
    "clearlinux"
    "debian"
    "debian:stable-slim"
    "debian:unstable"
    "debian:unstable-slim"
    "fedora"
    "fedora:rawhide"
    "gentoo/stage3:latest"
    "gentoo/stage3:systemd"
    "kalilinux/kali-rolling"
    "opensuse/tumbleweed"
    "rockylinux:9"
    "rockylinux:9-minimal"
    "ubuntu"
    "ubuntu:devel"
)

# begin tar generation
for ELEMENT in "${DISTROS[@]}"; do
    docker run -t "$ELEMENT" sh -c echo
    containerID=$(docker container ls -a | grep -i "$ELEMENT" | awk '{print $1}')
    TAR_NAME=$(echo "$ELEMENT" | tr '/' '_')-$(date -u +%d%m%Y%I%M).tar
    docker export "$containerID" > "$TAR_DIR"/"$TAR_NAME"
    # Remove the docker image to avoid piling up of containers
    docker rm "$containerID"
done
