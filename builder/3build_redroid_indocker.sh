#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

#####################
# build redroid
#####################
cd /src

. build/envsetup.sh

lunch redroid_arm64-userdebug
# redroid_arm64-userdebug
# redroid_x86_64_only-userdebug (64 bit only, redroid 12+)
# redroid_arm64_only-userdebug (64 bit only, redroid 12+)

# start to build
m