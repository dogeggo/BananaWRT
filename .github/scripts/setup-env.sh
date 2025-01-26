#!/bin/bash

echo "Updating package list..."
sudo apt -qq update

echo "Upgrading installed packages..."
sudo apt -qq full-upgrade -y

ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

COMMON_PACKAGES="ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext git gnutls-dev \
gperf haveged help2man intltool libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev \
libmpfr-dev libncurses-dev libpython3-dev libreadline-dev libssl-dev libtool libyaml-dev libz-dev \
lld llvm lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python3 python3-pip \
python3-ply python3-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools \
subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev zstd"

X86_64_PACKAGES="gcc-multilib g++-multilib libc6-dev-i386 lib32gcc-s1"
AARCH64_PACKAGES="libc6-dev"

install_packages() {
    for pkg in $1; do
        if dpkg -l | grep -qw "$pkg"; then
            echo "Package $pkg is already installed. Skipping..."
        else
            echo "Installing package: $pkg"
            sudo apt -qq install -y "$pkg"
        fi
    done
}

echo "Installing common packages..."
install_packages "$COMMON_PACKAGES"

if [ "$ARCH" == "x86_64" ]; then
    echo "Installing packages for x86_64..."
    install_packages "$X86_64_PACKAGES"
elif [ "$ARCH" == "aarch64" ]; then
    echo "Installing packages for aarch64..."
    install_packages "$AARCH64_PACKAGES"
else
    echo "Error: unknown architecture: $ARCH"
    exit 1
fi

echo "Cleaning up..."
sudo apt -qq autoremove --purge -y
sudo apt -qq clean

echo "Installation completed successfully!"
