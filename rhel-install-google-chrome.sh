#!/bin/bash
set -e
echo "Configurando Google Chrome YUM repository"
cat >/etc/yum.repos.d/google-chrome.repo <<"CONFIG_END"
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
CONFIG_END
echo "[ OK ]"
echo "Instalando Google Chrome Stable ..."
dnf update
dnf install -y google-chrome-stable
