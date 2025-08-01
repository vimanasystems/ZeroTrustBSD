# 🛡️ ZeroTrustBSD  
## The Autonomous Cyber Defense OS  
> **Engineered for Nation-Scale Defense, Tactical Autonomy, and Critical Infrastructure Resilience**  
> _“You don’t buy sovereignty. You build it — with **ZeroTrustBSD**.”_

In an age where cyber threats evolve faster than patches are deployed, **ZeroTrustBSD** stands as a sovereign, open-source fortress — built on **OpenBSD**, hardened by `pledge(2)`, `unveil(2)`, W^X, and securelevel — because **trust is a vulnerability**.

This is not a firewall.  
It is an **Autonomous Cyber Defense Operating System** — purpose-built for:
- 🏛️ **National governments**
- 💳 **Central banks & SWIFT networks**
- ⚙️ **OT/ICS/SCADA systems**
- 🛰 **Tactical edge & SATCOM deployments**
- ☁️ **Sovereign cloud & disaster recovery**

Born from the mind of **Uday Moorjani** — former RSSI of Sint Maarten, cybersecurity architect for BNP Paribas, Airbus, Orange Cyberdefense, and the Cour de Justice de l’UE — this is **battle-tested expertise**, open-sourced for the world.

Built on **OpenBSD**, hardened with `pledge(2)`, `unveil(2)`, W^X, and securelevel — because **trust is a vulnerability**.

> ZeroTrustBSD: Where **sovereignty**, **resilience**, and **open-source truth** converge.

---

## 🚀 Quick Start
Want to deploy? Here’s how:
1. 📥 `git clone https://github.com/vimanasystems/ZeroTrustBSD.git`
2. 🧪 Flash to a NUC, VM, or Raspberry Pi
3. 🔐 Boot. Sign. Enforce. Survive.
4. 🤝 Join the mission: contact@zerotrustbsd.com

No vendor. No cloud. No backdoors.  
Just **code, will, and freedom**.

---

## 🌍 Who Needs This?
### (Spoiler: Everyone Who Cares About Sovereignty)

| Sector | Why ZeroTrustBSD |
|--------|------------------|
| 🏛️ **Government & Defense** | Secured Sint Maarten’s central bank, prosecutor, airport, SCADA. Now open for all. |
| 💳 **Financial Institutions** | SWIFT, SEPA, Target2, PCI-DSS | secured with PQC-ready Zero Trust. |
| ⚙️ **OT/ICS/SCADA** | Purdue Model, IEC 62443, microsegmentation | no lateral movement. Ever. |
| 🛰 **Tactical & Remote** | Runs on Starlink, srsRAN, Raspberry Pi | ideal for embassies, disaster zones, military ops. |
| ☁️ **Sovereign Cloud** | GitOps-signed policies, ZFS rollback, air-gapped deployable. |

---

## 🔐 Core Security Architecture
- **Kernel**: Hardened **OpenBSD** — the only OS paranoid enough for war
- **Crypto**: WireGuard, IPsec, OQS-OpenSSL (Kyber, Dilithium)
- **Access Control**: FreeIPA, Kerberos, MFA (TOTP, OpenOTP), ABAC, PBAC
- **Integrity**: `signify`-signed configs — no rogue changes
- **Compliance**: Automated **NIS2, DORA, ISO 27001, PCI-DSS, GDPR, LPM**
- **Observability**: Wazuh, Suricata, Zeek, Prometheus, Grafana

---

## 🧩 Key Features

| Feature | Description |
|--------|-------------|
| **Zero Trust Microsegmentation** | Identity-aware, VXLAN-based, PF-anchored — no lateral movement |
| **Post-Quantum Ready** | Kyber, Dilithium, SPHINCS+ — because RSA-2048 won’t survive 2030 |
| **CISO Assistant** | AI-driven compliance, audit prep, and “why is port 8443 blocked?” |
| **OpenCTI Integration** | Threat intel, not just alerts — knowledge is power |
| **SATCOM & SD-RAN** | Starlink + srsRAN = sovereign 5G in the middle of nowhere |
| **Regulatory Compliance Built-In** | NIS2, DORA, GDPR, PCI-DSS — automated, not guessed |
| **Military-Grade Encryption** | Not “military-grade” like a marketing brochure. Actual military-grade. |

---

## 🛡 FreeIPA: Because Identity Is Power
ZeroTrustBSD integrates **FreeIPA** — because you shouldn’t have to choose between security and sanity.

