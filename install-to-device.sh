#!/bin/sh

# GPII Android Install Script
#
# Copyright 2012 OCAD University
#
# Licensed under the New BSD license. You may not use this file except in
# compliance with this License.
#
# You may obtain a copy of the License at
# https://github.com/gpii/universal/LICENSE.txt

node_modules="../node_modules"
universal="../node_modules/universal"
repoURL="git://github.com/GPII/universal.git" 

if [ -d $node_modules ]; then
    echo "$node_modules already exists"
else
    echo "$node_modules does not exist"
    echo "creating $node_modules"
    mkdir -p "$node_modules"
fi
if [ -d $universal ]; then
    echo "$universal already exists"
else
    echo "$universal does not exist"
    echo "cloning universal"
    git clone "$repoURL" "$universal"
fi

echo "Going to put the GPII Javascript source on the device"
./prepare-files.sh
adb push gpii-files.tar.gz /sdcard/
adb shell "rm -r /sdcard/gpii-files.tar"
adb shell "cd /sdcard && gunzip gpii-files.tar.gz && tar xvf gpii-files.tar"

adb install platform/app/bin/GpiiApp-debug.apk
