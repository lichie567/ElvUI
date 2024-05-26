#!/bin/bash

output="$1"
version="$2"

if [ -d "./.release" ]; then
  rm -rf "./.release"
fi

if [  ! -z "$version" -a "$version" != ""  ]; then
  tocFiles=(
    "ElvUI/ElvUI_Mainline.toc"
    "ElvUI/ElvUI_Classic.toc"
    "ElvUI/ElvUI_Cata.toc"
    "ElvUI_Libraries/ElvUI_Libraries_Mainline.toc"
    "ElvUI_Libraries/ElvUI_Libraries_Classic.toc"
    "ElvUI_Libraries/ElvUI_Libraries_Cata.toc"
    "ElvUI_Options/ElvUI_Options_Mainline.toc"
    "ElvUI_Options/ElvUI_Options_Classic.toc"
    "ElvUI_Options/ElvUI_Options_Cata.toc"
  )

  for file in "${tocFiles[@]}"
  do
    sed -i "s/Version: .*$/Version: v$version/" "$file"
  done

  if [  ! -z "$output" -a "$output" != ""  ]; then
    ./packager/release.sh
    cp ./.release/ElvUI-*.zip "$output"
  fi
fi