#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Remove default packages from luci repository
rm -rf package/feeds/luci/luci-app-modemband
rm -rf package/feeds/packages/modemband
rm -rf package/feeds/luci/luci-app-3ginfo-lite
rm -rf package/feeds/luci/luci-i18n-modemband-*
rm -rf package/feeds/luci/luci-app-sms-tool-js*
