#!/usr/bin/env bash

CURR_DIR=$(pwd)
META_RENESAS_DIR="$CURR_DIR/sources/meta-renesas"
META_RZ_FEATURES_DIR="$CURR_DIR/sources/meta-rz-features"
META_RENESAS_BRANCH="dunfell/rzv2n"
META_RZ_FEATURES_BRANCH="dunfell"

check_and_setup_meta_renesas() {
    cd $META_RENESAS_DIR || exit 1
    if git rev-parse --verify --quiet refs/heads/$META_RENESAS_BRANCH; then
        echo "Branch $META_RENESAS_BRANCH already exists."
    else
        echo "Creating local branch $META_RENESAS_BRANCH for development..."
        repo start $META_RENESAS_BRANCH .
    fi
    cd $CURR_DIR || exit 1
}

check_and_setup_meta_rz_features() {
    cd $META_RZ_FEATURES_DIR || exit 1
    if git rev-parse --verify --quiet refs/heads/$META_RZ_FEATURES_BRANCH; then
        echo "Branch $META_RZ_FEATURES_BRANCH already exists."
    else
        echo "Creating local branch $META_RZ_FEATURES_BRANCH for development..."
        repo start $META_RZ_FEATURES_BRANCH .
    fi
    cd $CURR_DIR || exit 1
}


# Clone all the repositories
repo init -u $PWD -m manifest.xml
echo "------------------------------------------"

echo "Syncing repositories..."
repo sync -j$(nproc --all)
echo "------------------------------------------"

check_and_setup_meta_renesas
check_and_setup_meta_rz_features
echo "------------------------------------------"

echo "Setting up the build environment..."
TEMPLATECONF=$PWD/sources/meta-renesas/meta-rzg2h/docs/template/conf/ source sources/poky/oe-init-build-env build