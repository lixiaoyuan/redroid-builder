#!/bin/bash


apt-get update
apt-get install -qq -y ca-certificates

apt-get install -qq -y --no-install-recommends \
    curl

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

mkdir -p /workspace/builder/redroid && cd mkdir /workspace/builder/redroid

# check supported branch in https://github.com/remote-android/redroid-patches.git
repo init -u https://android.googlesource.com/platform/manifest --git-lfs --depth=1 -b android-11.0.0_r48

# add local manifests
git clone https://github.com/remote-android/local_manifests.git /workspace/builder/redroid/.repo/local_manifests -b 11.0.0

echo '输出的内容'