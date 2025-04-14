# 🧱 ZeroTrustBSD Deployment Topologies

This document outlines key deployment topologies for ZeroTrustBSD across enterprise, telecom, and critical infrastructure (OT/ICS/IIoT) environments, including support for VXLAN and microsegmentation. This document presents real-world deployment examples of **ZeroTrustBSD**, using OpenBSD’s secure architecture. It includes ASCII topology diagrams for:

- Core Microsegmentation
- VXLAN-based Overlay Networks
- Multi-Tenant Segmentation with VMM + Jails
- Secure Internet Edge with DynFi & RCDevs

## 🧱 What Is Microsegmentation?

Microsegmentation is a security technique that divides a network into fine-grained, isolated zones, allowing strict access controls and limiting lateral movement of threats. In **ZeroTrustBSD**, microsegmentation is enforced at the kernel and virtualization layers using **OpenBSD VMM**, **jails**, **pf(4)**, and RBAC policies.

---

## 🛰️ Core Microsegmentation Topology

```ascii
                        [ Internet ]
                             |
                    +------------------+
                    |  Edge Firewall   |  <-- ZeroTrustBSD (OpenBSD + pf)
                    |  (WAN Gateway)   |
                    +--------+---------+
                             |
              +--------------+----------------+
              |                               |
       +------+-----+                  +------+-----+
       |   Tenant A  |                 |   Tenant B  |
       |  VMM / Jail |                 |  VMM / Jail |
       +------------+                 +------------+
           |   |                            |   |
           |   +-- VLAN 100                 |   +-- VLAN 200
           |                                |
    [ Microsegmented Workloads ]   [ Microsegmented Workloads ]
```

## 📡 General ZeroTrustBSD Topology (Centralized Deployment)

```ascii
                        +------------------------+
                        |   DynFi Manager        |
                        |  (Central Mgmt Plane)  |
                        +-----------+------------+
                                    |
                   +-------------------------------+
                   |        Internet / MPLS WAN    |
                   +-------------------------------+
                             |           |
                +------------+           +-------------+
                |                                      |
   +------------v------------+         +---------------v------------+
   |   ZeroTrustBSD Node     |         |   ZeroTrustBSD Node        |
   |   (Firewall/Gateway)    |         |   (Firewall/Gateway)       |
   |   pf + relayd + VPN     |         |   pf + OpenVPN/WireGuard   |
   +-------------------------+         +----------------------------+
           |         |                            |
    +------+     +---+---+                +-------+----+
    | Mgmt |     | Tenant|                | VLAN 100   |
    | VMM  |     | Jail  |                |    VMM     |
    +------+     +-------+                +------------+
```
## 🎯 Why Microsegmentation in ZeroTrustBSD?

| Benefit                    | Description |
|---------------------------|-------------|
| 🔐 Limit Attack Surface    | Each VM or jail is isolated, minimizing breach impact. |
| 🧠 Enforce Zero Trust      | Every connection is explicitly authenticated and filtered. |
| 🧩 Multi-Tenant Ready      | Perfect for ministries, agencies, and SOCs under one appliance. |
| 🛰 OT/ICS Protection       | Isolate critical SCADA or control systems via L1–L3 boundaries. |
| 🧾 Compliance Mapping      | Aligns with NIS2, ISO27001, IEC 62443, and STANAG. |

---

## 🧱 How It Works in ZeroTrustBSD

- **OpenBSD VMM** is used to spin up isolated VM tenants.
- **Jails** further isolate apps or security domains within those VMs.
- **pf.conf** anchors define unique firewall policies per VM/jail.
- **VLANs and Virtual NICs** keep data separated across L2/L3.
- **WireGuard/IPsec tunnels** protect traffic between enclaves.

---

## 🔍 Example Architectures
```ascii

                      +------------------------+
                      |    Central Firewall    |
                      |   ZeroTrustBSD (pf)    |
                      +-----------+------------+
                                  |
             +--------------------+--------------------+
             |                    |                    |
       +-----v-----+        +-----v-----+        +-----v-----+
       |  Jail A   |        |  Jail B   |        |  Jail C   |
       | rdomain 1 |        | rdomain 2 |        | rdomain 3 |
       +-----------+        +-----------+        +-----------+
       |   pf anchor A      |   pf anchor B      |   pf anchor C
       |   VXLAN/GENEVE     |   VXLAN/GENEVE     |   VXLAN/GENEVE
       +--------------------+--------------------+-----------------+
```
---

## 🧠 Benefits a bit more

Microsegmentation is the practice of breaking a network into secure zones to apply fine-grained security controls.

