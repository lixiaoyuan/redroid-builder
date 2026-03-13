#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

mkdir -p ~/bin
PATH=~/bin:$PATH

git config --global user.email "lixiaoyuan52@gmail.com"
git config --global user.name "lixy"

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

builder_dir=/builder
redroid_dir=${builder_dir}/redroid
redroid_patch_dir=${builder_dir}/redroid-patches

mkdir -p $redroid_dir && cd $redroid_dir

# check supported branch in https://github.com/remote-android/redroid-patches.git
repo init -u https://android.googlesource.com/platform/manifest --git-lfs --depth=1 -b android-11.0.0_r48

# add local manifests
git clone https://github.com/remote-android/local_manifests.git ${redroid_dir}/.repo/local_manifests -b 11.0.0

echo 'sync -c'

# sync code
repo sync -c

echo 'apply redroid patches'

# apply redroid patches
git clone https://github.com/remote-android/redroid-patches.git $redroid_patch_dir
${redroid_patch_dir}/apply-patch.sh ${redroid_dir}

echo '输出的内容'