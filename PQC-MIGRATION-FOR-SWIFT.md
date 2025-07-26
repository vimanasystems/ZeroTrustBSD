# PQC Migration Path for SWIFT & Financial Systems

## Problem
SWIFT uses RSA-2048 and SHA-2. Both are vulnerable to quantum attacks.

Adversaries are harvesting traffic today for future decryption.

## Solution
Migrate to NIST-standardized PQC algorithms:
- **CRYSTALS-Kyber** (KEM) for key exchange
- **CRYSTALS-Dilithium** (signatures) for authentication

## Phase 1: Inventory
- Map all SWIFT MT/MX endpoints
- Identify crypto libraries in use
- Flag systems using RSA, ECC, SHA-2

## Phase 2: Test Environment
- Build a lab with OpenBSD + OpenSSL (PQC-enabled)
- Simulate SWIFT-like TLS sessions using Kyber
- Monitor with Wazuh for anomalies

## Phase 3: Hybrid Mode
- Deploy **hybrid TLS**: RSA + Kyber
- Ensure backward compatibility
- Prepare for full PQC transition by 2027

## Tools Needed
- OpenBSD (secure base)
- Wazuh (monitoring)
- OpenSSL with PQC patches (https://github.com/open-quantum-safe)
- Your brain.

This is not optional.  
It is sovereign survival.
