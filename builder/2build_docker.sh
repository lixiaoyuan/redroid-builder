#!/bin/bash

export DEBIAN_FRONTEND=noninteractive


#####################
# create builder
#####################
docker build --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) -t redroid-builder .