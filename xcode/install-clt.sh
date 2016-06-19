#!/usr/bin/env bash

set -euf -o pipefail

is_xcode_tools_installed() {  
  [ -d "$(xcode-select -p 2>/dev/null)" ]
}

waiting_message() {
  while ! $1
  do
    echo "Waiting for $2 installation to complete."
    sleep 20
  done
}

install_xcode_tools() {
  local name="Xcode Command Line Tools"
  if ! is_xcode_tools_installed
  then
    echo "Installing $name."
    xcode-select --install
    waiting_message is_xcode_tools_installed "$name"
  else
    echo "$name is already installed."
  fi
}

install_xcode_tools
