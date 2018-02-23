#!/usr/bin/env bash

set -euf -o pipefail

dockutil --remove all

dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Fantastical\ 2.app
dockutil --add /Applications/Emacs.app
dockutil --add /Applications/Utilities/Terminal.app
dockutil --add /Applications/OmniFocus.app
dockutil --add /Applications/1Password\ 6.app
dockutil --add /Applications/Spotify.app
dockutil --add /Applications/Sonos.app

dockutil --add '~/Documents' --view grid --display folder
dockutil --add '~/Downloads' --view grid --display folder
