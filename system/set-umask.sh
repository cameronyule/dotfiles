#!/usr/bin/env bash

set -euf -o pipefail

# https://support.apple.com/en-gb/HT201684

sudo launchctl config user umask 077