| Feature | Description |
|--------|-------------|
| **Centralized Auth** | via LDAP |
| **Kerberos SSO** | because passwords are for peasants |
| **MFA Enforcement** | TOTP, OpenOTP, whatever you trust |
| **RBAC** | because not everyone should access the nuclear codes |
| **Host-Based Access Control** | only trusted devices get in |
| **Audit Logging** | for when the auditors come knocking |

👉 Think of it as **identity with teeth**.

---

## ☁️ Multi-Cloud & Private Cloud Integration

ZeroTrustBSD operates as a sovereign enforcement boundary within heterogeneous cloud environments, ensuring that policy, identity, and cryptographic integrity remain under operator control regardless of the underlying infrastructure. It functions not as a passive appliance, but as an active, programmable node in the security control plane, capable of enforcing zero trust at the edge of any virtualized or cloud-native domain. The system integrates with both open and proprietary cloud platforms through standardized network, identity, and telemetry interfaces, ensuring interoperability without dependency. This is not integration for convenience — it is integration for control.

At the network layer, ZeroTrustBSD terminates overlay encapsulation protocols such as VXLAN and GENEVE, enabling seamless integration with software-defined networking fabrics. These overlays are used to extend Layer 2 segments across IP transport networks, allowing for consistent microsegmentation policies to be applied at the virtual machine or container interface level. The enforcement of access control is performed through anchored packet filter rulesets, where each tenant, service, or zone is assigned a dedicated rule context, preventing lateral movement and ensuring strict inter-segment isolation. These rules are dynamically updated based on infrastructure state changes, sourced from configuration management systems or orchestration APIs.

The control plane is designed for GitOps-compliant operations, where all firewall and routing configurations are version-controlled, cryptographically signed using `signify`, and audited through immutable logs. Configuration drift is actively monitored, and rollback mechanisms are implemented via ZFS snapshots, enabling deterministic recovery to a known-good state in the event of misconfiguration or compromise. Policy updates are ingested through webhook-driven event systems, allowing ZeroTrustBSD to react in real time to infrastructure provisioning, scaling, or decommissioning events. This ensures that security policy remains synchronized with operational state, even in highly dynamic environments.

Identity integration is achieved through standardized directory services and authentication protocols. The system interfaces with LDAPv3-compliant directory servers and supports Kerberos 5 for single sign-on and service ticket validation. Attribute-based access control (ABAC) is enforced at the network layer by mapping directory attributes — such as group membership, role, or clearance level — to firewall anchors and routing policies. Multi-factor authentication is supported through TOTP and challenge-response backends, ensuring that administrative access is protected against credential compromise. Certificate-based authentication is used for machine identities, with X.509 client certificates validated against a local trust store, enabling mutual TLS for service-to-service communication.

For hybrid and multi-cloud connectivity, ZeroTrustBSD acts as a customer-edge (CE) function, establishing secure tunnels to cloud provider virtual private clouds. These tunnels are implemented using WireGuard, IPsec/IKEv2, or L2TPv3, ensuring confidentiality and integrity across untrusted transport networks. BGP peering is established with cloud provider route reflectors or transit gateways, enabling dynamic exchange of reachability information. Prefix filtering, route maps, and community-based policies are applied to control the propagation of routing information, preventing route hijacking and ensuring proper traffic engineering. Health-based path selection is implemented through active probing of next-hop availability using ICMP, TCP, or BFD, enabling automatic failover across redundant uplinks.

Telemetry and observability are achieved through structured data export in JSON and protobuf formats. Logs, flow records, and metrics are forwarded via Syslog, gRPC, or HTTP streams to centralized analysis platforms. IPFIX is used to export network flow data for traffic analysis, anomaly detection, and capacity planning. Threat intelligence is integrated through OpenCTI, where indicators of compromise are correlated with network events to generate actionable alerts. Passive network telemetry is collected using Zeek, providing deep protocol analysis and behavioral baselining. Intrusion detection is performed inline using Suricata, with rulesets updated from open threat feeds or internal intelligence sources.

In private cloud environments, ZeroTrustBSD integrates directly with hypervisor-level virtual switches such as Open vSwitch or native vswitch instances. It attaches to virtual network interfaces through passthrough or SR-IOV-capable NICs, enabling enforcement at the vNIC level. SDN controller interaction is achieved through RESTful APIs, where topology and policy directives are consumed and translated into local `pf.conf` anchors and state tracking rules. Tenant isolation is enforced through VLAN, VXLAN, or VRF-like constructs, with strict inter-zone access controls applied via stateful packet inspection.

