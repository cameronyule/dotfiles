#!/usr/bin/env bash

set -euf -o pipefail

install_software_updates() {
  echo "Installing OS X software updates."
  softwareupdate --install --all
}

install_software_updates