| Layer     | Microsegmentation Strategy                               |
|-----------|-----------------------------------------------------------|
| Layer 3   | VLANs, VRFs, RDomains per tenant                          |
| Layer 4   | PF firewall anchors, per-service access rules             |
| Host      | OpenBSD jails/VMM virtual machines                        |
| Overlay   | VXLAN / GENEVE tunnels between sites and workloads        |
| Identity  | RCDevs MFA and LDAP/AD groups for IAM enforcement         |

---

## 🧰 Key Tools & Technologies

| Technology       | Functionality                                  |
|------------------|-------------------------------------------------|
| **PF Firewall**   | Policy enforcement, NAT, anchors, relayd        |
| **VMM**           | Virtual machines for tenant isolation           |
| **Jails/Chroot**  | Application-level containment                   |
| **VXLAN/GENEVE**  | Overlay tunneling for site-to-site segmentation |
| **eBPF**          | Kernel observability and behavioral tracing     |
| **RCDevs IAM**    | Identity-aware policy enforcement (SSH/VPN)     |

---

### Key Goals:
- Enforce **least privilege** access
- Prevent **lateral movement** by attackers
- Apply per-application or per-tenant firewall rules
- Enhance **compliance** and audit visibility

---

## 🧠 Why Microsegmentation in ZeroTrustBSD?

ZeroTrustBSD uses OpenBSD’s native `pf` firewall combined with **VMM** and **jails** to create strong, tenant-isolated environments. Through **overlay technologies** like **VXLAN** or **GENEVE**, ZeroTrustBSD enables microsegmentation in:
- Sovereign Cloud environments
- OT/ICS zones (e.g. Purdue Model L2–L4)
- Smart cities, ministries, and telecom networks

---

## 🛰️ VXLAN vs GENEVE

| Feature           | VXLAN                          | GENEVE                           |
|------------------|--------------------------------|----------------------------------|
| Encapsulation     | MAC-in-UDP (fixed header)      | Flexible TLV (Type-Length-Value) |
| Use Case          | Basic L2 overlays (SDN, cloud) | Advanced overlays, service mesh  |
| Portability       | Widely supported (Open vSwitch, Linux, BSD) | Supported in OVS, NSX           |
| Custom Metadata   | ❌ Not supported                | ✅ Fully supported                |
| ZeroTrustBSD      | ✅ Recommended for OpenBSD + pf | ⚠️ Experimental via external tools |

**Recommendation for ZeroTrustBSD:**  
Use **VXLAN** for compatibility, performance, and simplicity. Use **GENEVE** only for advanced service mesh or container-native workloads.

---

## 🖥️ Multi-Tenant Microsegmentation

```ascii
        +-----------------+
        |  Internet/ISP   |
        +--------+--------+
                 |
              [pf]
         +-----+------+        VXLAN or VLAN
         |  ZeroTrustBSD|-------------------+
         |   Host Node  |                   |
         +------+-------+                   |
                |                           |
      +---------+---------+       +---------+---------+
      |  VMM Guest (Tenant1)|      | VMM Guest (Tenant2)|
      |  / Jail / Service   |      |  / Jail / Service   |
      +---------+----------+      +----------+----------+
                |                           |
         [pf anchor: tenant1]       [pf anchor: tenant2]
                |                           |
        VLAN 10 / VXLAN 1001       VLAN 20 / VXLAN 1002
```

---

```ascii
                             +----------------------+
                             |      Internet        |
                             +----------------------+
                                       |
                                [ Perimeter PF ]
                                       |
                         +-------------+-------------+
                         |                           |
                 [Tenant Anchor 1]          [Tenant Anchor 2]
                         |                           |
                     +-------+                   +-------+
                     | VMM 1 |                   | VMM 2 |
                     +---+---+                   +---+---+
                         |                           |
      +------------------+--------+       +----------+--------------+
      |     Jail 1A     |  Jail 1B|       |     Jail 2A         |
      | 192.168.10.2/24 |  ...    |       | 192.168.20.2/24     |
      +-----------------+--------+       +----------------------+
             |                                 |
       [ PF Anchor Rules ]             [ PF Anchor Rules ]
             |                                 |
       [ Service 1 ]                      [ Service 2 ]
```

---