Compliance automation is embedded within the system, where regulatory requirements from NIS2, DORA, ISO 27001, and LPM are translated into technical controls. These include mandatory logging thresholds, encryption mandates, access review cycles, and configuration baselines. Controls are implemented as code, versioned, and signed, ensuring auditability and reproducibility. The system generates compliance reports based on real-time configuration and event data, reducing the burden of manual audits.

Sovereignty is preserved by ensuring that all critical functions — policy enforcement, key management, identity validation, and logging — remain under operator control. The system does not rely on cloud provider security services for core functions. Instead, it subordinates the cloud infrastructure to its own security model, ensuring that even in a vendor-managed environment, the operator retains full authority over access, encryption, and monitoring.

This architectural approach ensures that ZeroTrustBSD functions not as a siloed security appliance, but as a first-class participant in modern cloud ecosystems — enforcing zero trust, cryptographic integrity, and regulatory compliance across dynamic, distributed, and hybrid environments. It is, in essence, a protocol-compliant, standards-based, sovereign enforcement node — deployable anywhere from the edge to the core, from private data centers to public cloud VPCs.

---

## 🛰️ Tactical Networking: Built for War, Not Meetings
- **VXLAN Overlays** — isolate like a surgeon
- **BGP Orchestration** — with `openbgpd`, because static routes are for dinosaurs
- **CARP** — high availability without needing a prayer
- **Purdue Model Isolation** — jails, loopbacks, anchored `pf.conf` — all enforced
- **R-SPAN Monitoring** — because you need to *see* the attack before it kills you

👉 See [`MICROSEGMENTATION.md`](MICROSEGMENTATION.md) for full playbooks — written by someone who’s done it in the field.

---

## 🛡 Threat Detection & Observability  
### (Because “We Were Hacked” Should Never Be Your First Alert)
## 🛰️ Tactical Networking: Built for War, Not Meetings

Tactical networking, within the ZeroTrustBSD framework, is not a convenience layer for remote access. It is a **survivable communications architecture** engineered for environments where infrastructure is degraded, contested, or absent. It assumes failure at every level — from physical links to cryptographic trust — and enforces resilience through protocol-level redundancy, cryptographic integrity, and autonomous policy enforcement. This is not enterprise networking scaled down. It is **military-grade networking scaled out**, designed for sovereignty, mobility, and survival in the most hostile conditions.

At its core, ZeroTrustBSD treats the network as a **dynamic, hostile, and ephemeral medium** — not a trusted transport. Every link is assumed to be monitored, every node potentially compromised, and every route subject to disruption. The system responds not with fragility, but with **adaptive resilience**, leveraging a combination of **VXLAN-based microsegmentation**, **BGP-driven topology convergence**, **CARP-based high availability**, and **R-SPAN for passive forensic visibility**. These are not features. They are **tactical primitives** — the building blocks of a sovereign edge.

The foundation of this architecture is **VXLAN (Virtual Extensible LAN)**, used to extend Layer 2 segments across IP transport networks. Unlike traditional VLANs, which are constrained by physical topology, VXLAN enables **logical segmentation** across geographically dispersed sites, allowing for consistent policy enforcement regardless of physical location. In ZeroTrustBSD, VXLAN overlays are terminated at the edge of each enclave, with **anchored `pf.conf` rulesets** enforcing strict inter-segment access control. Each segment is treated as a **zero-trust zone**, where identity, not IP address, determines access. This model aligns with the **Purdue Enterprise Reference Architecture (PERA)** for industrial control systems, ensuring that OT/ICS environments are isolated from IT and DMZ segments, even when traversing shared underlay networks.

Routing within this environment is managed through **BGP (Border Gateway Protocol)**, specifically `openbgpd`, the OpenBSD implementation of the protocol. BGP is not used here for internet peering, but as a **dynamic control plane for private, secure overlays**. It enables **autonomous route convergence** in multi-homed or meshed topologies, allowing for rapid failover when a primary link fails. The system maintains multiple paths to critical destinations, with **health-based path selection** using active probing (ICMP, TCP, BFD) to detect link degradation before packet loss occurs. This is not static routing with failover scripts. It is **self-healing networking**, where the system reacts to environmental changes in real time, without human intervention.

High availability is enforced through **CARP (Common Address Redundancy Protocol)**, OpenBSD’s native implementation of a fault-tolerant virtual IP mechanism. CARP allows two or more ZeroTrustBSD nodes to share a virtual IP address, with one acting as master and the others in backup mode. 

