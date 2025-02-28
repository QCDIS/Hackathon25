#!/bin/bash

if [ -z "$CW_INSTALLATION_PREFIX" ]; then
    echo "Unknown installation prefix"
    exit 1
fi

BIN1DIR="$CW_INSTALLATION_PREFIX/bin"
BIN2DIR="$CW_INSTALLATION_PREFIX/_bin"
mkdir -p "$BIN1DIR"
mkdir -p "$BIN2DIR"

wget https://github.com/It4innovations/hyperqueue/releases/download/v0.21.1/hq-v0.21.1-linux-x64.tar.gz
tar -xvf hq-v0.21.1-linux-x64.tar.gz
cp -v hq "$BIN1DIR/"
cp -v hq "$BIN2DIR/"
rm hq
rm hq-v0.21.1-linux-x64.tar.gz
echo "DONE"