```ascii

                       ┌────────────────────────────────────────────────────────────┐
                       │                     🛰️ HEADQUARTERS (SOC/NOC)                │
                       │   +--------------------------------------------+          │
                       │   |          ZeroTrustBSD Firewall (HQ)        |          │
                       │   | - pf firewall, IDS (Suricata/Wazuh)        |          │
                       │   | - RCDevs MFA, DynFi Agent, CISO Assistant  |          │
                       │   +-----------------------┬--------------------+          │
                       │                           │ MPLS / VPN Overlay             │
                       └───────────────────────────┼───────────────────────────────┘
                                                   │
                                                   │
           ┌───────────────────────────────────────┴──────────────────────────────────────┐
           │                                                                              │
           │                        🏢 BRANCH / SITE SEGMENTATION                         │
           │                                                                              │
           │       +---------------------+            +------------------------------+    │
           │       |  Site A: Ministry   |            |  Site B: Infrastructure Ops  |    │
           │       |  - ZeroTrustBSD     |            |  - ZeroTrustBSD              |    │
           │       |  - Jails: Web, VPN  |            |  - VMM: Analytics, Proxy     |    │
           │       +---------------------+            +------------------------------+    │
           │                 │                                     │                      │
           │                 └─────▶ VXLAN/GENEVE (Microsegmented Overlay) ◀─────────────┘
           │                         - Tenant Isolation per Department/Role              │
           │                         - Encrypted Tunnel with Role-based Access           │
           │                                                                              │
           └──────────────────────────────────────────────────────────────────────────────┘

    Legend:
    ──────────────────────────────────────────────────────────────────────────────────────
    • All sites run OpenBSD-based ZeroTrustBSD firewall with centralized DynFi control.
    • Communication via BGP/MPLS core or SD-WAN (encrypted tunnels).
    • Identity control by RCDevs OpenOTP, authentication integrated with LDAP/AD.
    • Threat detection (Suricata/Zeek), observability (eBPF, Prometheus).
    • Compliance automation via CISO Assistant. All logs sent to ELK or Wazuh.

    • VXLAN/GENEVE used to create microsegmented overlays per agency or role.
    • Firewall rules defined per-tenant using `pf.conf` anchors and NAT segregation.
```
---

```ascii
                    +------------------------------------------+
                    |         🛡️ ZeroTrustBSD Network          |
                    +------------------------------------------+

                             ┌──────────── Site A ─────────────┐
                             │                                 │
                             │     +---------------------+     │
                             │     |   VMM / Hypervisor  |     │
                             │     |---------------------|     │
                             │     | Tenant 1 (Jail)     |     │
                             │     | Tenant 2 (Jail)     |     │
                             │     | Tenant N (Jail)     |     │
                             │     +----------+----------+     │
                             │                |                │
                             │                | pf/vxlan0      │
                             │        +-------+--------+       │
                             │        |   VXLAN Bridge  |       │
                             │        +-------+--------+       │
                             │                |                │
                             └────────────────|────────────────┘
                                              |
                                              |
                                    .─────────┴──────────.
                                    │                    │
                                    ▼                    ▼

                      +---------------------+    +---------------------+
                      |     Internet/MPLS   |────|     Internet/MPLS   |
                      +---------------------+    +---------------------+

                                    ▲                    ▲
                                    │                    │
                                    │                    │
                             ┌──────┴──────┐     ┌───────┴───────┐
                             │                                 │
                             │     +---------------------+     │
                             │     |   VMM / Hypervisor  |     │
                             │     |---------------------|     │
                             │     | Tenant A (Jail)     |     │
                             │     | Tenant B (Jail)     |     │
                             │     +----------+----------+     │
                             │                | pf/vxlan0      │
                             │        +-------+--------+       │
                             │        |   VXLAN Bridge  |       │
                             │        +-------+--------+       │
                             │                |                │
                             └──────────── Site B ─────────────┘

                    ⇨ All VXLAN traffic encrypted and authenticated using:
                      - WireGuard/IPsec
                      - RCDevs MFA for admin access
                      - TLS/mTLS for API and policy updates

                    ⇨ Management plane (DynFi Manager) deployed separately:
```
---

```ascii
                    ┌────────────────────┐
                    │   DynFi Manager    │
                    │ (Central Control)  │
                    └────────┬───────────┘
                             │
                 ┌───────────▼────────────┐
                 │   Core SDN/MPLS Spine  │
                 └───────────┬────────────┘
            ┌────────────┐   │   ┌────────────┐
            │ Site A     │   │   │ Site B     │
            │ (Campus 1) │   │   │ (Campus 2) │
            └────┬───────┘   │   └────┬───────┘
                 │           │        │
          ┌──────▼─────┐     │   ┌────▼─────┐
          │ VTEP A     │─────┼───│ VTEP B   │
          │ VXLAN ENC  │     │   │ VXLAN ENC│
          └────┬───────┘     │   └────┬─────┘
               │             │        │
    ┌──────────▼─────────┐   │   ┌────▼──────────┐
    │ Tenant A Jail/VM   │   │   │ Tenant B Jail │
    │ PF + Anchors       │   │   │ Wazuh + YARA  │
    └────────────────────┘   │   └────────────────┘
```
---