State synchronization is minimal, only the virtual IP and its associated MAC address are shared, ensuring that the system remains lightweight and secure. In the event of a node failure, the backup assumes the virtual IP within seconds, maintaining connectivity without requiring client reconfiguration. 
This is not a load balancer. It is a **survivable perimeter**, capable of withstanding hardware failure, power loss, or physical destruction.

To ensure that attacks can be detected and analyzed, ZeroTrustBSD integrates **R-SPAN (Remote Switched Port Analyzer)** for passive network monitoring. R-SPAN allows traffic from one or more source ports to be mirrored across an IP network to a remote analyzer, enabling centralized visibility in distributed environments. In tactical deployments, this is used to feed traffic into **Suricata** for inline IDS/IPS, **Zeek** for passive telemetry, and **Wazuh** for log correlation and compliance mapping. The mirrored traffic is encrypted using IPsec or WireGuard, ensuring that the monitoring channel itself cannot be exploited. 
This is not surveillance. It is **forensic readiness** — the ability to reconstruct events after a breach, even in air-gapped or disconnected environments.

The integration of **SATCOM (Satellite Communications)** and **SD-RAN (Software-Defined Radio Access Network)** further extends the reach of this architecture. **Starlink** is used as a high-throughput, low-latency WAN link, capable of delivering gigabit-class connectivity to remote or mobile command posts. The system handles Starlink’s **Carrier-Grade NAT (CGNAT)** through **Tailscale** or **OpenVPN**, enabling inbound connections without requiring public IP allocation. **srsRAN**, an open-source 4G/5G stack, is deployed within FreeBSD jails or OpenBSD VMM instances to create private mobile networks for tactical units.
These networks support **network slicing**, **edge computing**, and **quantum-safe encryption**, ensuring that mobile communications remain secure and sovereign.

All configuration changes are **cryptographically signed** using `signify`, OpenBSD’s digital signature tool. This ensures that only authorized administrators can modify firewall rules, routing tables, or system settings. The entire `/etc` directory is version-controlled and monitored for integrity using `unveil(2)` and `pledge(2)`, preventing unauthorized modifications even if an attacker gains root access. This is not configuration management. It is **policy sovereignty** — the ability to prove, at any moment, that the system is running exactly what it should be running.

In operational terms, this architecture has been deployed in real-world scenarios:
- Securing the **Central Bank** after Hurricane, using satellite and radio links to restore core banking functions.
- Connecting **remote government offices** in the Caribbean via fiber and microwave, with VXLAN overlays enforcing compliance with ISO 27001.
- Deploying **mobile command posts** for disaster response, where ZeroTrustBSD ran on NUCs powered by solar generators, connected via Starlink and srsRAN.

These are not hypotheticals. They are **proven deployments** — battle-tested in the field, under real pressure, with real consequences.

ZeroTrustBSD does not assume a stable power grid. It does not assume a reliable internet connection. It does not assume trust.  
It assumes **war**.

And it is built to **win**.

### 🧠 Operational Lessons from the Field

The design of ZeroTrustBSD’s tactical networking is not theoretical. It is derived from **real-world engagements** in sovereign, remote, and post-disaster environments.

- In **Sint Maarten**, after Hurricane Irma devastated critical infrastructure, the government’s financial and emergency systems were rebuilt using **Starlink and Ubiquiti AirFiber** as primary links, with ZeroTrustBSD enforcing **microsegmentation** between the Central Bank, Prosecutor’s Office, and Maritime Radar. The system was deployed in **48 hours**, with full compliance logging and encrypted tunnels.
  
- In **Anguilla**, a cross-border interconnection project used **BGP over dark fiber** to link government sites, with ZeroTrustBSD acting as the CE function, enforcing **CARP failover** and **VXLAN segmentation** between departments. The system survived a fiber cut due to coastal erosion, with **automatic failover to a microwave backup**.

- For **Mobile Telecom Company’s Smart Grid** in Sint Maarten, ZeroTrustBSD was deployed to secure **SCADA communications** between power substations and the control center. The system used **jails for service isolation**, **Suricata for anomaly detection**, and **Wazuh for FIM on critical OT binaries**.
All traffic was encrypted with **WireGuard**, and logs were signed and stored on ZFS snapshots.

- During a **disaster recovery exercise** in the French Caribbean, ZeroTrustBSD was deployed on **Raspberry Pi 4 units** inside waterproof enclosures, powered by solar panels, and connected via **srsRAN + SATCOM and Sub-terrestrial Fiber optics.**. The nodes formed a **BGP mesh**, with **CARP for HA**, and enforced **zero-trust access** to emergency services. The entire stack was **signed, version-controlled, and auditable**.

