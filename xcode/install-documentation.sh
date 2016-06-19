#!/usr/bin/env bash

set -euf -o pipefail

is_apple_developer_documentation_installed() {  
  [ -d "$HOME/Library/Application\ Support/Dash/DocSets/OSX" ]
}

# If you only install the Xcode Command Line Tools and not the Xcode application,
# there's no easy way to download the Apple Developer documentation docset.
#
# NB: the complete Apple Developer documentation requires a substantial
# amount of disk space, in the region of 2.5GB, when installed.
#
install_apple_developer_documentation() {
  local name="Apple Developer Documentation"

  # Download URLs are discoverable via the following listing
  # https://developer.apple.com/library/downloads/docset-index.dvtdownloadableindex
  local download_path="http://devimages.apple.com.edgekey.net/docsets/20160321"
  local download_name="031-52211-A.dmg"

  local mounted_volume="/Volumes/OSXDocsetCD"
  local mounted_package="OSXDocset.pkg"
  local install_dir="com.apple.adc.documentation.OSX.docset"

  # I choose to keep the docset file alongside the others I have for Dash
  local docset_dir="$HOME/Library/Application Support/Dash/DocSets/OSX"

  local currentuser="$(whoami)"
  
  if ! is_apple_developer_documentation_installed
  then
    echo "Installing $name."
    cd /tmp  
    curl -O "$download_path/$download_name"
    sudo hdiutil attach "$download_name"
    sudo installer -package "$mounted_volume/$mounted_package" -target /
    sudo chown -R "$currentuser":staff "/$install_dir"
    sudo mkdir -p "$docset_dir"
    sudo mv "/$install_dir" "$docset_dir"
    sudo hdiutil detach "$mounted_volume"
    rm "$download_name"
    echo "$name installed to $docset_dir/$install_dir"
  else
    echo "$name is already installed."
  fi
}

install_apple_developer_documentation
