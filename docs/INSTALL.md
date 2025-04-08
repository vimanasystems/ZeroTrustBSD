
# 🚀 ZeroTrustBSD Installation Guide

Follow this simple guide to install and configure your ZeroTrustBSD firewall system quickly and securely.

---

## ✅ Step 1: Preparation

### Hardware Checklist
- 64-bit CPU (x86-64 or ARM64), at least 4 cores
- 8 GB RAM (recommended: 16–32 GB)
- 128 GB SSD minimum (recommended: 256 GB or more)
- Network interface(s): Minimum two Gigabit Ethernet ports
- USB stick (8 GB+) for installation

> [Detailed Hardware Requirements](./SYSTEM_REQUIREMENTS.md)

### Download ISO
Obtain or build the latest ZeroTrustBSD ISO image.

---

## 💾 Step 2: Creating Installation Media

### Linux/macOS
Create a bootable USB drive:
```bash
sudo dd if=zerotrustbsd.iso of=/dev/sdX bs=4M status=progress && sync
```
Replace `/dev/sdX` with your USB device.

### Windows
Use [Rufus](https://rufus.ie/) to create the bootable USB.

---

## 🛠️ Step 3: Installing ZeroTrustBSD

- Boot from your USB drive.
- At boot prompt (`boot>`), press Enter to begin installation.
- Choose `(I)nstall` at the OpenBSD installer prompt.
- Follow the installer prompts:
  - Configure keyboard, hostname (e.g., `zerotrustbsd`), and networking.
  - Set your timezone, root password, and an administrator user.
  - Disk setup: Use automatic partitioning (recommended).
- After installation, reboot.

---

## 📦 Step 4: Installing Recommended Packages

Log in to your newly installed system and execute:
```sh
doas pkg_add suricata zeek ossec-hids openvpn wireguard-tools strongswan openbgpd openospfd prometheus grafana loki elasticsearch kibana beats ansible git curl vim syslog-ng signify oath-toolkit bpftrace
```

---

## 🔐 Step 5: Configure Essential Services

### Firewall (PF)
Edit `/etc/pf.conf`:
```pf
set skip on lo
block all
pass out keep state
pass in proto tcp to port { ssh http https } keep state
```
Enable firewall:
```sh
doas rcctl enable pf
doas rcctl start pf
```

### WireGuard VPN
Configure (`/etc/wireguard/wg0.conf`):
```ini
[Interface]
PrivateKey = <your_private_key>
Address = 10.0.0.1/24
ListenPort = 51820

[Peer]
PublicKey = <peer_public_key>
AllowedIPs = 10.0.0.2/32
```
Start WireGuard:
```sh
doas rcctl enable wireguard_go
doas rcctl start wireguard_go
```

### Suricata (IDS/IPS)
Enable and start Suricata:
```sh
doas rcctl enable suricata
doas rcctl start suricata
```

---

## 📈 Monitoring Setup

### Prometheus & Grafana
Start services:
```sh
doas rcctl enable prometheus grafana
doas rcctl start prometheus grafana
```
Access Grafana dashboard:
```
http://your-ip-address:3000
```

---

## 📡 Advanced Networking (BGP)

Configure BGP (`/etc/bgpd.conf`):
```sh
AS 65001
router-id 192.0.2.1

neighbor 192.0.2.2 {
    remote-as 65002
}
```
Start BGP daemon:
```sh
doas rcctl enable bgpd
doas rcctl start bgpd
```

---

## 🚩 Security & Maintenance

- Apply updates regularly:
```sh
doas syspatch
doas pkg_add -u
```
- Secure SSH access: disable root login and enforce key-based authentication.

---

## 🛰️ Optional External Integrations

Enhance functionality by integrating [external tools](./EXTERNAL_INTEGRATION_GUIDE.md), including DynFi Manager, RCDevs OpenOTP, and threat intelligence platforms.

---

## ✅ Installation Complete!

Your ZeroTrustBSD is now securely installed and ready to protect your environment. For support, open an issue or contribute via pull requests.
