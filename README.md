# WSL Distro Tars (WDT)

[![Distro tar generator](https://github.com/mvaisakh/wsl-distro-tars/actions/workflows/distro.yml/badge.svg?branch=main)](https://github.com/mvaisakh/wsl-distro-tars/actions/workflows/distro.yml)

A simple script that generates importable tar files for Windows Subsystem for Linux (WSL2). This allows users to install any desired distro on their WSL2 machine.
![Alpine Linux](https://i.imgur.com/t0h5GOu.png) ![ArchLinux](https://i.imgur.com/aQdRdiA.png)

## How is it different from distros available on the Microsoft Store?

Distros that are available on the Microsoft Store are really quite limited and filled with unwanted prebuilts that one might not want. This repository probably has your favourite distribution tarball available.

## What does it do?

This script generates WSL2 importable minimal tarballs that are extracted from docker containers.
At the moment only a few distributions are exported. These include:
* Adélie Linux
* Alpine Linux (Latest and Edge)
* Arch Linux (Stable and base-devel)
* CentOS
* Clear Linux
* Debian (Stable and Unstable with slim variants)
* Fedora (Stable and Rawhide)
* Gentoo (Latest stage3 tarballs)
* Kali Linux (Rolling release)
* openSUSE Tumbleweed
* Rocky Linux 9
* Ubuntu (Stable and Bleeding edge [devel])

Grab the latest tarballs of your favourite distro from the [Releases Page](https://github.com/mvaisakh/wsl-distro-tars/releases)!

## How do I import tarballs?

Make sure you have WSL2 setup properly and it is set to default.
To import any tarball:

`wsl --import distroName path\to\create\vhd path\to\downloaded\tarball`
> Replace __distroName__ with any name that you desire to call it, replace __path\to\create\vhd__ with the absolute path where you want to create the virtual hard disk of the distro and replace __path\to\downloaded\tarball__ with the absolute path to the downloaded tarball.

then to run your distro

`wsl -d distroName`

Example:
Here my __distroName__ is *alpine*, __virutal hard disk__ path is __D:\wslStorage__ and tarball is in __C:\Users\admin\Downloads\alpine-26122022.tar__

`wsl --import alpine D:\wslStorage\ C:\Users\admin\Downloads\alpine-26122022.tar`

to run

`wsl -d alpine`

## My favourite distro isn't available, what do I do?

**It's simple!**
The prerequisites for generating tarballs are `docker` and `awk`.
Edit the wsl-tar-gen.sh (but make sure your distro exists in [DockerHub](https://hub.docker.com/), since the script extracts everything from docker) and run the script using:

`bash wsl-tar-gen.sh`

## Contributing

If you want to your favourite distro updated in my repository, fork and clone the repository. Edit `wsl-tar-gen.sh` and edit the macro `DISTROS` and add your favourite distro name there. But again make sure that your distro exists in [DockerHub](https://hub.docker.com/)!

You can refer to [this example commit](https://github.com/mvaisakh/wsl-distro-tars/commit/92aa6a1) (make sure you follow the commit message style) and create a pull request to this repository