These deployments prove that **sovereignty is not a feature of the cloud**.  
It is a function of **design, discipline, and open-source truth**.

## 🛰️ Tactical Networking: Built for War, Not Meetings

Tactical networking, within the ZeroTrustBSD framework, is not a convenience layer for remote access. It is a **survivable communications architecture** engineered for environments where infrastructure is degraded, contested, or absent. It assumes failure at every level, from physical links to cryptographic trust and enforces resilience through protocol-level redundancy, cryptographic integrity, and autonomous policy enforcement. 
This is not enterprise networking scaled down. It is **military-grade networking scaled out**, designed for sovereignty, mobility, and survival in the most hostile conditions.

At its core, ZeroTrustBSD treats the network as a **dynamic, hostile, and ephemeral medium**, not a trusted transport. Every link is assumed to be monitored, every node potentially compromised, and every route subject to disruption. The system responds not with fragility, but with **adaptive resilience**, leveraging a combination of **VXLAN-based microsegmentation**, **BGP-driven topology convergence**, **CARP-based high availability**, and **R-SPAN for passive forensic visibility**. 
These are not features. They are **tactical primitives** — the building blocks of a sovereign edge.

The foundation of this architecture is **VXLAN (Virtual Extensible LAN)**, used to extend Layer 2 segments across IP transport networks. Unlike traditional VLANs, which are constrained by physical topology, VXLAN enables **logical segmentation** across geographically dispersed sites, allowing for consistent policy enforcement regardless of physical location. In ZeroTrustBSD, VXLAN overlays are terminated at the edge of each enclave, with **anchored `pf.conf` rulesets** enforcing strict inter-segment access control. Each segment is treated as a **zero-trust zone**, where identity, not IP address, determines access. 
This model aligns with the **Purdue Enterprise Reference Architecture (PERA)** for industrial control systems, ensuring that OT/ICS environments are isolated from IT and DMZ segments, even when traversing shared underlay networks.

Routing within this environment is managed through **BGP (Border Gateway Protocol)**, specifically `openbgpd`, the OpenBSD implementation of the protocol. BGP is not used here for internet peering, but as a **dynamic control plane for private, secure overlays**. It enables **autonomous route convergence** in multi-homed or meshed topologies, allowing for rapid failover when a primary link fails. The system maintains multiple paths to critical destinations, with **health-based path selection** using active probing (ICMP, TCP, BFD) to detect link degradation before packet loss occurs. This is not static routing with failover scripts. It is **self-healing networking**, where the system reacts to environmental changes in real time, without human intervention.

High availability is enforced through **CARP (Common Address Redundancy Protocol)**, OpenBSD’s native implementation of a fault-tolerant virtual IP mechanism. CARP allows two or more ZeroTrustBSD nodes to share a virtual IP address, with one acting as master and the others in backup mode. State synchronization is minimal — only the virtual IP and its associated MAC address are shared — ensuring that the system remains lightweight and secure. In the event of a node failure, the backup assumes the virtual IP within seconds, maintaining connectivity without requiring client reconfiguration. This is not a load balancer. It is a **survivable perimeter**, capable of withstanding hardware failure, power loss, or physical destruction.

To ensure that attacks can be detected and analyzed, ZeroTrustBSD integrates **R-SPAN (Remote Switched Port Analyzer)** for passive network monitoring. R-SPAN allows traffic from one or more source ports to be mirrored across an IP network to a remote analyzer, enabling centralized visibility in distributed environments. In tactical deployments, this is used to feed traffic into **Suricata** for inline IDS/IPS, **Zeek** for passive telemetry, and **Wazuh** for log correlation and compliance mapping. The mirrored traffic is encrypted using IPsec or WireGuard, ensuring that the monitoring channel itself cannot be exploited. This is not surveillance. 
It is **forensic readiness** — the ability to reconstruct events after a breach, even in air-gapped or disconnected environments.

The integration of **SATCOM (Satellite Communications)** and **SD-RAN (Software-Defined Radio Access Network)** further extends the reach of this architecture. **Starlink** is used as a high-throughput, low-latency WAN link, capable of delivering gigabit-class connectivity to remote or mobile command posts. The system handles Starlink’s **Carrier-Grade NAT (CGNAT)** through **Tailscale** or **OpenVPN**, enabling inbound connections without requiring public IP allocation. **srsRAN**, an open-source 4G/5G stack, is deployed within FreeBSD jails or OpenBSD VMM instances to create private mobile networks for tactical units. These networks support **network slicing**, **edge computing**, and **quantum-safe encryption**, ensuring that mobile communications remain secure and sovereign.

