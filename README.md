# 🛡️ ZeroTrustBSD – Military-Grade OpenBSD Cybersecurity Appliance

[![BSD Licensed](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](LICENSE)
![OpenBSD Based](https://img.shields.io/badge/Built%20on-OpenBSD-yellow.svg)

## 🌟 What is ZeroTrustBSD?

**ZeroTrustBSD** is a military-grade, next-generation firewall and cybersecurity appliance built on the robust, secure, and proven foundation of **OpenBSD**. Designed for the highest levels of security, compliance, and operational reliability, ZeroTrustBSD delivers a fully integrated Zero Trust network security model out-of-the-box.

---

## 🎖️ Key Features

| Feature               | Description                                                  |
|-----------------------|--------------------------------------------------------------|
| 🔒 **Security-First OS** | Built on OpenBSD’s secure-by-default architecture.         |
| 🔎 **Real-time Threat Detection** | Integrated Suricata, Zeek, OSSEC, and Wazuh for robust IDS/IPS. |
| 🌐 **Advanced Networking** | Full support for MPLS, VXLAN, BGP, OSPF, IPsec, WireGuard, OpenVPN. |
| 🛰️ **Quantum-Ready Security** | Prepared for Quantum Key Distribution (QKD) and Post-Quantum Cryptography. |
| 📡 **Software-Defined Radio (SDR)** | SDR integration (e.g., srsRAN, OpenAirInterface) for secure tactical communications. |
| 📊 **Real-Time Observability** | Powerful eBPF monitoring, Prometheus/Grafana dashboards, and ELK log analytics. |
| 🚩 **Compliance Automation** | Pre-configured for GDPR, NIS2, DORA, ISO 27001, NATO STANAG, MITRE ATT&CK standards. |
| 🧩 **Centralized Management** | Native integration with DynFi Manager for seamless firewall control. |
| 🔐 **Identity & Authentication** | Supports RCDevs OpenOTP, LDAP, RADIUS, PAM for robust IAM. |
| 🗃️ **Multi-Tenant Isolation** | Built-in microsegmentation via OpenBSD VMM and jails. |
| ⚙️ **Automation & IaC** | Native Ansible, Terraform, GitOps integration for DevSecOps workflows. |

---

## 🚀 Quickstart Guide

### 📋 [System Requirements](SYSTEM_REQUIREMENTS.md)

- CPU: 64-bit (AMD64 or ARM64), 4+ cores recommended
- RAM: 8GB minimum, 16-32GB recommended
- Storage: 128GB SSD minimum (256GB NVMe recommended)
- Network: Minimum dual Gigabit Ethernet (recommended quad-port 10G SFP+)

### 🔧 [Installation Guide](installation-guide.md)

```bash
# Create USB installation media (Linux/macOS)
sudo dd if=zerotrustbsd.iso of=/dev/sdX bs=4M status=progress && sync
```

- Boot from USB
- Follow straightforward installation steps
- Install recommended security packages after initial setup

---

## ⚙️ [Configuration Guide](configuration.md)

Quick example of firewall rules (`/etc/pf.conf`):

```pf
set skip on lo
block all
pass out keep state
pass in proto tcp to port { ssh http https } keep state
```

Reload firewall rules:

```sh
doas pfctl -f /etc/pf.conf
```

---

## 🌐 [External Integrations](EXTERNAL_INTEGRATION_GUIDE.md)

Enhance your ZeroTrustBSD appliance with external integrations:

- **DynFi Manager** – Central firewall policy management
- **RCDevs OpenOTP** – Multi-factor authentication
- **MISP/OpenCTI** – Threat intelligence integration
- **CISO Assistant** – Compliance and audit automation
- **SoftEther VPN** – Advanced VPN integration
- **Graylog/ELK** – Centralized log management
- **FRRouting** – Advanced routing (BGP, OSPF, MPLS)

---

## 🤝 Contributing

We welcome community contributions:

- [Contribution Guide](CONTRIBUTION.md)
- Open an issue to discuss improvements or feature requests.
- Submit pull requests with clear explanations and updates.

---

## 📜 License

ZeroTrustBSD is open-source software licensed under the [BSD 3-Clause License](LICENSE).

---

## 🛠️ Maintainers & Support

- Developed and maintained by **Vimana Systems**, committed to open-source cybersecurity.
- For commercial support or custom integrations, contact via GitHub issues or email.

---

## 📌 Disclaimer

ZeroTrustBSD is provided as-is without warranty. Ensure compliance with applicable local and international laws and regulations.

