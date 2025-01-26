#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

source "$SCRIPT_DIR/functions/formatter.sh"

ACTION=$1

if [ -z "$ACTION" ]; then
    error "Usage: $0 [setup|clean]"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive

info "Updating package list..."
sudo apt -qq update

ARCH=$(uname -m)
info "Detected architecture: $ARCH"

COMMON_PACKAGES="ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext git gnutls-dev \
gperf haveged help2man intltool libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev \
libmpfr-dev libncurses-dev libpython3-dev libreadline-dev libssl-dev libtool libyaml-dev libz-dev \
lld llvm lrzsz mkisofs nano ninja-build p7zip p7zip-full patch pkgconf python3 python3-pip \
python3-ply python3-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools \
subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev zstd gh git"

X86_64_PACKAGES="gcc-multilib g++-multilib libc6-dev-i386 lib32gcc-s1"
AARCH64_PACKAGES="libc6-dev"

manage_packages() {
    local packages=$1
    local action=$2

    for pkg in $packages; do
        if [ "$action" == "setup" ]; then
            info "Installing package: $pkg"
            sudo apt -qq install -y "$pkg" >/dev/null 2>&1 && \
            success "Package $pkg installed successfully." || \
            error "Failed to install package $pkg."
        elif [ "$action" == "clean" ]; then
            info "Removing package: $pkg"
            sudo apt -qq remove --purge -y "$pkg" >/dev/null 2>&1 && \
            success "Package $pkg removed successfully." || \
            error "Failed to remove package $pkg."
        fi
    done
}

if [ "$ACTION" == "setup" ]; then
    info "Upgrading installed packages..."
    sudo apt -qq full-upgrade -y >/dev/null 2>&1 && \
    success "System upgraded successfully." || \
    error "System upgrade failed."

    section "Setting up common packages"
    manage_packages "$COMMON_PACKAGES" "setup"

    if [ "$ARCH" == "x86_64" ]; then
        section "Setting up packages for x86_64"
        manage_packages "$X86_64_PACKAGES" "setup"
    elif [ "$ARCH" == "aarch64" ]; then
        section "Setting up packages for aarch64"
        manage_packages "$AARCH64_PACKAGES" "setup"
    else
        error "Unknown architecture: $ARCH"
        exit 1
    fi
elif [ "$ACTION" == "clean" ]; then
    section "Cleaning up common packages"
    manage_packages "$COMMON_PACKAGES" "clean"

    if [ "$ARCH" == "x86_64" ]; then
        section "Cleaning up packages for x86_64"
        manage_packages "$X86_64_PACKAGES" "clean"
    elif [ "$ARCH" == "aarch64" ]; then
        section "Cleaning up packages for aarch64"
        manage_packages "$AARCH64_PACKAGES" "clean"
    else
        error "Unknown architecture: $ARCH"
        exit 1
    fi
else
    error "Invalid action: $ACTION"
    error "Usage: $0 [setup|clean]"
    exit 1
fi

info "Final cleaning..."
sudo apt -qq autoremove --purge -y >/dev/null 2>&1 && \
success "Unused packages removed successfully." || \
error "Failed to remove unused packages."
sudo apt -qq clean >/dev/null 2>&1 && \
success "Package cache cleaned successfully." || \
error "Failed to clean package cache."

success "Operation completed successfully!"