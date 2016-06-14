#!/usr/bin/env bash

set -euf -o pipefail

install_software_updates() {
  echo "Installing OS X software updates."
  softwareupdate --install --all
}

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
  if ! is_xcode_tools_installed
  then
    local name="Xcode Command Line Tools"
    echo "Installing $name."
    xcode-select --install
    waiting_message is_xcode_tools_installed "$name"
  fi
}

is_nix_installed() {
  test "$(type nix-env 2>/dev/null)"
}

install_nix() {
  if is_xcode_tools_installed && ! is_nix_installed
  then
    local name="Nix Package Manager"
    echo "Installing $name."
    curl https://nixos.org/nix/install | sh
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
}

is_homebrew_installed() {
  test "$(type brew 2>/dev/null)"
}

install_homebrew() {
  if is_xcode_tools_installed && ! is_homebrew_installed
  then
    local name="Homebrew"
    echo "Installing $name."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_development_tools() {
  install_xcode_tools
  install_nix
  install_homebrew
}

install_software_updates
install_development_tools

