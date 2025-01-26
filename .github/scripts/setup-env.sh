#!/bin/bash

echo "Updating package list..."
sudo apt -qq update

ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

COMMON_PACKAGES="ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext \
libelf-dev libfuse-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev \
libmpfr-dev libncurses5-dev libncursesw5-dev libpython3-dev libreadline-dev \
libssl-dev libtool lrzsz mkisofs msmtp ninja-build p7zip p7zip-full patch \
pkgconf python3 python3-pyelftools python3-setuptools qemu-utils \
rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip \
vim wget xmlto xxd zlib1g-dev"

X86_64_PACKAGES="gcc-multilib g++-multilib libc6-dev-i386 python2.7 help2man intltool"
AARCH64_PACKAGES="libc6-dev"

if [ "$ARCH" == "x86_64" ]; then
    echo "Installing packages for x86_64..."
    sudo apt -qq install -y $COMMON_PACKAGES $X86_64_PACKAGES
elif [ "$ARCH" == "aarch64" ]; then
    echo "Installing packages for aarch64..."
    sudo apt -qq install -y $COMMON_PACKAGES $AARCH64_PACKAGES
else
    echo "Error: unknown architecture: $ARCH"
    exit 1
fi

echo "Cleaning up..."
sudo apt -qq autoremove --purge -y
sudo apt -qq clean

echo "Installation completed successfully!"
