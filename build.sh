#!/bin/bash
export FORCE_UNSAFE_CONFIGURE=1
git clone https://github.com/immortalwrt/immortalwrt -b v24.10.2 immortalwrt
cp -r dts/nightly/* immortalwrt/target/linux/mediatek/dts/
cp -r 5G-Modem/5G-Modem-Support immortalwrt/package
cp .config immortalwrt/
cd immortalwrt/package
wget -r -np -nH --cut-dirs=3 -R "index.html*" https://repo.superkali.me/releases/24.10.2/packages/additional_pack/
cd ..
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make -j$(nproc) V=s
