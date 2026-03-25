#!/bin/bash

docker pull --platform linux/arm64 erstt/redroid:15.0.0_ndk_magisk_AVD

docker images

mkdir release

docker save erstt/redroid:15.0.0_ndk_magisk_AVD | gzip > release/redroid_15_ndk_magisk.tar.gz

cd release

ls -alh 
