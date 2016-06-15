#!/usr/bin/env bash

set -euf -o pipefail

if ! fdesetup isactive >/dev/null
then
    currentuser="$(whoami)"
    echo "FileVault fde is not enabled for current user ($currentuser)."
    echo "Enabling…"
    sudo fdesetup enable -user "${currentuser}" -outputplist > ./FileVaultRecovery.plist
    echo "FileVault fde is now enabled."
    echo "Store your recovery key somewhere safe, then delete the plist."
else
    echo "FileVault fde is already enabled."
fi
