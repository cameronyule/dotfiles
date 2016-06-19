#!/usr/bin/env bash

set -euf -o pipefail

is_nix_installed() {
  type nix-env >/dev/null 2>&1
}

install_nix() {
  local name="Nix"
  if ! is_nix_installed
  then
    echo "Installing $name."
    curl https://nixos.org/nix/install | sh
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  else
    echo "$name is already installed."
  fi
}

install_nix
