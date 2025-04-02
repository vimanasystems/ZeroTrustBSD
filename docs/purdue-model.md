# 🏗️ Purdue Model Explained for Engineers

The **Purdue Model** (Purdue Enterprise Reference Architecture - PERA) helps organize and secure Industrial Control Systems (ICS) by breaking them into layers or levels — from business systems down to physical devices.

## 📊 Purdue Model Layers (Simplified)

| Level | Function                      | Example Systems                      |
|-------|-------------------------------|--------------------------------------|
| 5     | Enterprise Network            | ERP, HR, Finance, Email              |
| 4     | Business Network              | IT services, Authentication, DNS     |
| 3     | DMZ / Operations Management   | Patch servers, firewalls, jump hosts |
| 2     | Supervisory Control           | SCADA, HMIs                          |
| 1     | Control Systems               | PLCs, RTUs                           |
| 0     | Physical Process              | Sensors, actuators, motors           |

## 🔍 ASCII Diagram of the Purdue Model

```text
  +------------------------------+
  |        Level 5 – ERP         | <- Business Planning (Email, SAP)
  +------------------------------+
  |     Level 4 – IT Services    | <- Databases, AD, Cloud, DNS
  +------------------------------+
  |     Level 3 – DMZ Firewall   | <- Segmentation barrier
  +------------------------------+
  |  Level 2 – SCADA / HMI View  | <- Operator Interface, Visualization
  +------------------------------+
  |   Level 1 – PLCs & RTUs      | <- Control logic, ladder diagrams
  +------------------------------+
  | Level 0 – Physical Devices   | <- Motors, valves, relays, sensors
  +------------------------------+
```

## 🔐 What is Layer Isolation?

**Layer isolation** means:
- Keeping layers separate using firewalls, ACLs, and routing.
- Preventing threats from moving laterally or vertically.
- Monitoring and logging cross-layer traffic.

## 🛡️ How ZeroTrustBSD Helps Secure the Purdue Model

| Function                    | ZeroTrustBSD Capability                          |
|-----------------------------|--------------------------------------------------|
| Firewalling                 | PF with strict rules between Purdue levels       |
| Virtual Isolation           | VMM and jails per level or department            |
| Threat Detection            | Suricata IDS + eBPF for anomaly monitoring       |
| Protocol Control            | Filter industrial protocols (Modbus, DNP3, etc.) |
| Compliance Mapping          | PCI DSS, ISO 27001, NIS2                         |
| Secure MPLS/VXLAN           | Traffic path enforcement via overlays            |

## 🧠 Example: Why Isolation Matters

Imagine a phishing email hits an employee laptop (Level 5).
Without isolation, that malware might try to:
- Scan the entire network
- Access SCADA systems (Level 2)
- Hijack a PLC and shut down a pump (Level 0)

With ZeroTrustBSD:
- The malware is blocked by pf.conf at Level 3
- The SCADA system is isolated in a jail
- Alerts are triggered via Wazuh + OpenCTI

## 🧾 Summary

✅ Use the Purdue Model to structure your ICS/OT networks  
✅ Apply ZeroTrustBSD firewalls and segmentation between levels  
✅ Add monitoring and identity enforcement where it matters most

> ZeroTrustBSD provides modern tools to protect legacy infrastructure — from sensors to boardrooms.
