#!/bin/bash
#
# File name: remove-stock-packages.sh
# Description: BananaWRT remove stock packages from upstream repository
#
# Copyright (c) 2024-2025 SuperKali <hello@superkali.me>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

rm -rf package/feeds/packages/lpac
rm -rf package/feeds/luci/luci-app-modemband
rm -rf package/feeds/packages/modemband
rm -rf package/feeds/luci/luci-app-3ginfo-lite
rm -rf package/feeds/luci/luci-i18n-modemband-*
rm -rf package/feeds/luci/luci-app-sms-tool-js*