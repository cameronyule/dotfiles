#!/usr/bin/env bash

set -euf -o pipefail

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  rsync --exclude "install.sh" \
	-avh --no-perms . ~/.emacs.d;
  cd ~/.emacs.d;
  cask install
}

read -p "This may overwrite existing files in your ~/.emacs.d directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  doIt;
fi;

unset doIt;
