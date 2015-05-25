#!/bin/bash

VERSION=0.3.1
BASE_DOWNLOAD_URL=https://github.com/rfk/pypyjs/releases/download/v${VERSION}

OUT_DIR=pypyjs
OUT_DIR_NOJIT=pypyjs-nojit

FILENAME=pypy.js-${VERSION}.tar.gz
DOWNLOAD_URL=${BASE_DOWNLOAD_URL}/${FILENAME}
ARCHIV_DIR=pypy.js-${VERSION}

FILENAME_NOJIT=pypy-nojit.js-${VERSION}.tar.gz
DOWNLOAD_URL_NOJIT=${BASE_DOWNLOAD_URL}/${FILENAME_NOJIT}
ARCHIV_DIR_NOJIT=pypy-nojit.js-${VERSION}


update () {
    set -x
    set -e # Exit immediately if a command exits with a non-zero status.

    wget --timestamp ${2}

    mkdir temp
    tar -xzf ${1} -C temp/
    rm ${1}

    mv -f temp/${3} ${4}
    rm -rf temp
}


update ${FILENAME} ${DOWNLOAD_URL} ${ARCHIV_DIR} ${OUT_DIR}
update ${FILENAME_NOJIT} ${DOWNLOAD_URL_NOJIT} ${ARCHIV_DIR_NOJIT} ${OUT_DIR_NOJIT}
