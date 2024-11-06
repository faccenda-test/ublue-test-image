#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

curl -Lo /etc/pki/rpm-gpg/1password.asc https://downloads.1password.com/linux/keys/1password.asc
mv /tmp/1password.repo /etc/yum.repos.d/1password.repo

rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

rpm-ostree install tmux 1password

systemctl enable podman.socket

