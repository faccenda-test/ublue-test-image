#!/bin/bash

set -ouex pipefail

curl -Lo /tmp/1password-cli-latest.x86_64.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-cli-latest.x86_64.rpm
curl -Lo /tmp/1password-latest.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

rpm-ostree install /tmp/1password-cli-latest.x86_64.rpm
rpm-ostree install /tmp/1password-latest.rpm
