#!/bin/bash

docker pull erstt/redroid:15.0.0_ndk_magisk_AVD

docker images

docker save erstt/redroid:15.0.0_ndk_magisk_AVD | gzip > redroid_15_ndk_magisk.tar.gz

ls -alh 