All configuration changes are **cryptographically signed** using `signify`, OpenBSD’s digital signature tool. This ensures that only authorized administrators can modify firewall rules, routing tables, or system settings. The entire `/etc` directory is version-controlled and monitored for integrity using `unveil(2)` and `pledge(2)`, preventing unauthorized modifications even if an attacker gains root access. This is not configuration management. 
It is **policy sovereignty** — the ability to prove, at any moment, that the system is running exactly what it should be running.

In operational terms, this architecture has been deployed in real-world scenarios:
- Securing the **Central Bank of Sint Maarten** after Hurricane Irma, using satellite and radio links to restore core banking functions.
- Connecting **remote government offices** in the Caribbean via fiber and microwave, with VXLAN overlays enforcing compliance with ISO 27001.
- Deploying **mobile command posts** for disaster response, where ZeroTrustBSD ran on NUCs powered by solar generators, connected via Starlink and srsRAN.

These are not hypotheticals. They are **proven deployments** — battle-tested in the field, under real pressure, with real consequences.

ZeroTrustBSD does not assume a stable power grid. It does not assume a reliable internet connection. It does not assume trust.  
It assumes **war**.

And it is built to **win**.

### 🧠 Operational Lessons from the Field

The design of ZeroTrustBSD’s tactical networking is not theoretical. It is derived from **real-world engagements** in sovereign, remote, and post-disaster environments.

- In **Sint Maarten**, after Hurricane Irma devastated critical infrastructure, the government’s financial and emergency systems were rebuilt using **Starlink and Ubiquiti AirFiber** as primary links, with ZeroTrustBSD enforcing **microsegmentation** between the Central Bank, Prosecutor’s Office, and Maritime Radar. The system was deployed in **48 hours**, with full compliance logging and encrypted tunnels.
  
- In **Anguilla**, a cross-border interconnection project used **BGP over dark fiber** to link government sites, with ZeroTrustBSD acting as the CE function, enforcing **CARP failover** and **VXLAN segmentation** between departments. The system survived a fiber cut due to coastal erosion, with **automatic failover to a microwave backup**.

- For **Digicel’s Smart Grid** in Sint Maarten, ZeroTrustBSD was deployed to secure **SCADA communications** between power substations and the control center. The system used **jails for service isolation**, **Suricata for anomaly detection**, and **Wazuh for FIM on critical OT binaries**. All traffic was encrypted with **WireGuard**, and logs were signed and stored on ZFS snapshots.

- During a **disaster recovery exercise** in the French Caribbean, ZeroTrustBSD was deployed on **Raspberry Pi 4 units** inside waterproof enclosures, powered by solar panels, and connected via **srsRAN + Starlink**. The nodes formed a **BGP mesh**, with **CARP for HA**, and enforced **zero-trust access** to emergency services. The entire stack was **signed, version-controlled, and auditable**.

These deployments prove that **sovereignty is not a feature of the cloud**.  
It is a function of **design, discipline, and open-sourced truth**.

### 🔮 Future-Proofing Tactical Edge Deployments

ZeroTrustBSD is evolving to support next-generation tactical needs:
- **AI-Driven Anomaly Scoring**: Local LLMs will analyze SPAN/RSPAN Layer 2 packet captue, Zeek and Suricata logs to detect subtle drift in network behavior, even in disconnected environments.
- **ZFS Rollback for Incident Recovery**: In the event of a breach, operators can revert to a known-good state with a single command.
- **Quantum-Safe Mobile Backhaul**: Integration of **CRYSTALS-Kyber** into srsRAN’s transport layer for 5G backhaul encryption.
- **Mesh Networking with B.A.T.M.A.N. or OLSR**: For peer-to-peer connectivity in urban or forested areas where line-of-sight is limited.
- **Air-Gapped GitOps**: Signed policy updates pushed via USB or RF burst transmission, ensuring compliance drift is corrected even without internet.

This is not speculation.  
It is the **roadmap of survival**.

---

ZeroTrustBSD does not assume a stable power grid.  
It does not assume a reliable internet connection.  
It does not assume trust.  

It assumes **war**.

And it is built to **win**.

---

ZeroTrustBSD does not assume a stable power grid.  
It does not assume a reliable internet connection.  
It does not assume trust.  

