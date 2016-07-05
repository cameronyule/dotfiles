#!/usr/bin/env bash

set -euf -o pipefail

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  rsync --exclude "install-dotfiles.sh" \
    --exclude "Solarized Dark ansi.terminal" \
    --exclude "configure-bash.sh" \
    -avh --no-perms . ~;
  source ~/.bash_profile;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  doIt;
fi;

unset doIt;