# 🧱 More ZeroTrustBSD Topologies

---

## 🛰️ Multi-Tenant Firewall with VXLAN Overlay

```ascii
+----------------------+       VXLAN 1001         +----------------------+
|   GOV Tenant (VMM)   |------------------------->|   EDU Tenant (VMM)   |
|     192.168.10.0/24  |                          |     192.168.20.0/24  |
+----------------------+                          +----------------------+
         |                                                    |
         |                                                    |
         | PF Anchor: gov_anchor.conf                         | PF Anchor: edu_anchor.conf
         |                                                    |
         v                                                    v
+-------------------------------------------------------------+
|                ZeroTrustBSD (OpenBSD VMM Host)              |
|                                                             |
|  +----------------------+        +----------------------+   |
|  |     RCDevs MFA       |        |    DynFi Firewall     |  |
|  +----------------------+        +----------------------+   |
|            |                           |                    |
|      LDAP / PAM auth         DynFi Config Sync             |
|            |                           |                    |
|            +-------------> pf.conf <------------------------+
|                                                             |
|       VXLAN Interfaces (vxlan0, vxlan1) for Tenant Overlay  |
|       eBPF + Wazuh + Filebeat for tenant visibility         |
+-------------------------------------------------------------+
```
---

## 🧩 Multi-Tenant VMM + Jail Deployment
```ascii
                          +--------------------+
                          |  ZeroTrustBSD Host |
                          |--------------------|
                          | - pf.conf          |
                          | - relayd           |
                          | - vxlan / vether   |
                          | - rcctl services   |
                          +---------+----------+
                                    |
       +----------------------------+----------------------------+
       |                            |                            |
+------+-----+              +-------+------+             +-------+------+
| Tenant: SOC |            | Tenant: Finance|           | Tenant: DevOps|
|  VMM + Jail |            |  VMM + Jail    |           | VMM + Jail    |
+------------+            +---------------+           +--------------+
    VLAN 10                     VLAN 20                      VLAN 30
    VNI 1010                    VNI 1020                     VNI 1030
```
---

## 🧱 VXLAN + Microsegmentation Deployment
```ascii
                        +---------------------------+
                        |  DynFi Manager (Control)  |
                        +------------+--------------+
                                     |
                         VXLAN/GENEVE Overlay Fabric
                                     |
       +-----------------------------+-----------------------------+
       |                                                           |
+------v--------+                                        +---------v------+
| ZeroTrustBSD  |                                        | ZeroTrustBSD  |
|  Gateway A     |         VXLAN Tunnel (Port 4789)      |  Gateway B     |
| pf + VXLAN     +-------------------------------------->+ pf + VXLAN     |
+---------------+                                        +----------------+
     | Mgmt + Tenant Segments                                   | Jails
     +--+------+---------+                            +----------+------+
        |      |         |                            |         |      |
     [VMM]   [Jail1]   [Jail2]                      [Jail3]   [VMM]  [IoT]

```
VXLAN is used to build scalable, isolated L2 segments over L3 infrastructure. Each tenant can be microsegmented using PF anchors.
---

## 🛡️ Use Cases

- 🏛️ **Government Ministries:** Separate each ministry with its own VMM/jail.
- 🧾 **Finance & Critical Infrastructure:** Isolate sensitive workloads.
- 🛰️ **Multi-Site SOCs or Datacenters:** Overlay tunnels to enforce compliance zones.
- 🧬 **Healthcare/OT/ICS:** Enforce VLAN/RDomain separation and audit logging.

---

## ✅ Benefits

- **Zero Trust Enforcement** per packet, user, and application.
- **Containment of Lateral Movement** with strict policy controls.
- **Audit Readiness** for GDPR, NIS2, and ISO/IEC 27001.
- **Granular Logging** via Filebeat, eBPF, and pf logs.

---

## 📘 Learn More

- [PF User Guide (OpenBSD)](https://man.openbsd.org/pf)
- [VXLAN RFC 7348](https://tools.ietf.org/html/rfc7348)
- [GENEVE RFC 8926](https://datatracker.ietf.org/doc/html/rfc8926)
- [RCDevs OpenOTP](https://www.rcdevs.com/products/openotp/)

---

**© 2025 Vimana Systems | BSD Licensed | Microsegmentation for Sovereign Security**