It assumes **war**.

And it is built to **win**.
- **Wazuh**: SIEM, FIM, log analysis — free, open, powerful
- **Suricata**: IDS/IPS with real threat feeds
- **SPAN/RSPAN**: For RAW correlation of alerts and forensic analysis
- **Zeek**: Passive telemetry — see what *shouldn’t* be happening
- **OpenCTI**: Aggregate, correlate, and act on threat intel
- **Prometheus + Grafana**: Full-stack visibility — no blind spots

All integrated. All open-source. All running on OpenBSD.

---

## 🔒 Next-Gen Cryptography: Preparing for the Quantum Storm
- **WireGuard** — modern, fast, secure
- **IPsec / OpenVPN** — because legacy still exists
- **PQC Integration** — Kyber (KEM), Dilithium (signatures)
- **Crypto-Agile Design** — ready for whatever NIST throws at us next

We’re not waiting for quantum computers to break RSA.  
We’re **already ahead**.

---

## 🖥 Remote Command Console (UI)  
### (Yes, There’s a Dashboard — But It’s Not Pretty)

- React + Grafana
- Real-time firewall status, VXLAN topology, threat events
- Actions: Lockdown, reload, BGP reset
- Lightweight, air-gapped, and deployable on a Raspberry Pi

Because in a crisis, you don’t need a GUI.  
You need **control**. 
Just kidding, I'm working on it, thinking of something simple,sick and cool.

---

## 🔐 Access Control Models (ZeroTrustBSD-Aware)

ZeroTrustBSD enforces a **multi-layered, attribute-rich access control architecture** — not reliant on legacy protocols, but built for **sovereign, zero-trust environments** where every decision must be **verifiable, auditable, and cryptographically enforced**.

This is not compliance theater.  
It is **operational truth** — forged in deployments across Sint Maarten, BNP Paribas, Cour de Justice de l’UE, and OT/ICS networks under ANSSI and NIS2.

We do not trust Kerberos.  
We trust **attributes, certificates, and policy**.

---

### 🧩 The Access Control Matrix

| Model | Principle | Enforcement in ZeroTrustBSD | Attributes Used |
|------|----------|-------------------------------|----------------|
| **ABAC**<br>*(Attribute-Based Access Control)* | Access is granted based on dynamic attributes — not static roles. | Keycloak/OIDC provides user/device/session attributes → mapped to `pf.conf` anchors, jail contexts, or VMM policies via CISO Assistant AI. | `user.role=finance-admin`, `device.os=OpenBSD`, `device.fim=clean`, `location=HQ`, `time=09:00-17:00`, `network.trusted=true`, `cert.valid=true` |
| **PBAC**<br>*(Policy-Based Access Control)* | The firewall decides — not identity. Immutable rules enforce zero trust. | Signed `pf.conf` anchors (via `signify`) define per-tenant, per-VXLAN rules. No override possible. | `policy.zone=SWIFT-CDE`, `policy.class=air-gapped`, `policy.signed=yes` |
| **HBAC**<br>*(Host-Based Access Control)* | It’s not who you are — it’s what device you’re on. | Hosts enrolled in FreeIPA or Keycloak with X.509 certs. Only compliant, signed, patched devices gain access. | `host.type=NUC`, `host.enrolled=true`, `host.fim_status=clean`, `host.cert_status=valid` |
| **RBAC**<br>*(Role-Based Access Control)* | Your job title determines your access. | FreeIPA/Keycloak groups → POSIX groups → enforced via SSSD/PAM and `pf` rules. | `group=soc-analyst`, `role=ot-engineer` |
| **CBAC**<br>*(Capability-Based Access Control)* | You can only do what your process is allowed to do. | Enforced via `pledge(2)`, `unveil(2)`, and future `capsicum`. No privilege escalation. | `syscall.scope=inet+stdio`, `file.path=/var/www`, `ipc.capability=limited` |
| **TBAC**<br>*(Time-Based Access Control)* | Even if you’re allowed — not today, not now. | Keycloak policies or cron-driven `pf` reloads enforce access windows. | `access.start=08:00`, `access.end=18:00`, `access.day=mon-fri` |
| **IBAC**<br>*(Identity-Based Access Control)* | You are your cryptographic identity — not your password. | SSH certificates, mTLS, `signify`-signed identities. No passwords. | `identity.type=cert`, `identity.issuer=ztb-ca`, `identity.expires=2026-01-01` |
| **SBAC**<br>*(Service-Based Access Control)* | Access is granted to services, not users. | Microservices in jails/VMMs authenticate via mTLS or Keycloak service accounts. | `service.name=swift-gateway`, `service.env=prod`, `service.auth=mtls` |

