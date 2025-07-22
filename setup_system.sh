#!/usr/bin/env bash

# Clone all the repositories
repo init -u $PWD -m manifest.xml
repo sync -j$(nproc --all)

TEMPLATECONF=$PWD/meta-renesas/meta-rzg2h/docs/template/conf/ source sources/poky/oe-init-build-env build