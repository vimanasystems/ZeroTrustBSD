
# 🛡️ DynFi Manager Integration with OpenBSD (ZeroTrustBSD)

This guide outlines integrating DynFi Manager specifically with OpenBSD (ZeroTrustBSD) for centralized firewall and network management.

---

## 📌 Overview of DynFi Manager

DynFi Manager is a centralized firewall and network management solution providing:

- Centralized policy deployment
- Real-time monitoring & analytics
- Secure firewall configuration management
- Multi-tenancy and role-based access control (RBAC)

> For more details, visit [DynFi Manager](https://dynfi.com)

---

## 🚀 Integration Steps

### ✅ Step 1: Prepare OpenBSD Firewall

Ensure your ZeroTrustBSD instance has:

- Internet connectivity
- SSH enabled with key-based authentication
- DynFi agent package or compatibility

---

### 📥 Step 2: Installing DynFi Agent on OpenBSD

Currently, DynFi Manager primarily supports SSH-based configuration management for OpenBSD firewalls.

Ensure SSH keys for automation:

```sh
# Generate SSH key (on DynFi Manager server or automation host)
ssh-keygen -t ed25519 -C "dynfi@manager"

# Copy SSH key to ZeroTrustBSD firewall
ssh-copy-id -i ~/.ssh/id_ed25519.pub admin@zerotrustbsd-ip
```

---

### 🔧 Step 3: Adding Firewall to DynFi Manager

- Log into your DynFi Manager web UI.
- Navigate to **Devices** → **Add Device**.
- Enter the firewall's IP address, SSH port, and username (e.g., `admin`).
- Test SSH connection and verify.

---

## ⚙️ Firewall Management & Policy Deployment

DynFi Manager manages firewall rules by directly modifying `/etc/pf.conf`:

Example policy configuration via DynFi UI:

```pf
# Example DynFi deployed rules
block all
pass in proto tcp from any to port { ssh http https } keep state
```

Apply rules directly from DynFi Manager's web interface.

---

## 📊 Monitoring & Alerts

- DynFi Manager provides real-time firewall status and alerts for:
  - CPU/Memory/Disk usage
  - Network throughput and status
  - Firewall rule changes and log analysis

---

## 🔐 Secure Communication

- Communication is secured via SSH (with key-based authentication).
- Consider restricting DynFi Manager IP access through PF firewall rules.

---

## 🚩 Recommended Security Best Practices

- Enable SSH key-based authentication only.
- Regularly review firewall logs and alerts within DynFi Manager.
- Keep your ZeroTrustBSD system up-to-date via:
```sh
doas syspatch
doas pkg_add -u
```

---

## 📚 Additional Resources

- [DynFi Documentation](https://dynfi.com/documentation)
- [OpenBSD PF Configuration](https://www.openbsd.org/faq/pf/index.html)

---

## ✅ Integration Complete

Your ZeroTrustBSD firewall is now centrally managed via DynFi Manager, providing streamlined security and efficient network management.

For support, open an issue or contribute via pull requests.
