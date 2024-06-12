#!/bin/bash
set -x

# Update the package list and install the required packages
apt update && apt upgrade -y

DEBIAN_FRONTEND=noninteractive apt -yq upgrade

apt install -y \
    openssh-server \
    software-properties-common \
    wget \
    curl \
    apt-transport-https \
    ca-certificates \
    python3.12
