# Architecture

**Environments:**
- `dev`, `prod` for Terraform
- Optional Bicep deployment for AKS (for orgs that standardize on Bicep)

**Flow:**
1. CI builds + validates manifests (lint/kubeconform)
2. Argo CD syncs apps
3. Kyverno/Gatekeeper enforce policies
4. Prometheus/Grafana provide observability

