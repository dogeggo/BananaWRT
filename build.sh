git clone https://github.com/immortalwrt/immortalwrt -b v24.10.1 immortalwrt
cp -r dts/nightly/* immortalwrt/target/linux/mediatek/dts/
cp -r 5G-Modem/5G-Modem-Support immortalwrt/package
cp .config immortalwrt/
cd immortalwrt
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make -j$(nproc) V=s