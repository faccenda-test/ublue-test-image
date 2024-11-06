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

curl -Lo /etc/pki/rpm-gpg/google.asc https://dl.google.com/linux/linux_signing_key.pub


cat > /etc/yum.repos.d/1password.repo << EOF
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/1password.asc
EOF

curl -Lo /tmp/google-chrome-stable.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

rpm-ostree install tmux /tmp/google-chrome-stable.rpm
rpm-ostree status
rpm-ostree upgrade


systemctl enable podman.socket

