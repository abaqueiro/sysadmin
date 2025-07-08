#!/bin/bash
set -ex
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl status docker.service
systemctl enable docker.service
systemctl start docker.service
systemctl status docker.service
