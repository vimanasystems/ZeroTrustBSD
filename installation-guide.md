
# 📘 Installation Guide – ZeroTrustBSD

This document provides step-by-step instructions for installing and configuring **ZeroTrustBSD**, a military-grade, OpenBSD-based firewall platform.

---

## 🖥️ Minimum System Requirements

| Component       | Specification |
|------------------|---------------|
| CPU              | x86_64 (Intel/AMD), ARM64, or RISC-V (experimental) |
| RAM              | 4 GB minimum (8 GB+ recommended) |
| Storage          | 32 GB SSD minimum, ZFS/BTRFS optional |
| Network Interfaces | 2+ NICs (Intel i210/i350 recommended) |
| Optional Modules | TPM 2.0, HSM, SDR, LTE modem, IPMI |

---

## 📦 Download the ISO

The latest ZeroTrustBSD ISO will soon be available at:

```
https://zerotrustbsd.org/downloads/
```

You can also build from source using the [ISO Builder](./Makefile).

---

## 💽 Create Bootable Media

### Using USB (Linux/macOS)

```sh
dd if=ZeroTrustBSD.iso of=/dev/sdX bs=4M status=progress && sync
```

### Using USB (Windows)

Use [Rufus](https://rufus.ie/) or Balena Etcher.

---

## 🚀 Boot & Install

1. **Insert bootable USB** and power on the target device.
2. Choose `Install` from the bootloader menu.
3. Follow OpenBSD's interactive installer:
   - Partition with `auto` or `custom`
   - Select filesystem type (FFS2, ZFS, Encrypted Softraid)
   - Set hostname, timezone, and interfaces
4. Choose mirror (optional: offline installation available)
5. Set up root password and initial users.

---

## 🔐 Post-Install Hardening

After rebooting into your installed ZeroTrustBSD system:

```sh
doas sysctl kern.securelevel=2
doas rcctl enable pflogd
doas pfctl -e
doas signify -C -p /etc/signify.pub -x SHA256.sig ZeroTrustBSD.iso
```

Configure disk encryption, pf rules, and network segmentation.

---

## 🔌 Networking & Remote Access

- Enable SSH: `rcctl enable sshd && rcctl start sshd`
- Configure OpenBGPD or FRRouting
- Configure VXLAN, WireGuard or IPsec for remote overlays

---

## 🧩 Integration

- [ ] DynFi Manager Agent
- [ ] RCDevs OpenOTP PAM Integration
- [ ] Configure pf.conf, anchors, NAT policies
- [ ] Enable CISO Assistant for compliance automation
- [ ] Enable Suricata, Wazuh, and eBPF probes

---

## 📄 Documentation Links

- [README.md](./README.md)
- [Configuration Guide](./configuration.md)
- [DynFi Integration](./dynfi.md)
- [Hardware Guide](./HARDWARE_GUIDE.md)

---

## ❗ Troubleshooting

| Issue             | Resolution |
|-------------------|------------|
| No network post-install | Reconfigure interface: `ifconfig em0 up` |
| Installer freeze        | Use legacy boot, disable UEFI secure boot |
| No audio/graphics needed | Use serial console (COM1) or headless SSH |

---

## 📦 Optional

| Component    | How to Enable |
|--------------|---------------|
| **CISO Assistant** | Enable via package install and web setup |
| **RCDevs Auth**    | `pkg_add openotp-pam` + `/etc/pam.d/sshd` |
| **ELK Stack**      | Forward logs using `filebeat` or `syslog` |
| **VPN Gateway**    | Setup `ikectl`, WireGuard, or strongSwan |

---

> ZeroTrustBSD — Deploy your firewall, verify every packet, and secure your sovereign perimeter.

