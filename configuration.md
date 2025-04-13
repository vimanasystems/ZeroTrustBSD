
# ⚙️ configuration.md – ZeroTrustBSD Configuration Guide

This guide outlines the core configuration steps after installing **ZeroTrustBSD**, including firewall policies, identity management, observability, and compliance automation.

---

## 🔐 1. Enable Packet Filtering (pf)

ZeroTrustBSD uses `pf`, OpenBSD's secure packet filter, for traffic control and segmentation.

### Enable and verify:

```sh
doas rcctl enable pf
doas pfctl -e
doas pfctl -sr
```

### Example basic `pf.conf`:

```pf
set skip on lo
block in all
pass out all keep state
pass in on egress proto tcp to port { 22, 443 }
```

---

## 👥 2. Integrate RCDevs for Identity & MFA

Install PAM and RADIUS support for RCDevs OpenOTP:

```sh
pkg_add openotp-pam openldap-client
```

Configure `/etc/pam.d/sshd`:

```text
auth required /usr/local/lib/pam_openotp.so
```

Edit `/etc/ssh/sshd_config`:

```text
ChallengeResponseAuthentication yes
UsePAM yes
```

Restart SSHD:

```sh
rcctl restart sshd
```

---

## 🌐 3. Networking & Routing

Enable NICs and configure interface segmentation:

```sh
ifconfig em0 up
ifconfig em1 up
hostname.em0
hostname.em1
```

Enable OpenBGPD:

```sh
pkg_add openbgpd
rcctl enable bgpd
rcctl start bgpd
```

Set up VXLAN for tenant isolation:

```sh
ifconfig vxlan0 create
ifconfig vxlan0 vxlan 100 vxlanlocal 192.168.1.1 vxlanremote 192.168.1.2 up
```

---

## 🔍 4. Logging and Observability

Enable and configure audit and telemetry:

```sh
pkg_add filebeat prometheus node_exporter wazuh-agent
```

Forward logs to ELK:

```sh
echo "*.info @elk.example.org" >> /etc/syslog.conf
/etc/rc.d/syslogd restart
```

---

## 🧠 5. Threat Detection & Intelligence

Install Suricata and YARA:

```sh
pkg_add suricata yara
rcctl enable suricata
rcctl start suricata
```

Add threat feeds:

```yaml
ETOpen:
  url: https://rules.emergingthreats.net/
  enabled: yes
```

---

## 🧾 6. Compliance with CISO Assistant

Install and configure:

```sh
pkg_add ciso-assistant
rcctl enable ciso-assistant
rcctl start ciso-assistant
```

Access the web UI at:

```
https://your-fw-ip:9443
```

Configure compliance templates for:

- NIS2
- GDPR
- ISO27001
- STANAG

---

## 🧱 7. Tenant Isolation (VMM & Jails)

Launch jails for multi-tenant configuration:

```sh
pkg_add vmd
rcctl enable vmd
vmctl create tenant.img -s 5G
vmctl start "tenant1" -b /bsd -i 1 -n "local"
```

Use anchor-based pf rules per jail or tenant zone.

---

## 🛰️ 8. Optional Features

| Feature         | Configuration Path |
|------------------|--------------------|
| WireGuard VPN    | `pkg_add wireguard-tools` + `/etc/wg.conf` |
| IPsec Gateway    | Configure via `ikectl` |
| MACsec/802.1X    | `hostapd` + `radiusd` |
| Satellite failover | `wg-quick` + `pf.conf` anchor fallback |

---

## 🛡️ Example pf Anchor for Tenant

```pf
anchor "tenant1"
load anchor "tenant1" from "/etc/pf.tenant1.conf"
```

---

> Your perimeter is only as strong as its configuration. Secure every packet, every interface, every tenant — with ZeroTrustBSD.
