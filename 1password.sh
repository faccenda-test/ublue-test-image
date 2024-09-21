#!/bin/bash

set -ouex pipefail

curl -Lo /tmp/1password-latest.rpm https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
rpm -i /tmp/1password-latest.rpm