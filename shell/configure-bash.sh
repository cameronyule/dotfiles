#!/usr/bin/env bash

set -euf -o pipefail

# Add the new shell to the list of acceptable shells
sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"

# Change the shell for the user
chsh -s /usr/local/bin/bash
