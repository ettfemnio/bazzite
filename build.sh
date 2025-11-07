#!/bin/bash
set -euxo pipefail

# install VirtualBox using script from bazzite-virtualbox
curl -L -o "/tmp/vbox.sh" "https://raw.githubusercontent.com/Preston159/bazzite-virtualbox/refs/heads/testing/build.sh"
chmod +x /tmp/vbox.sh
/tmp/vbox.sh

# install cosmic
dnf install -y cosmic-session

# install development tools
curl -L -o /tmp/vscode-x64.rpm 'https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64'
dnf install -y /tmp/vscode-x64.rpm
dnf install -y docker-cli
dnf install -y kate

# install cli tools
dnf install -y zsh
dnf install -y zoxide

# misc
curl -L -o /tmp/modrinth.rpm "$(curl 'https://launcher-files.modrinth.com/updates.json?new' | jq -r '.platforms["linux-x86_64"].install_urls | map(select(endswith(".rpm"))) | .[0]')"
dnf install -y /tmp/modrinth.rpm

dnf -y copr enable ilyaz/LACT
dnf install -y \
    waypipe \
    wayvnc \
    lact
