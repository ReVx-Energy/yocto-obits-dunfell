#!/usr/bin/env bash

echo "Setting up the build environment..."
export MACHINE="hihope-rzg2n"
TEMPLATECONF=$PWD/sources/meta-renesas/meta-rzg2h/docs/template/conf/ source sources/poky/oe-init-build-env build