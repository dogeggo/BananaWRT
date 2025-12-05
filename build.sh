#!/bin/bash
apt update -y
apt full-upgrade -y
apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
  bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib \
  g++-multilib git gnutls-dev gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev \
  libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses-dev libpython3-dev \
  libreadline-dev libssl-dev libtool libyaml-dev libz-dev lld llvm lrzsz mkisofs msmtp nano \
  ninja-build p7zip p7zip-full patch pkgconf python3 python3-pip python3-ply python3-docutils \
  python3-pyelftools qemu-utils re2c rsync scons squashfs-tools subversion swig texinfo uglifyjs \
  upx-ucl unzip vim wget xmlto xxd zlib1g-dev zstd
# bash -c 'bash <(curl -s https://build-scripts.immortalwrt.org/init_build_environment.sh)'
export FORCE_UNSAFE_CONFIGURE=1
git clone https://github.com/immortalwrt/immortalwrt -b v24.10.4 immortalwrt
cp -r patch/kernel/dts/stable/* immortalwrt/target/linux/mediatek/dts/
cp -r patch/kernel/files/stable/drivers/leds/trigger immortalwrt/target/linux/mediatek/files/drivers/leds/
# cp -r 5G-Modem/5G-Modem-Support immortalwrt/package
cp .config immortalwrt/
cd immortalwrt
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make -j$(nproc) V=s
nohup make -j$(nproc) V=s > build.log 2>&1 &
