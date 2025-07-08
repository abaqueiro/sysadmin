#!/bin/bash
set -e

if [ "$AZ_AGENT_VERSION" = '' ]; then
	cat <<'EOM'
===============================================================
This script will setup the Azure agent in the current directory
and with the current user, so do not forget to run first

    mkdir agent && cd agent

ERROR: AZ_AGENT_VERSION variable is not set or empty
Please set variable to the version number you want to install
Ej:

    export AZ_AGENT_VERSION='4.248.0'

Optional you can provide different architecture from x64 with
(valid options are: x64, arm, arm64)

    export AZ_AGENT_ARCH='arm'

EOM
exit 1
fi

if [ "$AZ_AGENT_ARCH" = '' ]; then
	AZ_AGENT_ARCH='x64'
fi
case "$AZ_AGENT_ARCH" in
	x64|arm|arm64)
	;;
	*)
		echo "ERROR: AZ_AGENT_ARCH $AZ_AGENT_ARCH not supported."
		exit 1
	;;
esac

FILE="vsts-agent-linux-$AZ_AGENT_ARCH-$AZ_AGENT_VERSION.tar.gz"
URL="https://download.agent.dev.azure.com/agent/$AZ_AGENT_VERSION/$FILE"
echo "===== Setup of Azure Agent ====="
echo "Azure Agent download url: $URL"
echo "Downloading ..."
wget -O "$FILE" --continue -- "$URL"
echo "[ OK ]"
tar zxvf "$FILE"
echo "[ OK ] Files extracted"
echo "Installing agent ..."
./config.sh
echo "[ OK ] Agent installed"

