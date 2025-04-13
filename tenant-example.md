
# 🧱 tenant-example.md – VMM & Jail Tenant Template for ZeroTrustBSD

This guide demonstrates how to define and deploy isolated tenants using OpenBSD's built-in virtualization (VMM) and jail features for microsegmentation and multi-tenancy.

---

## 📁 VMM Setup: vm.conf

Configure tenant VMs using `/etc/vm.conf`:

```conf
switch "trusted" {
    interface bridge0
}

vm "tenant1" {
    memory 512M
    disk "/home/tenants/tenant1.img"
    interface {
        switch "trusted"
        lladdr 00:0c:29:01:02:03
    }
    disable
}

vm "tenant2" {
    memory 1G
    disk "/home/tenants/tenant2.img"
    interface {
        switch "trusted"
    }
    disable
}
```

> 💡 Use `vmctl start tenant1` to launch the tenant after creating the disk image.

---

## 🧱 Jail Template (Minimal)

Create a jailed service inside a chroot-compatible directory:

```sh
# mkdir -p /jails/tenant1/etc /jails/tenant1/usr /jails/tenant1/tmp
# cp /etc/resolv.conf /jails/tenant1/etc/

# mount -t ffs /dev/sd1a /jails/tenant1
# chroot /jails/tenant1 /bin/ksh
```

> This jail runs isolated binaries and can be extended for PF anchors and service proxies.

---

## 🔐 Suggested Network Segmentation

| Tenant       | Interface | VLAN/Subnet | Role             |
|--------------|-----------|-------------|------------------|
| tenant1      | vether0.10| 10.10.10.0/24| Finance Dept     |
| tenant2      | vether0.20| 10.10.20.0/24| Public Services  |
| admin        | em0       | 192.168.1.0/24| Management Plane |

Use PF anchors like:

```pf
anchor "tenant1" {
    pass in quick on vether0.10 proto tcp to port 443
}
```

---

## 📊 Isolation Benefits

- Resource Quotas (CPU, RAM, Disk)
- Firewall Enforcement (PF anchors)
- VPN/IDM per tenant (WireGuard + RCDevs)
- Secure Logging and Auditing (Wazuh/Filebeat)
- Compliance Mapping (e.g., ISO 27001 segregation of duties)

---

## 🔄 Maintenance Tips

- Use `vmctl reload` after updating `vm.conf`
- Backup jail FS regularly (`/etc/jailfs`)
- Monitor with Prometheus per tenant interface
- Rotate logs via `newsyslog.conf`

---

> 🛡 ZeroTrustBSD leverages native OpenBSD isolation for strong tenant segmentation without external hypervisors.

