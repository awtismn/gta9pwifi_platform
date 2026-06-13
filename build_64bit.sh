#!/bin/bash

################################################################################
#
# Build Script
#
# Copyright Samsung Electronics(C), 2015
#
################################################################################

################################################################################
# Useage
#   : ./build.sh
#
################################################################################

CPU_JOB_NUM=$(grep processor /proc/cpuinfo | awk '{field=$NF};END{print field+1}')
echo "make -j$CPU_JOB_NUM ARCH=arm64 arch/arm64/configs/vendor/gta9pwifi_eur_open_defconfig"

echo
echo 'Build android platform'
echo

echo "source build/envsetup.sh"
source build/envsetup.sh
lunch aosp_arm64-user

make -j$CPU_JOB_NUM ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- arch/arm64/configs/vendor/gta9pwifi_eur_open_defconfig
make update-api
make -j$CPU_JOB_NUM ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
