#!/bin/bash

output="$1"

if [ -d './.release' ]; then
  rm -rf './.release'
fi

./packager/release.sh

cp ./.release/ElvUI-*.zip "$output"