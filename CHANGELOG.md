# 📦 CHANGELOG

All notable changes to **BananaWRT** will be documented in this file.

---
## [2025-08-01]

### 🧩 Additional Packages

- 🔼 `luci-app-3ginfo` and hide temperature when is zero by @SuperKali  
- 🛠️ `luci-app-3ginfo`-lite: correct grammar issue by @SuperKali  
- 🛠️ adding new packages: luci-proto-quectel & quectel-cm by @SuperKali  

### 🍌 BananaWRT Core

- 🗑️ scripts: remove luci-proto-quectel & quectel-cm from stock packages by @SuperKali  
- 🏗️ workflow: build sdk matrix, change ftp action to manual command by @SuperKali  
- 🔄 docs: update changelog for 2025-07-12 (#84) by @SuperKali  

---

## [2025-07-12]

### 🍌 BananaWRT Core

- 🔼 bump (stable) immortalwrt to version v24.10.2 by @SuperKali  
- 🛠️ workflow: sdk added nproc input by @SuperKali  

---

## [2025-06-26]

### 🍌 BananaWRT Core

- 🔼 bump immortalwrt to version v24.10.2 (#80) by @SuperKali  
- 🔄 docs: update changelog for 2025-06-19 (#79) by @SuperKali  

---

## [2025-06-19]

### 🧩 Additional Packages

- 🐛 3ginfo: fix netdrv value to retrieve qmi protocol for fibocom fm160 by @SuperKali  
- ➕ modem: add first support to fibocom fm160-eau on 3ginfo-lite & `modemband` package by @SuperKali  
- 🐛 `linkup-optimization`: fix locatime by timezone by @SuperKali  

### 🍌 BananaWRT Core

- 🔼 build(deps): bump softprops/action-gh-release from 2.2.2 to 2.3.2 (#77) by @dependabot[bot]  

---

## [2025-06-08]

### 🧩 Additional Packages

- 🛠️ `banana-utils`: added the current firmware information on banana-updater script by @SuperKali  
- 🔼 `luci-app-fan` and allow to compile for all devices by @SuperKali  
- 🗑️ atc-fib-fm350_gl: remove detect_and_set_apn from unnecessary checks by @SuperKali  

### 🍌 BananaWRT Core

- 🔄 scripts: updated banana-update script from `banana-utils` package by @SuperKali  

---

## [2025-06-01]

### 🧩 Additional Packages

- 🐛 workflow: fix builder packages by @SuperKali  
- 🐛 atc-apn-database: fix compile on arm64 by @SuperKali  
- 🐛 workflows: fix permission on script execution by @SuperKali  
- 🛠️ workflows: renamed some script with new's by @SuperKali  
- 🐛 atc-fib-fm350_gl: fix minor issue when debug is enabled by @SuperKali  

### 🍌 BananaWRT Core

- 🐛 changelog: fix some issue on changelog  generator by @SuperKali  
- 🐛 changelog: trying to fix duplicated commits by @SuperKali  
- 🛠️ scripts: checks if file exist by @SuperKali  
- 🐛 dts: add missing #address-cells and #size-cells to fix the dtc warnings by @SuperKali  
- 🗑️ scripts: remove empty space on metadata generator by @SuperKali  
- 🐛 scripts: fix error on source formatter.sh by @SuperKali  
- 🐛 metadata: fix formatter source by @SuperKali  
- 🐛 workflows: fix create release tag by @SuperKali  
- 🏗️ scripts: added formatted info on build workflow by @SuperKali  
- ➕ scripts: add packages mapping to avoid errors by @SuperKali  
- 🐛 scripts: fix some issue on setup script by @SuperKali  
- 🛠️ scripts: better check if packages is already installed by @SuperKali  
- 🛠️ workflow: aligned all script for generate bananawrt metadata by @SuperKali  
- 🗑️ workflow: remove print empty release tag by @SuperKali  
- 🛠️ workflow: testing metadata generator into the bananawrt system by @SuperKali  
- 🛠️ scripts: moved to the correct directory and named with correctly name by @SuperKali  

---


## [2025-05-21]

### 🧩 Additional Packages

- 🗑️ Atc-apn-database and atc-fib-fm350_gl: remove unnecessary information by @SuperKali  
- 🐛 Atc-apn-database & atc-fib-fm350_gl, minor fixes by @SuperKali  
- ➕ Atc-apn-database: Bump version and added MIT License by @SuperKali  
- 🔄 `linkup-optimization`: Removed wifi config and updated network conf by @SuperKali  

---


## [2025-05-11]

### 🧩 Additional Packages

- ➕ Added support for automatic APN detection by using atc-apn-database package by @SuperKali  
- ➕ Luci-proto-atc & atc-fib-fm350: clean up and add check if apn is already configured by @SuperKali  
- 🔼 Bump: `linkup-optimization` to 2.23 by @SuperKali  
- 🗑️ `linkup-optimization`: Remove default apn by @SuperKali  
- 🐛 ATC: minor fixes on apn auto detection by @SuperKali  
- 🐛 ATC: minor fixes on apn auto detection by @SuperKali  
- 🐛 ATC: fix some issue on apn auto detection by @SuperKali  
- 📢 ATC: first support to auto apn connection by @SuperKali  
- 🔼 Bumps: `linkup-optimization` and luci-app-sms-tool and revert AT port to ttyUSB1 by @SuperKali  

---


## [2025-05-04]

### 🧩 Additional Packages

- 🔄 `luci-app-3ginfo`: Remove adb dependency by @SuperKali  

---


## [2025-05-01]

### 🍌 BananaWRT Core

- 🔼 Bump stable version to v24.10.1 by @SuperKali  
- 🔄 Docs: Update CHANGELOG for 2025-04-24 (#54) by @SuperKali  
- 🔼 Bump actions/download-artifact from 4.2.1 to 4.3.0 (#6) by @dependabot[bot]  

---


## [2025-04-24]

### 🧩 Additional Packages

- 🐛 `banana-utils`: Fix hostname function. by @SuperKali  
- 🌟 `luci-app-fan`: Improve hardware path detection in uci-defaults script by @SuperKali  
- 🐛 `luci-app-fan`: Fix some stuff by @SuperKali  
- 🔄 `luci-app-fan`: Remove warning if pwm_enable not exist and remove the box from UI by @SuperKali  
- 🐛 `luci-app-fan`: Fix an issue if pwm enable is missing by @SuperKali  
- 🐛 `banana-utils`: Fix repository configuration. by @SuperKali  

### 🍌 BananaWRT Core

- 🔼 Bump actions/setup-python from 4 to 5 (#50) by @dependabot[bot]  
- 🔼 Bump softprops/action-gh-release from 2.2.1 to 2.2.2 (#51) by @dependabot[bot]  
- 🔄 Docs: Update CHANGELOG for 2025-04-18 (#48) by @SuperKali  

---


## [2025-04-18]

### 🧩 Additional Packages

- 🐛 `banana-utils`: Fix repository configuration. by @SuperKali  

---


## [2025-04-17]

### 🧩 Additional Packages

- 🔼 Bump: `banana-utils` to v1.09 by @SuperKali  
- 🛠️ `banana-utils`: Optimizing banana-restore process by @SuperKali  
- 🔄 `luci-app-fan`: Updated warn and crit values of notifications by @SuperKali  
- 🔄 `luci-app-fan`: Remove invalid translation by @SuperKali  
- 🌟 Feat: improve `luci-app-fan` UI and notifications by @SuperKali  
- 🐛 Bump versioning of `linkup-optimization` and luci-app-sms-tool and fix default tty port for send AT command and SMS by @SuperKali  

### 🍌 BananaWRT Core

- 🧪 CHANGELOG: revert to test by @SuperKali  
- ⏪ CHANGELOG: revert previous commit and try another method by @SuperKali  
- 🗑️ CHANGELOG: remove safe directory by @SuperKali  
- 🐛 CHANGELOG: fixing additional pack checks by @SuperKali  
- 🔄 Docs: Update CHANGELOG for 2025-04-17 (#43) by @SuperKali  
- 🐛 CHANGELOG: fixing wrong issue to get information by @SuperKali  
- 🐛 CHANGELOG: fixing some issues 1 by @SuperKali  
- 🐛 CHANGELOG: fixing some issues by @SuperKali  
- 🐛 CHANGELOG: fix issue on formatting commit message by @SuperKali  
- ➕ CHANGELOG: Adding automatic changelog updater by @SuperKali  
- 🔼 Bump ImmortalWRT to version v24.10.1 (#40) by @SuperKali  
- ➕ CHANGELOG: added the release of 2025-04-16 by @SuperKali  

---


## [2025-04-12]

### 🧩 Additional Packages

- 🔼 `luci-app-fan`: bump version to **v1.0.11** & improve time range button layout on mobile by @SuperKali  
- 🔼 `luci-app-fan`: bump version to **v1.0.10** by @SuperKali  
- 🔼 `luci-app-fan`: bump version to **v1.0.9** by @SuperKali  
- 📊 `luci-app-fan`: add temperature history chart by @SuperKali  
- 🫥 `luci-app-fan`: hide average temperature when modem is not monitored by @SuperKali  
- 🔼 `luci-app-fan`: bump version to **v1.0.8** by @SuperKali  
- ⚙️ `luci-app-fan`: add option to disable modem temperature monitoring by @SuperKali  
- 🔧 `banana-utils` & `linkup-optimization`: bump versioning, moved hostname logic to `banana-utils` and changed hostname from **LinkUP** to **BananaWRT** by @SuperKali  
- 📝 README: added `luci-app-fan` to packages list by @SuperKali  

---

## [2025-04-09]

### 🧩 Additional Packages

- 🐛 `luci-app-fan`: fix permission on install by @SuperKali  
- 🛠️ `luci-app-fan`: temporarily removed "Do not monitor modem" from CBI by @SuperKali  
- 🚀 `luci-app-fan`: first release – includes backend control script and LuCI interface by @SuperKali  

### 🍌 BananaWRT Core

- 🌬️ Add first support to a brand new fan control interface by @SuperKali  
- 🐞 issue_templates: add bug report template, inspired from ImmortalWRT by @SuperKali  
- 📜 Added CODE_OF_CONDUCT.md by @SuperKali  
- 🔗 CHANGELOG: fix wrong link in BananaWRT section by @SuperKali  
- 📄 release-template: added redirect link to changelog by @SuperKali  
- ♻️ Align script from banana-utils by @SuperKali  

---

## [2025-04-07]

### 🧩 Additional Packages

- ➕ Added condition to remove the log file if it exists on every `sysupgrade` execution by @SuperKali  
- 🔼 Bumped `banana-utils` to **v1.05** by @SuperKali  
- 🛠️ Fixed unsupported parameter usage in `sh` scripts by @SuperKali  
- ℹ️ Added more detailed information on package restore process by @SuperKali  
- ⏱️ Reverted sleep time to **10 seconds** in relevant scripts by @SuperKali  
- 🐛 Fixed issue during package installation by @SuperKali  
- 🛠️ Fixed unknown options and enabled service start at boot by @SuperKali  
- ♻️ Initial support for automatic restoration of overlay packages by @SuperKali  
- 📄 Updated `README` documentation for better clarity by @SuperKali  
- 🔄 Created a separate package to handle functionalities previously bundled with `linkup-optimization` by @SuperKali  
- 🔧 Bumped `modemband` and `linkup-optimization`; added **caching** and **overheat protection** on fan control by @SuperKali  
- 🔁 Bumped `linkup-optimization`: introduced support to update packages via `banana-update` by @SuperKali  
- 📝 Adjusted default configuration for `3g-info` utility by @SuperKali  

### 🍌 BananaWRT Core

- 🛠️ Fixed self-hosted (manual) workflow failures by @SuperKali  
- 🔧 Updated **stable** and **nightly** build configurations by @SuperKali  
- ➕ Added support in `userscript` to update `additional_pack` from repository without updating the entire board by @SuperKali  
- 📦 Bumped `actions/upload-artifact` from `4.6.1` to `4.6.2` (#29) by @dependabot[bot]  
- 🔄 Updated GitHub worker list from `README` by @SuperKali  
- 🧹 Added cleanup input to `self-hosted` workflow by @SuperKali  
- ➕ Re-added x86 worker to the workflow list by @SuperKali  
- 🗑️ Removed deprecated runner info from documentation by @SuperKali  
- 🛠️ Fixed missing functions in update script and added `--reset` flag to restore full configuration by @SuperKali  
- 📢 Added more detailed explanations in feature section by @SuperKali  

---

🛠️ Maintained with ❤️ by [BananaWRT](https://github.com/SuperKali/BananaWRT)  
📅 Release date: **August 01, 2025**