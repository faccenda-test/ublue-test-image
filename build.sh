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

ostree remote add 1password /tmp/1password.repo
rpm-ostre refresh-md
rpm-ostree install 1password

systemctl enable podman.socket

