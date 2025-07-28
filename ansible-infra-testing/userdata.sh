#!/bin/bash
set -euxo pipefail

# Install Docker
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Start and enable Docker
systemctl enable --now docker
usermod -aG docker ec2-user

# Expand disk and resize LVM
growpart /dev/nvme0n1 4
pvresize /dev/nvme0n1p4

# Extend root and /var (you can adjust sizes or use +100%FREE if only one LV)
lvextend -r -L +20G /dev/RootVG/rootVol
lvextend -r -L +10G /dev/RootVG/varVol
