#!/usr/bin/env bash

set -euf -o pipefail

is_npm_installed() {
  type npm >/dev/null 2>&1
}

install_npm_dependencies() {
  if is_npm_installed
  then
    cat "./dependencies.txt" | xargs -n1 npm install -g
    npm update -g
  else
    echo "npm needs to be installed."
    return 1  
  fi
}

install_npm_dependencies
