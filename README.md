# 🛡️ ZeroTrustBSD – Military-Grade OpenBSD Firewall Platform

**ZeroTrustBSD** is a next-generation, military-grade firewall and network security platform based on [OpenBSD](https://www.openbsd.org), designed for sovereign cloud deployments, national cybersecurity operations, operational technology (OT), industrial control systems (ICS), and enterprise-grade multi-tenancy. It is fully BSD-licensed and optimized for mission assurance, cyber defense, and regulatory compliance across telecom, government, energy, manufacturing, and finance sectors.

---

## 🌍 Overview

ZeroTrustBSD integrates:
- Hardened OpenBSD secure kernel
- DynFi centralized firewall management
- RCDevs OpenOTP identity and MFA
- Suricata, Wazuh, Zeek for threat detection
- WireGuard, IPsec, OpenVPN, and QKD-ready crypto
- OpenBGPD, VXLAN, MPLS, and SD-WAN capabilities
- CISO Assistant for automated compliance
- eBPF, Prometheus, Filebeat, and ELK for observability
- 🏭 OT/ICS Compatibility with Purdue Model segmentation

---

## 🧱 Key Components

| Category               | Tools/Tech                          |
|------------------------|-------------------------------------|
| Firewall Management    | DynFi Manager                       |
| IAM & Authentication   | RCDevs OpenOTP, LDAP, AD, Entra ID  |
| IDS & Threat Detection | Suricata, Wazuh, Zeek, OSSEC, YARA  |
| Threat Intelligence    | MISP, OpenCTI                       |
| Observability          | eBPF, Prometheus, Filebeat, ELK     |
| Networking             | OpenBGPD, VXLAN, OSPF, MPLS         |
| Virtualization         | VMM, Jails, VLANs, Anchors          |
| VPN & PKI              | WireGuard, OpenVPN, strongSwan      |
| Compliance Automation  | CISO Assistant                      |
| OT/ICS Security        | Purdue Model, Modbus/DNP3 inspection, isolated VLANs |
| DevSecOps & GitOps     | Ansible, Terraform, GitHub Actions  |

---

## 📦 Quick Start

```sh
doas sh install.sh
```

- Review `/etc/pf.conf` and adjust anchors per tenant
- Configure VMs using `/etc/vm.conf` and `vmctl`
- Enable DynFi agent and RCDevs auth as needed
- Isolate SCADA/PLC network in L1-L3 per Purdue segmentation
- Logs and metrics forwarded via Filebeat/Prometheus

---

## 🔐 Security Architecture

- Default-deny firewall policy
- MFA-protected VPN and SSH
- Per-tenant microsegmentation using VMM + jails
- Purdue Model L1–L5 segmentation for ICS networks
- Encrypted telemetry and audit-ready logging
- QKD-ready crypto stack for STANAG/NATO interop

---

## 📁 Included Files

| File                           | Description |
|--------------------------------|-------------|
| `install.sh`                   | Bootstrap script for services and configuration |
| `pf.conf`                      | Default deny + anchors + logging + VLAN rules |
| `tenant-example.md`            | How-to: microsegmentation with VMM and jails |
| `tenant-deployment.md`        | ASCII network diagram and YAML blueprint |
| `MIL-GRADE_DEPLOYMENT_PRACTICES.md` | Best practices for defense-grade deployment |
| `release-notes.md`             | Version release overview |
| `CHANGELOG.md`                 | Version changes and features log |

---

## 📜 Compliance Mapping

- 🇪🇺 GDPR, NIS2, DORA
- 📘 ISO/IEC 27001:2022
- 🛰️ STANAG 4774/4754 (QKD-ready)
- 🏭 IEC 62443 for OT/ICS environments

---

## 🛰️ Designed For

- Ministries and Agencies (EU, GCC, ASEAN)
- CERT/SOC & Military Cyber Units
- Critical Infrastructure Operators (OT/ICS)
- Regulated Enterprises (Banking, Energy, Manufacturing)
- Sovereign Cloud Providers

---

## 🧠 Why ZeroTrustBSD?

- Secure by design – powered by OpenBSD
- Fully open source and BSD-licensed
- Zero Trust, DevSecOps, and STIG-ready
- Multi-tenant & microsegmented deployments
- Built for digital sovereignty and industrial resilience

---

## 📥 Downloads
### Work in progress
- [📦 Deployment Bundle (.zip)](./ZeroTrustBSD-Tenant-Bundle.zip)
- [🗜️ Release Archive (.tar.gz)](./ZeroTrustBSD-Tenant-Bundle.tar.gz)
- [📄 Release Notes](./release-notes.md)
- [📝 Changelog](./CHANGELOG.md)

---

## 📘 License

This project is licensed under the **BSD 2-Clause License**. See [`LICENSE.md`](./LICENSE.md) for full text.

---

🛡️ Proudly engineered for sovereign cybersecurity & critical infrastructure  
Maintained by **Vimana Systems**
