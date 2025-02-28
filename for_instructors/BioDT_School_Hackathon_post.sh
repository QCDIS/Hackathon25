#!/bin/bash

if [ -z "$CW_INSTALLATION_PREFIX" ]; then
    echo "Unknown installation prefix"
    exit 1
fi

BINDIR="$CW_INSTALLATION_PREFIX/bin"
mkdir -p "$BINDIR"

wget https://github.com/It4innovations/hyperqueue/releases/download/v0.21.1/hq-v0.21.1-linux-x64.tar.gz
tar -xvf hq-v0.21.1-linux-x64.tar.gz
rm hq-v0.21.1-linux-x64.tar.gz
mv hq "$BINDIR/"

