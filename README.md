# ZeroTrustBSD
In an era of escalating cyber threats and strict compliance requirements such as GDPR and the NIS2 Directive, ZeroTrustBSD, developed in Luxembourg, represents an advanced enterprise firewall and cybersecurity solution designed explicitly for NIS2 Compliance.

# Overview
ZeroTrustBSD is a highly secure, enterprise-class firewall solution based on OpenBSD and integrated with DynFi Manager for advanced, centralized management. It offers European governments, enterprises, and local administrations a robust, compliant, and sovereign cybersecurity platform.

# Key Features
* OpenBSD-based Security: Industry-leading security and minimal attack surface.
* Centralized Management: Simplified firewall management via DynFi Manager web interface.
* Zero Trust Security: Identity-focused access control, "never trust, always verify".
* Quantum-Safe Cryptography: Integrated NIST-approved post-quantum algorithms.
* Advanced VPN Solutions: Supports WireGuard, OpenIKED (IKEv2/IPsec), and OpenVPN.
* Real-Time Threat Intelligence: Suricata IDS/IPS, MISP, AlienVault OTX integration.
* High Availability: CARP and pfsync ensure redundancy.
* Identity Management Integration: LDAP, Active Directory, Azure Entra ID, and RCDevs OpenOTP MFA.
* Optimized MPLS Connectivity: Integration with service provider MPLS networks.
* Tier IV Data Center Ready: Built to leverage Luxembourg’s top-tier data centers.
 Getting Started
📌 Prerequisites
Hardware:

CPU: Quad-core 64-bit processor
RAM: 8GB+
Storage: SSD 128GB+
Network: Dual Gigabit Ethernet
Software:

ZeroTrustBSD Custom ISO
DynFi Manager (Community or Commercial)
# 🚀 Installation Steps
Install ZeroTrustBSD from ISO.
Configure Initial Networking:
shell
Copier
Modifier
ifconfig em0 (can be ix or ixl if SuperMicro) inet 192.168.1.1 netmask 255.255.255.0 up
route add default 192.168.1.254
Install and Enable DynFi Agent:
shell
Copier
Modifier
pkg_add dynfi-agent
rcctl enable dynfi-agent
rcctl start dynfi-agent
Register Device in DynFi Manager:
Log into DynFi Manager and authorize your firewall.
# 📖 Documentation
Introduction
Getting Started Guide
Configuration Guide
