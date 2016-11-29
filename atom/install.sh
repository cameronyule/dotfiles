#!/usr/bin/env bash

set -euf -o pipefail

is_atom_installed() {
  type atom >/dev/null 2>&1
}

install_atom_dependencies() {
  if is_atom_installed
  then
    apm install --packages-file packages.txt
  else
    echo "atom needs to be installed."
    return 1
  fi
}

install_atom_dependencies
