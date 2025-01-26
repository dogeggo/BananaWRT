<div align="center">
  <img src="https://cdn.superkali.me/1113423827479274/bananawrt-logo.png" alt="BananaWRT Logo" width="350px" height="auto">
  <h2>BananaWRT</h2>
  
  [![Stable](https://img.shields.io/github/actions/workflow/status/SuperKali/BananaWRT/immortalwrt-builder-stable.yml?label=Stable&style=for-the-badge&logo=github)](https://github.com/SuperKali/BananaWRT/actions/workflows/immortalwrt-builder-stable.yml)
  [![Nightly](https://img.shields.io/github/actions/workflow/status/SuperKali/BananaWRT/immortalwrt-builder-nightly.yml?label=Nightly&style=for-the-badge&logo=github)](https://github.com/SuperKali/BananaWRT/actions/workflows/immortalwrt-builder-nightly.yml)
  [![Checker](https://img.shields.io/github/actions/workflow/status/SuperKali/BananaWRT/immortalwrt-checker.yml?label=Checker&style=for-the-badge&logo=github)](https://github.com/SuperKali/BananaWRT/actions/workflows/immortalwrt-checker.yml)
  
</div>


**BananaWRT** is a custom distribution based on **ImmortalWRT**, specifically optimized for the **Banana Pi R3 Mini** paired with the **Fibocom FM350** modem. This project leverages GitHub Actions for automated compilation, ensuring seamless and up-to-date builds.

## Features

- Optimized support for **Banana Pi R3 Mini** hardware.
- Compatibility with the **Fibocom FM350** modem.
- Automated builds using GitHub Actions.
- Based on the stable and feature-rich **ImmortalWRT** distribution.

---

## Hardware Specifications

### Banana Pi R3 Mini
| Specification                | Details                                     |
|------------------------------|---------------------------------------------|
| **CPU**                      | MediaTek MT7986B (quad-core ARM Cortex-A53) |
| **RAM**                      | 2GB DDR4                                    |
| **Storage**                  | 8GB eMMC, microSD slot, USB support         |
| **Networking**               | 2x 2.5GbE Ethernet ports                    |
| **Wi-Fi**                    | Dual-band Wi-Fi 6 (802.11ax)                |
| **Hardware Acceleration**    | Offloading for Wi-Fi and NAT                |
| **Expansion**                | 1x PCIe slot                                |
| **Power**                    | 12V/2A DC input                             |

### Fibocom FM350

| Specification                | Details                                       |
|------------------------------|-----------------------------------------------|
| **Modem Type**               | 5G NR Sub-6GHz / LTE / WCDMA                  |
| **Max Download Speed**       | 4.67 Gbps                                     |
| **Max Upload Speed**         | 1.25 Gbps                                     |
| **NR Bands**                 | n1/2/3/7/25/28/30/38/40/41/48/66/77/78/79     |
| **LTE Bands**                | b1/2/3/4/7/25/30/32/34/38/39/40/41/42/43/48/66|
| **Interface**                | M.2 Key-B (USB 3.1 Gen1) or (PCIe Gen3 x1)    |
| **GPS**                      | Supported                                     |
| **Power**                    | 3.3V DC                                       |

---

## ⚙️ GitHub Runner Self-Hosted

This repository uses self-hosted runners to enhance performance and control in CI/CD workflows.

### Runner Specifications

| Worker Name         | Architecture | CPU                | RAM   | Storage         | Network          | Location      |
| ------------------  | ------------ | ------------------ | ----- | --------------- | ---------------- | ------------- |
| **manu-server-01**  | x86\_64      | 32-vCore, 3.3 GHz  | 32 GB | 50 GB SSD       | 10 Gbps          | Italy         |
| **netcup-us-arm64** | ARM64        | 10-vCore, 3.0 GHz  | 16 GB | 512 GB NvME SSD | 2.5 Gbps         | United States |

Each worker is optimized for specific CI/CD tasks and managed by the development team to ensure reliability and performance.

If you want to contribute a new worker, please open an issue in this repository to discuss the details and integration process.

## ⭐ Star History

If you find this project useful, consider giving it a star ⭐. It’s a great way to show your support and helps me stay motivated to improve and grow the project.

[![Star History Chart](https://api.star-history.com/svg?repos=SuperKali/BananaWRT&type=Date)](https://star-history.com/#SuperKali/BananaWRT&Date)


## 🔧 Contributions

Contributions are welcome! Please open issues for bugs or feature requests and submit pull requests for code changes.


