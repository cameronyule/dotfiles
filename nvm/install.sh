#!/usr/bin/env bash

set -euf -o pipefail

is_nvm_installed() {
  type nvm >/dev/null 2>&1
}

install_nvm() {
  if ! is_nvm_installed
  then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
  fi
}

install_nvm
