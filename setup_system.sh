#!/usr/bin/env bash

repo init -u $PWD -m manifest.xml
repo sync -j$(nproc --all)