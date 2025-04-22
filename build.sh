#!/bin/bash

INSTALL_PACKAGES="ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext git gnutls-dev \
gperf haveged help2man intltool libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev \
libmpfr-dev libncurses-dev libpython3-dev libreadline-dev libssl-dev libtool libyaml-dev libz-dev \
lld llvm lrzsz mkisofs nano ninja-build p7zip p7zip-full patch pkgconf python3 python3-pip \
python3-ply python3-docutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools \
subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev zstd gh git jq \
gcc-multilib g++-multilib libc6-dev-i386 lib32gcc-s1 \
libc6-dev libdw-dev zlib1g-dev liblzma-dev libelf-dev libpfm4 libpfm4-dev libbabeltrace-dev libbabeltrace-ctf-dev libtool-bin"
apt update
apt install -y INSTALL_PACKAGES
export FORCE_UNSAFE_CONFIGURE=1
git clone https://github.com/immortalwrt/immortalwrt -b v24.10.1 immortalwrt
cp -r dts/nightly/* immortalwrt/target/linux/mediatek/dts/
cp -r 5G-Modem/5G-Modem-Support immortalwrt/package
cp .config immortalwrt/
cd immortalwrt/package
wget -r -np -nH --cut-dirs=3 -R "index.html*" https://repo.superkali.me/releases/24.10.0/packages/additional_pack/
cd ..
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make -j$(nproc) V=s