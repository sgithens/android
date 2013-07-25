#!/bin/bash

# Clone anode
if [ -d 'anode' ]; then
    echo 'Anode already checked out'
else
    git clone git://github.com/paddybyers/anode.git
fi

# Issue a warning if you don't have ANDROID_HOME set

# Set ANODE_ROOT env variable
export ANODE_ROOT=$(pwd)/anode

# Fetch node binaries from webinos
if [ -d 'app/assets' ]; then
    echo 'assets directory already created!'
else
    mkdir -p app/assets
fi

curl -o app/assets/bridge.node https://raw.github.com/webinos/Webinos-Platform/master/webinos/platform/android/app/assets/bridge.node
curl -o app/assets/libjninode.so https://raw.github.com/webinos/Webinos-Platform/master/webinos/platform/android/app/assets/libjninode.so

# Fetch jtar
if [ -f 'app/libs/jtar-1.1.jar' ]; then
    echo 'jtar already donwloaded!'
else
    mkdir -p app/libs
fi

curl -o app/libs/jtar-1.1.jar http://jtar.googlecode.com/files/jtar-1.1.jar
