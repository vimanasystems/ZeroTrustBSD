
# ⚙️ ZeroTrustBSD Configuration Guide

This document covers basic and advanced configuration steps for your ZeroTrustBSD firewall to ensure optimal performance and security.

---

## 🛡️ Firewall Configuration (PF)

Edit firewall rules in `/etc/pf.conf`:
```pf
set skip on lo
block all
pass out quick keep state
pass in on egress proto tcp to port { ssh http https } keep state
```

Reload firewall rules:
```sh
doas pfctl -f /etc/pf.conf
```

Enable PF at boot:
```sh
doas rcctl enable pf
doas rcctl start pf
```

---

## 🔑 VPN Configuration

### WireGuard
Configure WireGuard in `/etc/wireguard/wg0.conf`:
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

### OpenVPN
Place OpenVPN configuration in `/etc/openvpn/server.conf`:
```ini
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
server 10.8.0.0 255.255.255.0
keepalive 10 120
persist-key
persist-tun
status openvpn-status.log
verb 3
```

Enable OpenVPN:
```sh
doas rcctl enable openvpn
doas rcctl start openvpn
```

---

## 📡 Routing Configuration

### BGP (OpenBGPD)
Edit `/etc/bgpd.conf`:
```sh
AS 65001
router-id 192.0.2.1

neighbor 192.0.2.2 {
    remote-as 65002
}
```

Enable OpenBGPD:
```sh
doas rcctl enable bgpd
doas rcctl start bgpd
```

### OSPF (OpenOSPFD)
Edit `/etc/ospfd.conf`:
```sh
router-id 192.0.2.1
area 0.0.0.0 {
    interface em0
    interface em1
}
```

Start OSPF daemon:
```sh
doas rcctl enable ospfd
doas rcctl start ospfd
```

---

## 🛡️ IDS/IPS (Suricata)

Edit Suricata configuration `/etc/suricata/suricata.yaml` as needed.

Start Suricata:
```sh
doas rcctl enable suricata
doas rcctl start suricata
```

Update rules regularly:
```sh
suricata-update
```

---

## 📊 Monitoring Setup

### Prometheus & Grafana
Enable and start monitoring:
```sh
doas rcctl enable prometheus grafana
doas rcctl start prometheus grafana
```

Access Grafana Dashboard:
```
http://your-ip-address:3000
```

### Loki (Log Aggregation)
Edit Loki configuration `/etc/loki/loki.yaml`.

Start Loki:
```sh
doas rcctl enable loki
doas rcctl start loki
```

---

## 🗄️ Logging Configuration (syslog-ng)

Forward logs to external systems (example: Graylog):
```conf
destination d_graylog {
  network("graylog-server-ip" port(12201) transport("udp"));
};
log {
  source(src);
  destination(d_graylog);
};
```

Reload syslog-ng:
```sh
doas rcctl restart syslog-ng
```

---

## 🧑‍💻 User and SSH Security

- Disable SSH root login:
  Edit `/etc/ssh/sshd_config`, set:
  ```sh
  PermitRootLogin no
  ```

- Use SSH keys instead of passwords:
  ```sh
  ssh-copy-id user@zerotrustbsd-ip
  ```

Restart SSH:
```sh
doas rcctl restart sshd
```

---

## ✅ Maintenance & Updates

- Regularly update system:
```sh
doas syspatch
doas pkg_add -u
```

---

## 🚀 External Integrations

For advanced integrations with DynFi Manager, RCDevs OpenOTP, MISP/OpenCTI, and others, see [External Integration Guide](./EXTERNAL_INTEGRATION_GUIDE.md).

---

## ✅ Configuration Complete!

Your ZeroTrustBSD system is configured and optimized. For assistance, open an issue or contribute via pull requests.
