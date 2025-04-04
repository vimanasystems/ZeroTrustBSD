#!/bin/sh
#
# ZeroTrustBSD ISO Builder (OpenBSD-compatible Next Generation Firewall)
#
# Builds a ZeroTrustBSD ISO leveraging native OpenBSD tools and recommended security packages
# Usage:
#   chmod +x build-zerotrustbsd.sh
#   ./build-zerotrustbsd.sh

set -e

echo "Starting ZeroTrustBSD ISO build..."

# Directories
ISO_DIR="zerotrustbsd-iso"
ROOTFS="$ISO_DIR/rootfs"
ISO_NAME="zerotrustbsd-$(date +%Y%m%d).iso"

rm -rf "$ISO_DIR"
mkdir -p "$ROOTFS/etc" "$ROOTFS/packages" "$ROOTFS/scripts"

# Basic rootfs setup
echo "ZeroTrustBSD ISO (Next-Gen Firewall)" > "$ROOTFS/README.txt"
echo "hostname=zerotrustbsd" > "$ROOTFS/etc/hostname.em0"
echo "pf_enable=YES" > "$ROOTFS/etc/rc.conf.local"

# Recommended packages (OpenBSD-compatible)
PACKAGES="
suricata zeek ossec-hids openvpn wireguard-tools strongswan openbgpd openospfd
prometheus grafana loki elasticsearch kibana beats ansible git curl vim syslog-ng
signify xorriso oath-toolkit bpftrace
"

# Fetch packages (simulate pkg_add -d for simplicity)
echo "Fetching OpenBSD-compatible packages..."
for pkg in $PACKAGES; do
    echo "[Simulated fetch] $pkg"
    touch "$ROOTFS/packages/$pkg.tgz"
done

# Installation script
cat << 'EOF' > "$ROOTFS/scripts/install-packages.sh"
#!/bin/sh
echo "Installing ZeroTrustBSD packages..."
pkg_add -v /packages/*.tgz
EOF
chmod +x "$ROOTFS/scripts/install-packages.sh"

# Create ISO
echo "Creating ISO image..."
xorriso -as mkisofs -o "$ISO_NAME" -R -J "$ROOTFS"

echo "ISO successfully created: $ISO_NAME"
