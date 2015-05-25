#!/bin/bash

VERSION=0.3.1
FILENAME=pypy.js-${VERSION}.tar.gz
DOWNLOAD_URL=https://github.com/rfk/pypyjs/releases/download/v${VERSION}/${FILENAME}

(
    set -x
    set -e # Exit immediately if a command exits with a non-zero status.

    wget --timestamp ${DOWNLOAD_URL}

    mkdir temp
    tar -xzf ${FILENAME} -C temp/
    rm ${FILENAME}

    mv temp/pypy.js-${VERSION} pypyjs/
    rm -rf temp
)