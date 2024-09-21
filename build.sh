#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#flatpak -y install com.valvesoftware.Steam com.google.Chrome

rpm-ostree install tmux vlc


curl -Lo /tmp/1password-cli-latest.x86_64.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-cli-latest.x86_64.rpm
rpm-ostree install /tmp/1password-cli-latest.x86_64.rpm

curl -Lo /tmp/1password-latest.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
rpm-ostree install /tmp/1password-latest.rpm

systemctl enable podman.socket

