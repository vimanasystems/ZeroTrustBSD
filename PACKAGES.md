# 📦 Recommended Packages for ZeroTrustBSD

This document outlines recommended packages to enhance the functionality, security, observability, and compliance posture of ZeroTrustBSD. All tools are vetted for OpenBSD compatibility or available in portable form (source/jail/VM).

---

## 🔒 Core Firewall & OS

| Package         | Purpose |
|-----------------|---------|
| pf              | Native OpenBSD packet filter |
| relayd          | Load balancing and TLS offloading |
| authpf          | Per-user authenticated firewall policies |
| pflogd          | Packet filter logging daemon |

---

## 🔐 Identity & Authentication

| Package          | Purpose |
|------------------|---------|
| openotp-pam      | PAM support for RCDevs OpenOTP MFA |
| pam_radius       | RADIUS support for VPN/SSHD logins |
| openldap-client  | LDAP directory access |
| sudo/doas        | Privilege elevation (OpenBSD prefers doas) |

---

## 🧠 Threat Detection & SIEM

| Package          | Purpose |
|------------------|---------|
| suricata         | Intrusion detection and prevention (IDS/IPS) |
| wazuh-agent      | Host-based log collection, file integrity, EDR |
| zeek             | Network forensics and traffic analysis |
| yara             | Malware rule-based detection |
| clamav           | Lightweight antivirus scanning |

---

## 📡 Threat Intelligence

| Package      | Purpose |
|--------------|---------|
| misp         | Malware Information Sharing Platform (jail/VM) |
| opencti      | Threat intel correlation platform (jail/VM) |
| curl, jq     | Pull STIX/TAXII feeds or IOCs into rulesets |

---

## 🔎 Observability & Telemetry

| Package           | Purpose |
|-------------------|---------|
| filebeat          | Forward logs to ELK or SIEM |
| metricbeat        | System metrics exporter |
| prometheus        | Monitoring and alerting toolkit |
| node_exporter     | Exposes OS metrics for Prometheus |
| snmpd             | SNMP daemon for device health metrics |
| pfstat            | pf firewall statistics exporter |

---

## 🛜 Networking & Routing

| Package      | Purpose |
|--------------|---------|
| openbgpd     | Border Gateway Protocol daemon |
| frr          | FRRouting (optional from ports or jail) |
| wireguard-tools | Modern high-speed VPN |
| openvpn      | Classic VPN with certs and RADIUS |
| strongswan   | IKEv2/IPsec with X.509 |
| vxlan(4)     | Virtual LAN overlays for microsegmentation |
| dhcpd        | DHCP server daemon |
| dhclient     | DHCP client |

---

## 🧱 Virtualization & Isolation

| Package    | Purpose |
|------------|---------|
| vmd/vmctl  | OpenBSD VMM management tools |
| jail       | OS-level containerization (chroot-based) |
| rdomains   | Multiple routing domains support |
| sysjail (port) | Optional FreeBSD-style jail manager |

---

## 🧾 Compliance & Governance

| Package         | Purpose |
|------------------|---------|
| ciso-assistant   | Compliance engine with templates for NIS2, GDPR, ISO27001 |
| auditd/syslog    | Log collection and audit trails |
| signify          | Cryptographic signature verification |
| checksec (port)  | Binary hardening checker |

---

## 🌐 Secure Communications

| Package     | Purpose |
|-------------|---------|
| stunnel     | SSL tunneling for legacy apps |
| gnupg       | GPG encryption tools |
| openssh     | Secure remote administration |
| openssl     | TLS library and CLI utilities |

---

## 🧩 Container & SOAR (Optional, VM/Jail)

| Tool            | Purpose |
|------------------|---------|
| cortex + thehive | SOAR + case management |
| grafana + loki   | Dashboards and log analytics |
| docker (VM only) | Not native; use jails or VMs instead |

---

## ⚙️ DevSecOps & Automation

| Package     | Purpose |
|-------------|---------|
| ansible     | Infrastructure as Code and automation |
| terraform   | Cloud and firewall policy provisioning |
| git         | Source control and GitOps integration |
| curl/wget   | Fetch update scripts, feeds, configs |

---

> All packages should be tested and reviewed in lab environments before production deployment. Some packages may require compilation or ports/jail isolation on OpenBSD.
