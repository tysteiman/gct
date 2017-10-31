#!/bin/bash

GCT=$PWD/gct.sh
TARGET=/usr/local/bin/gct

if [ -f "$GCT" ]; then
    ln -s $GCT $TARGET

    if [ $? -eq 0 ]; then
        echo "GCT has been installed successfully."
    fi
fi
