#!/bin/sh

# GPII Android prepare-files script
#
# Copyright 2013 Emergya
#
# Licensed under the New BSD license. You may not use this file except in
# compliance with this License.
#
# You may obtain a copy of the License at
# https://github.com/gpii/universal/LICENSE.txt

node_modules="gpii-files/node_modules"
android_modules="gpii-files/android/node_modules"

if [ -d $node_modules ]; then
    echo "$node_modules already exists"
else
    echo "$node_modules does not exist"
    echo "creating $node_modules"
    mkdir -p "$node_modules"
fi

if [ -d $android_modules ]; then
    echo "$android_modules already exists"
else
    echo "$android_modules does not exist"
    echo "creating $android_modules"
    mkdir -p "$android_modules"
fi

echo "Going to copy the js source code into gpii-files/ directory"
cp -rf ../node_modules/universal gpii-files/node_modules/
cp -rf node_modules/activitymanager gpii-files/android/node_modules/
cp gpii.js gpii-files/android/

echo "Creating gpii-files.tar.gz ..."
tar czf gpii-files.tar.gz gpii-files
