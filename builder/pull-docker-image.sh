#!/bin/bash

# 检查参数是否存在，防止脚本空跑
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "使用方法: $0 <镜像名> <输出文件名>"
    exit 1
fi

echo "开始拉取镜像: $1"
docker pull --platform linux/arm64 "$1"

echo "当前本地镜像列表:"
docker images

# 创建目录（-p 确保目录存在时不报错）
mkdir -p release

echo "正在压缩导出镜像..."
docker save "$1" | gzip > "release/${2}"

# 切换目录并查看结果
cd release || exit
echo "导出完成，文件列表："
ls -alh
