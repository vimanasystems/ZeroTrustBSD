# 🧠 ZeroTrustBSD Hardware Compatibility & Strategy Guide

This guide outlines hardware recommendations for deploying ZeroTrustBSD in secure, sovereign, and high-performance environments. It includes support for general-purpose infrastructure, tactical deployments, 5G/SDR, satellite comms, and MPLS-based routing.

---

## ✅ Recommended Hardware Platforms

| Platform       | Example Chips / SoCs                        | Why It's Recommended |
|----------------|---------------------------------------------|-----------------------|
| **x86_64**     | Intel Xeon-D, AMD EPYC Embedded              | Mature OpenBSD support, high throughput |
| **ARM64**      | Marvell OCTEON TX2, Ampere Altra, Raspberry Pi 4 | Energy efficient, edge-ready |
| **RISC-V**     | SiFive HiFive Unmatched, StarFive VisionFive 2 | Sovereignty-aligned, export-control-free |
| **Open FPGA**  | QuickLogic EOS S3, Lattice iCE40             | Lightweight, customizable crypto / I/O |
| **Secure Boot**| System76 Thelio, Purism Librem, Coreboot     | BIOS verification and firmware transparency |

---

## 🔐 Open Silicon & Crypto Modules

| Purpose             | Recommended Hardware     | Use Case |
|---------------------|--------------------------|----------|
| **TPM 2.0 (Verifiable)** | Infineon SLB9665, ST TPMs  | Secure boot & attestation |
| **Open HSM**         | Nitrokey HSM2, Yubico HSM | SSH, VPN, PKI key storage |
| **Open Root of Trust**| OpenTitan (experimental)  | Next-gen hardware assurance |

---

## 📦 Deployment Models

| Mode           | Hardware Focus                        | Use Case |
|----------------|----------------------------------------|----------|
| **Edge Node**  | Fanless ARM/x86 with PoE, SSD         | Field security or IoT mesh |
| **Data Center**| Xeon/EPYC + ECC RAM + 10G NIC         | High-throughput firewall or BGP core |
| **Air-Gapped** | USB-bootable SSD, offline logging     | Audit-compliant ministries, CERTs |
| **Cloud VM**   | VMM/Bhyve/QEMU/KVM/OpenStack          | Sovereign private cloud or tenant model |

---

## 📡 Tactical & Communications Hardware

### Tactical SDR & 5G

| Use Case         | Hardware                      | Description |
|------------------|-------------------------------|-------------|
| Private LTE/5G   | LimeSDR, USRP B210, srsRAN     | 5G slicing, OpenRAN with firewall per slice |
| Mesh RF / Field  | HackRF One, XTRX, Airspy       | Tactical mesh & relay with eBPF inspection |
| RF Threat Intel  | KerberosSDR, RTL-SDR           | Detect anomalies, jamming, spectrum attack |

### MPLS / Routing

| Component        | Hardware / Software            | Notes |
|------------------|-------------------------------|-------|
| Carrier MPLS     | Juniper, MikroTik, Intel SR-IOV | MPLS label-aware, native pf + relayd |
| Routing Control  | OpenBGPD, FRRouting            | Deploy inside VMM or jail per tenant |

### Satellite Integration

| Use Case         | Hardware                       | Description |
|------------------|--------------------------------|-------------|
| Failover / OOB   | Iridium Edge, RockBLOCK 9603   | Serial/SMS-style CLI tunneling |
| Broadband SatCom | Starlink CPE, VSAT             | Hardened access via WireGuard/IPsec |

---

## 🔐 Overlay Networking & Segmentation

ZeroTrustBSD supports the following network overlays for microsegmentation and tenant isolation:

- **VXLAN**: Use with private 5G, edge mesh
- **WireGuard**: Lightweight VPN over satellite or LTE
- **IPsec**: Site-to-site tunnels with OpenBGPD
- **802.1X / MACsec**: For internal trust zone enforcement
- **pf.conf anchors**: Per-tenant rules and NAT zones

---

## 🧱 Recommended Appliances

| Role           | Base Hardware                  | Add-ons |
|----------------|--------------------------------|---------|
| Branch Gateway | x86 fanless, 4+ NIC, AES-NI    | TPM2, LTE modem |
| Data Center HA | Dual Xeon, 10G NICs, BMC       | HSM, ECC memory, Coreboot |
| Tactical Node  | ARM SBC + SDR + solar/PoE      | PXE fallback, encrypted syslog |

---

## 🧠 Summary

| Design Priority     | Hardware Strategy |
|----------------------|-------------------|
| Sovereignty          | Avoid proprietary firmware and binary blobs |
| Security             | Secure boot, HSMs, pf-based segmentation |
| Longevity            | RISC-V and open FPGA for national programs |
| Portability          | USB install, PXE-ready, multi-platform |

> OpenBSD inside. Trusted everywhere.
