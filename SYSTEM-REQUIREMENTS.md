# 🖥️ System Requirements for ZeroTrustBSD

To ensure optimal performance, security, and compatibility, please adhere to the recommended system requirements detailed below.

---

## 📦 Hardware Requirements

| Component                   | Minimum Requirement                | Recommended Specification                        |
|-----------------------------|------------------------------------|---------------------------------------------------|
| **Processor (CPU)**         | 4-Core (64-bit x86-64 or ARM64)    | AMD EPYC Embedded or Intel Xeon D (8+ cores recommended) |
| **Memory (RAM)**            | 8 GB                               | 16–32 GB DDR4 ECC RAM (for heavy workloads & virtualization) |
| **Storage**                 | 128 GB SSD                         | 256 GB+ NVMe SSD or RAID1 Mirrored SSD (for high availability) |
| **Networking Interfaces**   | 2 x 1GbE                           | 4+ x 10GbE/25GbE SFP+ interfaces (Intel, Mellanox, Broadcom) |
| **Crypto Accelerator (optional)** | -                             | Intel QuickAssist (QAT), FPGA-based accelerator (PCIe) |
| **Management Interface**    | 1 x Dedicated Ethernet             | 1GbE dedicated management port                   |
| **USB Port (ISO install)**  | 1 x USB 3.0                        | USB 3.0 or USB-C port                             |
| **Power Supply**            | Single PSU                         | Dual redundant PSUs (for enterprise/tactical deployment) |

---

## 🛠️ Software & OS Requirements

| Software Component          | Version                            | Notes                                             |
|-----------------------------|------------------------------------|---------------------------------------------------|
| **Operating System**        | OpenBSD 7.4 or later               | Ensure latest patches via OpenBSD `syspatch`      |
| **File System**             | FFS (default)                      | Native OpenBSD Fast File System                   |
| **Hypervisor (optional)**   | OpenBSD VMM (native)               | Included in base OS (for virtualization)          |
| **Containerization**        | OpenBSD Jails (native)             | Included in base OS                               |
| **Firewall**                | PF (Packet Filter, native)         | Native to OpenBSD                                 |
| **Routing Daemons**         | OpenBGPD, OpenOSPFD (native)       | Native to OpenBSD                                 |

---

## 🔐 Optional External Tool Integrations

These tools significantly enhance ZeroTrustBSD functionality but require separate external deployments:

| External Tool            | Deployment Method     | Recommended OS / Platform |
|--------------------------|-----------------------|---------------------------|
| **DynFi Manager**        | VM or Docker          | Ubuntu/Debian Linux       |
| **RCDevs OpenOTP**       | VM or Docker          | Official Linux Appliance  |
| **MISP/OpenCTI**         | Docker Compose        | Ubuntu/Debian Linux       |
| **CISO Assistant**       | Docker or Python app  | Ubuntu/Debian Linux       |
| **SoftEther VPN**        | VM or Docker          | Ubuntu/Debian Linux       |
| **Graylog**              | Docker Compose        | Ubuntu/Debian Linux       |
| **FRRouting**            | VM or Docker          | Ubuntu/Debian Linux       |

---

## 🌐 Networking & Connectivity Recommendations

- **MPLS/VXLAN support:** Integrated via OpenBGPD/FRRouting
- **VPN:** WireGuard (native), OpenVPN, IPsec via `iked`
- **Quantum Crypto:** Prepared for QKD (Quantum Key Distribution integration via external hardware)

---

## ✅ Compliance & Standards Supported

- 🇪🇺 GDPR, NIS2, DORA, ISO 27001
- 🛡️ NATO Standards (STANAG)
- 🔐 Quantum-ready (EuroQCI compatible)

---

## ⚠️ Important Notes

- Regularly apply security patches via OpenBSD’s `syspatch`.
- Maintain regular backups and verify configurations periodically.
- External integrations should always be secured with TLS/mTLS.

For further customization, scalability recommendations, or assistance, please consult the project's documentation or open an issue in this repository.
