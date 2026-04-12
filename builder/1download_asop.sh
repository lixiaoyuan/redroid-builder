#!/bin/bash
WORKDIR=$(pwd)
export DEBIAN_FRONTEND=noninteractive

mkdir -p ~/bin
PATH=~/bin:$PATH

apt-get update
apt-get install -qq -y ca-certificates
apt-get install -qq -y --no-install-recommends \
    libxml2-utils

git config --global user.email "lixiaoyuan52@gmail.com"
git config --global user.name "lixy"

mkdir ${WORKDIR}/redroid && cd ${WORKDIR}/redroid
sudo repo init -u https://github.com/redroid-rockchip/platform_manifests.git -b redroid-12.0.0 --depth=1 --git-lfs
sudo repo sync -c

ls -alh ./

# 同步webview：
sudo apt install git-lfs
sudo repo forall -g lfs -c git lfs pull

cat build/soong/cc/config/global.go
