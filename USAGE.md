# DynFi Manager on OpenBSD – Usage Guide (ZeroTrustBSD Edition)

This guide outlines how to deploy and use **DynFi Manager** on **OpenBSD** as part of the **ZeroTrustBSD** framework by [Vimana Systems](https://github.com/vimanasystems/ZeroTrustBSD). It includes setup instructions, LDAP/AD integration, HA with CARP, microsegmentation using VXLAN, and Zero Trust enhancements.

---

## 📦 Prerequisites

- OpenBSD 7.x or later
- DynFi Manager installed
- PostgreSQL or MariaDB backend
- Optionally integrated with: LDAP/Active Directory, VXLAN, SIEMs
- ZeroTrustBSD configuration baseline

---

## 🚀 Starting DynFi Manager

```sh
rcctl enable dynfi
rcctl start dynfi
rcctl check dynfi
```

Access via browser:

```
https://your-server-ip:8443
```

---

## 🔧 Core Configuration

Config file: `/etc/dynfi/dynfi.conf`

```ini
[database]
type = postgresql
host = 127.0.0.1
name = dynfi
user = dynfi_user
password = your_secure_password

[web]
port = 8443
bind = 0.0.0.0

[ldap]
enabled = true
uri = ldaps://ldap.example.com
bind_dn = cn=admin,dc=example,dc=com
bind_password = supersecure
base_dn = dc=example,dc=com
user_filter = (objectClass=posixAccount)
group_filter = (objectClass=posixGroup)

[logging]
level = INFO
```

---

## 🖥 Web UI Access

Default login:

- **Username**: `admin`
- **Password**: `dynfi`

Change immediately after first login.

---

## 👥 LDAP / Active Directory Integration

DynFi integrates with LDAP/AD for authentication:

- Set in `dynfi.conf`
- Map LDAP groups to DynFi roles
- Test and validate from the web UI

Refer to ZeroTrustBSD’s `EXTERNAL_INTEGRATION_GUIDE.md` for further SIEM or IAM integration.

---

## 📡 High Availability with CARP

Set up CARP for floating IP-based failover:

```sh
ifconfig em0 vhid 1 pass sharedsecret carpdev em0 192.168.1.1/24
```

- Primary: `advskew 100`
- Secondary: `advskew 200`

Use real IPs in DynFi for node monitoring.

---

## 🔁 Configuration Sync (RCDEV)

Use `rcdev(4)` for config synchronization:

1. Configure primary node
2. Enable rcdevsync:
   ```sh
   rcctl enable rcdevsync
   ```

Trigger `rcdevsync` via DynFi deploy hooks to push updates across HA members.

---

## 🌐 VXLAN Microsegmentation

Based on `MICROSEGMENTATION.md`:

```sh
ifconfig vxlan0 create
ifconfig vxlan0 tunnel 10.0.0.1 10.0.0.2
ifconfig vxlan0 vxlanid 1000
ifconfig vxlan0 192.168.100.1/24
```

- Define segments as DynFi "zones"
- Apply object-based firewall rules to enforce microsegmentation
- Tag VXLAN interfaces for visibility and audit

---

## 🛡 Zero Trust & Sovereignty

In line with `SOVEREIGN-STRATEGY.md`:

- Enforce **role-based access controls**
- Maintain **data residency** (local DB/log storage)
- Use PF to **whitelist control-plane access**
- Integrate with centralized **logging and threat detection**

---

## 📁 Logs & Backups

- Logs: `/var/log/dynfi.log`
- Backups: `/var/dynfi/backups/`

Rotate logs:

```sh
newsyslog
```

Backup DB:

```sh
pg_dump dynfi > backup.sql
```

---

## 📊 External Integration

From `EXTERNAL_INTEGRATION_GUIDE.md`:

- Forward logs to your SIEM
- Automate via DynFi’s REST API
- Integrate with provisioning and alerting systems

---

## 🛠 Troubleshooting

| Issue | Fix |
|-------|-----|
| UI not responding | Check port/interface in `dynfi.conf` |
| LDAP errors | Verify bind credentials and filters |
| CARP failover not working | Adjust `advskew`, check shared secret |
| VXLAN not routing | Validate MTU and endpoint addresses |

---

## 🔧 Commands Summary

| Command | Purpose |
|--------|---------|
| `rcctl start dynfi` | Start the service |
| `dynfi --check-config` | Validate configuration |
| `dynfi --migrate` | Apply DB schema updates |
| `rcdevsync` | Sync config to failover nodes |

---

## ✅ Final Checklist

- [x] DynFi installed and running
- [x] LDAP/AD integrated
- [x] CARP configured for HA
- [x] VXLAN segmentation in place
- [x] Logging and backups active
- [x] External integrations tested
- [x] Aligned with ZeroTrustBSD strategies

---

**Maintained by Vimana Systems – [ZeroTrustBSD](https://github.com/vimanasystems/ZeroTrustBSD)**


---

## 🖧 ASCII Diagrams

### 🔁 CARP Failover Setup

```
            +--------------------+
            |   DynFi Manager    |
            |   192.168.1.10     |
            +--------+-----------+
                     |
                     |
        +------------+------------+
        |                         |
+---------------+       +----------------+
| Firewall 1    |       | Firewall 2     |
| 192.168.1.2   |       | 192.168.1.3    |
| advskew 100   |       | advskew 200    |
| VHID 1        |       | VHID 1         |
+------+--------+       +-------+--------+
       |                          |
       |                          |
       +-----------+--------------+
                   |
          +--------v---------+
          |  Virtual IP       |
          | 192.168.1.1 (CARP)|
          +-------------------+
```

### 🌐 VXLAN Tunnel Between Hosts

```
+-----------------+                       +-----------------+
| OpenBSD Host A  |                       | OpenBSD Host B  |
| 10.0.0.1        |                       | 10.0.0.2        |
| vxlan0          | <---- UDP Tunnel ---> | vxlan0          |
| 192.168.100.1   |                       | 192.168.100.2   |
+-----------------+                       +-----------------+
         |                                         |
         | VXLAN Segment: ID 1000                  |
         +-----------------+-----------------------+
                           |
                     Virtual L2 Segment
```

### 🧱 Zero Trust Policy Flow with DynFi

```
 [User Request] 
       |
       v
+-----------------+
| Authentication  | <----> LDAP / AD
+-----------------+
       |
       v
+-------------------+
| Policy Evaluation |
+-------------------+
       |
       v
+------------------+
|   Microsegment   | <--- VXLAN zone
+------------------+
       |
       v
[Allow / Block / Log]
```

---



---

## 🧩 Multi-Tenancy with DynFi

DynFi can manage multiple tenants (clients or departments) securely:

- Create **separate administrative domains** within DynFi for each tenant
- Use **RBAC** to assign specific user roles per tenant
- Apply **tagging or zoning** to isolate tenant policies and firewall rules
- Leverage **VXLAN** or **VRFs** per tenant to ensure strict isolation

```
+-------------------+    +-------------------+
|  Tenant A Domain  |    |  Tenant B Domain  |
|  VXLAN ID 1000    |    |  VXLAN ID 2000    |
+---------+---------+    +---------+---------+
          |                          |
          v                          v
     Policy Group A            Policy Group B
```

---

## 🚦 MPLS Integration

While OpenBSD doesn’t natively support full MPLS stack, you can simulate label-switching via:

- **Encapsulation** via GRE/IPsec tunnels
- Central route control using DynFi
- Label-like routing by isolating services in **VXLAN or IPsec mesh**

Integrate DynFi with MPLS-capable infrastructure via **route injection** or **policy sync** using its API or firewall automation hooks.

---

## 📶 SD-RAN (Software-Defined Radio Access Network)

For environments involving SD-RAN or edge radio units:

- Use **DynFi Manager** to push policies to firewall gateways near the RAN edge
- Create zones for **RAN**, **MEC (Multi-access Edge Computing)**, and **Core**
- Enforce **latency-sensitive policies** at the edge (real-time, prioritized traffic)
- DynFi REST API can integrate with RAN orchestration tools

```
+--------+   SD-RAN   +----------+
|  UE    | ---------> | RAN Edge |
+--------+            +----------+
                          |
                   +--------------+
                   | DynFi Policy |
                   +--------------+
```

---

## 🌍 BGP & Advanced Routing

DynFi can manage OpenBSD firewalls using BGP via `bgpd.conf`:

- Manage route advertisements per tenant or segment
- Dynamically adjust routes based on policy changes
- Integrate with external networks and upstream ISPs

### Example BGP Flow:

```
        +-------------+
        | DynFi Mgmt  |
        +------+------+
               |
     +---------+--------+
     |     OpenBSD FW    |
     |  with bgpd(8)     |
     +---------+--------+
               |
         +-----+-----+
         |  BGP Peer |
         +-----------+
```

To configure:

1. Add route maps and filters in `bgpd.conf`
2. Use DynFi deploy hooks to reload configuration
3. Monitor BGP sessions from the DynFi dashboard

---

## 🛠 Tips for Advanced Networking

- Use `ospfd`, `bgpd`, `ripd` as needed with DynFi-managed devices
- Script advanced route management via `dynfi --hook <script>`
- Combine VXLAN + BGP for scalable east-west routing
- For SDN-like control, couple DynFi with orchestration (e.g., Ansible, NetBox)

---



---

## 🧠 CISO Assistant – Executive Overview & Guidance

This section provides a **strategic lens** for CISOs and security managers to understand how DynFi Manager within the **ZeroTrustBSD** ecosystem aligns with enterprise security goals.

---

### 🎯 Strategic Objectives

- ✅ **Zero Trust Enforcement** – Enforces least privilege, microsegmentation, and authentication across infrastructure
- ✅ **Auditable Change Management** – All configuration changes and deployments are version-controlled and logged
- ✅ **Data Sovereignty** – All policies and logs remain within controlled infrastructure
- ✅ **Centralized Firewall Orchestration** – Single-pane-of-glass control for global network enforcement

---

### 🔒 Compliance Mapping

| Control Area          | Compliance Frameworks                  | Coverage                   |
|----------------------|-----------------------------------------|----------------------------|
| Access Controls       | ISO 27001, NIST 800-53, CIS             | LDAP, RBAC, 2FA            |
| Network Segmentation  | PCI-DSS, HIPAA, GDPR                    | VXLAN, CARP, Policy Zones  |
| Logging & Monitoring  | SOC 2, NIS2, ISO 27001                  | Syslog, SIEM Integration   |
| High Availability     | NIST CSF, ITIL                          | CARP, RCDEV                |
| Data Residency        | GDPR, CCPA                              | Localized backups & logs   |

---

### 🛡 Risk Mitigation Practices

- **Microsegmentation**: Limits blast radius of lateral movement
- **Policy Audits**: CISO can initiate policy diff reports between deployments
- **Configuration Drift Detection**: Alerting when deployed firewall config differs from source-of-truth in DynFi Manager
- **SIEM & SOAR Integration**: All security logs are forwardable to centralized analytics for proactive incident response

---

### 🧩 Recommended CISO Dashboards (Optional Dev Goals)

To support executive visibility:

- 🔎 Policy Drift / Deployment Status
- 📊 Authentication Method Usage (MFA, LDAP, AD)
- 🌐 Active Segments (VXLAN zones, BGP peers)
- ⚠️ Alert Summary (Critical / Blocked / Audit mode)

---

### ✍️ Executive Summary Template

A monthly report for CISO or Board:

```
ZeroTrustBSD: DynFi Network Enforcement Summary
------------------------------------------------
- Total Managed Firewalls: 12
- Policies Deployed: 145
- Segments Isolated: 5 (via VXLAN)
- Authenticated Users: 128 (LDAP & MFA)
- Detected Config Drifts: 2 (both resolved)
- Compliance Mapping: [ISO 27001 | PCI-DSS | NIST 800-53]
- No critical policy exceptions in this period.

Next Steps:
- Enable anomaly scoring in SIEM
- Expand SD-RAN zone coverage
```

---