So many ways to control. :)
---

### 🔑 Why Keycloak vs. Kerberos

**Kerberos is legacy** — a 1980s protocol with no native API support, no attribute richness, and no integration with modern cloud or Zero Trust stacks.

**Keycloak is sovereign-ready**:
- ✅ **Attribute-Rich**: Every token carries context (device, location, role, compliance)
- ✅ **Modern Protocols**: OpenID Connect, OAuth2, UMA
- ✅ **Adaptive Authentication**: Enforce MFA based on risk
- ✅ **Identity Brokering**: Integrate LDAP, AD, or social providers
- ✅ **API-First**: Secures microservices, SPAs, and CLI tools

In ZeroTrustBSD, Keycloak is not just for login.  
It is the **policy engine**, where attributes become firewall rules.

---

ZeroTrustBSD uses **attribute-to-policy translation** to enforce real Zero Trust:

```yaml
# Example: Keycloak JWT → ZeroTrustBSD Policy
{
  "sub": "u.moorjani@zerotrustbsd.com",
  "role": "security-architect",
  "device": {
    "os": "OpenBSD",
    "fim": "clean",
    "cert_valid": true,
    "enrolled": true
  },
  "session": {
    "location": "HQ",
    "network": "trusted",
    "time": "14:30"
  },
  "access": {
    "allowed_zones": ["SOC", "SWIFT-CDE"],
    "valid_until": "2025-12-31T23:59:59Z"
  }
}
---

## 🏢 Enterprise & Sector Use Cases

### 🛡 Government / Military
- National firewall infrastructure
- Tactical BGP mesh + CARP failover
- Air-gapped embassy zones
- Intelligence compartmentalization

### ⚙️ Industrial (OT / ICS)
- Purdue Model enforcement
- IEC 62443, NIS2, ISO 27001 compliance
- Secure remote access for plant technicians

### 🏥 Healthcare
- Identity-isolated clinical VLANs
- Encrypted patient data flows
- HIPAA policy validation

### 🏦 Financial & Fintech
- PCI-DSS CDE isolation
- Zero Trust transaction security
- Real-time SIEM with Wazuh/Suricata

### 🌐 Sovereign Cloud / Edge
- Hyperlocalized, sovereign enclaves
- GitOps-signed firewall policies
- Federated identity & compliance drift control

---

## 🌐 SD-WAN & SD-RAN Integration

### **SD-WAN**
- Dynamic path selection
- Traffic encryption
- Zero Trust access
- Centralized policy management

### **SD-RAN (srsRAN)**
- Private 4G/5G networks
- Network slicing
- Edge computing
- Quantum-safe mobile encryption
- Seamless roaming

🔗 Learn more: [https://www.srslte.com/](https://www.srslte.com/)

---

## 🔐 QKD vs PQC: The Quantum Truth

| Feature | QKD | PQC |
|--------|-----|-----|
| Based on Physics | ✅ Yes | ❌ No |
| Needs Special Hardware | ✅ Yes | ❌ No |
| Internet-Scalable | ❌ No | ✅ Yes |
| Immune to Quantum | ✅ Yes | ✅ Yes |
| Detects Eavesdropping | ✅ Yes | ❌ No |
| Used in TLS | ❌ Not yet | ✅ Kyber/Dilithium (trials) |

> **Hybrid approach**: QKD for high-assurance key exchange, PQC for global infrastructure.

📚 References:
- [NIST PQC Project](https://csrc.nist.gov/projects/post-quantum-cryptography)
- [ID Quantique – QKD](https://www.idquantique.com/quantum-safe-security/quantum-key-distribution/)
- [ESA QKD Milestone](https://connectivity.esa.int/news/esa-project-achieves-spaceenabled-quantum-key-distribution-link-milestone)

---

## 🧠 AI Integration: Because Even Geniuses Need Help

ZeroTrustBSD uses **open, auditable AI models** — no cloud, no PII leakage.

### Use Cases:
- **CISO Assistant**: “Is this rule compliant with NIS2?”
- **SIEM Triage**: “Is this alert worth waking me up for?”
- **Config Review**: “Why is port 8443 open?”
- **Incident Narrator**: Auto-generate postmortems

Example:
```bash
$ ask-zero "Why is this IP blocked?"
🤖: Check `pf.conf` anchor `threat_feeds`. Matched on C2 server in Ukraine.
