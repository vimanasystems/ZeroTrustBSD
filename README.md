# ZeroTrustBSD Firewall 🔒

**OpenBSD Enterprise Firewall with DynFi Manager Integration**  
**Developed and Maintained in Luxembourg 🇱🇺**

## 🚀 Introduction

ZeroTrustBSD is a robust, secure, and enterprise-grade firewall built on OpenBSD, designed specifically for public administrations, enterprises, and local governments. With integrated centralized management through DynFi Manager, it simplifies deployment, management, and compliance with EU cybersecurity standards (NIS2, GDPR).

## 🌟 Key Features

- **OpenBSD-based Security:** Proven security foundation.
- **DynFi Integration:** Centralized firewall and network management.
- **Zero Trust Architecture:** Identity-based access, full visibility.
- **Quantum-Resistant Encryption:** Supports post-quantum cryptographic algorithms.
- **VPN Solutions:** WireGuard, OpenIKED (IKEv2/IPsec), OpenVPN.
- **Real-Time Threat Intelligence:** Integrated with Suricata IDS, MISP, AlienVault OTX.
- **High Availability:** CARP and pfsync for seamless redundancy.
- **Identity & Access Management:** LDAP, Active Directory, Azure Entra ID, and RCDevs OpenOTP MFA.
- **Optimized MPLS Compatibility:** Ready for integration with service provider MPLS networks.
- **Luxembourg Tier IV Hosting:** Optimized for maximum resilience and data security.

## 📌 Quick Installation

### Prerequisites
- **Hardware:** 64-bit CPU, 8GB RAM, SSD 128GB+, Dual NIC
- **Software:** ZeroTrustBSD ISO, DynFi Manager

### Installation
1. Install from ZeroTrustBSD ISO.
2. Configure initial network:
<shell>
ifconfig em0 inet 192.168.1.1 netmask 255.255.255.0 up
route add default 192.168.1.254
</shell>

<shell>
pkg_add dynfi-agent
rcctl enable dynfi-agent
rcctl start dynfi-agent
</shell>

### Register firewall on your DynFi Manager.

## Basic Firewall (PF) Setup
Edit /etc/pf.conf:
<shell>
pf
Copier
Modifier
set skip on lo
block all
pass quick proto tcp from any to any port { 22, 80, 443 } keep state
Activate PF:
</shell>
<shell>
Copier
Modifier
pfctl -f /etc/pf.conf
pfctl -e
</shell>
🔐 Quantum-Safe SSH Configuration
<shell>
Edit /etc/ssh/sshd_config:

ini
Copier
Modifier
KexAlgorithms sntrup761x25519-sha512@openssh.com,curve25519-sha256@libssh.org
Restart SSH:
</shell>
<shell>
Copier
Modifier
rcctl restart sshd
</shell>
📖 Documentation & Support
DynFi Manager
Official ZeroTrustBSD Website
Support: support@zerotrustbsd.lu | +352 20 60 90

📜 License
BSD License - Open-source innovation supporting EU digital sovereignty.
