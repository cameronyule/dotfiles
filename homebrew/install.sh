#!/usr/bin/env bash

set -euf -o pipefail

is_homebrew_installed() {
  type brew >/dev/null 2>&1
}

install_homebrew() {
  local name="Homebrew"
  if ! is_homebrew_installed
  then
    echo "Installing $name."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "$name is already installed."
  fi
}

install_homebrew
