
# 🤝 CONTRIBUTING.md – How to Contribute to ZeroTrustBSD

Welcome, and thank you for considering a contribution to **ZeroTrustBSD** — a sovereign, BSD-licensed firewall OS based on OpenBSD, purpose-built for high-assurance environments.

---

## 📌 Contribution Goals

We aim to:
- Keep the system lean, secure, and verifiable
- Promote interoperability with modern cybersecurity tools
- Maintain compliance with NIS2, GDPR, ISO 27001, and other frameworks
- Support sovereign deployments and secure global collaboration

---

## 🧑‍💻 Ways You Can Contribute

| Contribution Type     | Description |
|------------------------|-------------|
| 🛠️ Code                | New features, drivers, modules, or integrations |
| 🧾 Documentation        | Fix typos, clarify usage, add new configuration examples |
| 📦 Packaging           | Help package tools for OpenBSD compatibility |
| 🔐 Security Hardening  | Review pf rules, implement exploit mitigations |
| 📊 Dashboards          | Create ELK, Grafana, or CISO Assistant templates |
| 🌍 Translations        | Translate documentation to other languages |
| 🚀 Community Support   | Help triage issues or mentor new contributors |

---

## 🛠️ Code Standards

- Use **OpenBSD-friendly C**, POSIX shell (`sh` or `ksh`), or `make`
- Follow man-page and OpenBSD patch guidelines
- Prefer minimalism and clarity over feature bloat
- Each feature must come with documentation if user-facing
- Use ANSI escape sequences for CLI output where appropriate

---

## 🔐 Security Considerations

Please report vulnerabilities **privately** before disclosing publicly.  
Contact: `security [at] zerotrustbsd [dot] org`  
GPG: Available in `/docs/GPG-KEY.asc`

---

## ✅ Pull Request Guidelines

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Follow commit convention: `type: description` (e.g., `fix: update pf rule parsing`)
4. Submit a PR and describe:
   - The feature or fix
   - Related issues
   - Risks and test coverage

> Every PR is reviewed manually for quality and security impact.

---

## 📂 Project Structure

| Directory        | Purpose |
|------------------|---------|
| `/docs`          | Markdown files and guides |
| `/scripts`       | CLI tools, install helpers |
| `/etc`           | Default configurations |
| `/src`           | Source patches and utilities |
| `/tests`         | Manual and automated tests |

---

## 🌍 Communication

- GitHub Discussions: [github.com/vimanasystems/ZeroTrustBSD/discussions](https://github.com/vimanasystems/ZeroTrustBSD/discussions)
- Community Matrix: `#zerotrustbsd:matrix.org`
- Email Support: `support@zerotrustbsd.org`

---

## 💡 Good First Issues

We label beginner-friendly contributions with `good first issue` and `help wanted`.

> Not sure where to start? Check the [issues page](https://github.com/vimanasystems/ZeroTrustBSD/issues) and introduce yourself!

---

## 📜 License of Contributions

All contributions are assumed to be licensed under the project's [BSD 2-Clause License](./LICENSE.md).  
By submitting code, you agree to the terms therein.

---

Thank you for making ZeroTrustBSD a trusted platform for sovereign security.  
Together, we secure the infrastructure of tomorrow.

