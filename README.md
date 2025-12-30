# Kubernetes AKS + On-Prem (kubeadm) GitOps Project

**Goal:** Build, deploy, and support containerized applications on Kubernetes across **Azure AKS** and **on-prem (kubeadm)** using **Terraform**, **Bicep**, **CI/CD**, and **GitOps (Argo CD)** with **policy enforcement (Kyverno + Gatekeeper)** and **observability**.

## What this repo demonstrates (maps to job requirements)
- Build/deploy/support apps on Kubernetes (sample app + GitOps)
- Design/maintain clusters (AKS via Terraform/Bicep, on-prem via kubeadm scripts)
- Troubleshoot workloads/networking/cluster issues (runbooks + validation)
- CI/CD + GitOps (GitHub Actions + Azure DevOps + Argo CD)
- Secure, compliant configs (Kyverno + Gatekeeper policies, Pod Security context)
- Collaboration patterns (env separation, modules, pull-request workflow)
- Monitoring/logging/observability (kube-prometheus-stack + sample alerts)

## Quick start
### 1) Provision AKS (Terraform)
```bash
cd infra/terraform/envs/dev
terraform init
terraform apply -auto-approve
```

### 2) Provision AKS (Bicep)
```bash
az group create -n rg-k8s-dev -l eastus
az deployment group create -g rg-k8s-dev -f infra/bicep/aks/main.bicep -p infra/bicep/aks/params.dev.json
```

### 3) Install Argo CD and sync apps
```bash
kubectl create ns argocd
kubectl apply -n argocd -f gitops/argocd/install.yaml
kubectl apply -n argocd -f gitops/argocd/app-of-apps.yaml
```

### 4) On-prem cluster (kubeadm)
See `onprem/kubeadm/README.md`.

## Validation
- APIs: `kubectl get pods -A`, `kubectl get svc -A`, `kubectl get ingress -A`
- GitOps: Argo CD shows apps **Synced/Healthy**
- Policy: A non-compliant pod is **blocked** by Kyverno/Gatekeeper
- Observability: Prometheus + Grafana deployed and scraping cluster metrics

## CI/CD
- GitHub Actions: `.github/workflows/ci.yml` (also provided in `ci/github-actions/`)
- Azure DevOps: `ci/azure-devops/azure-pipelines.yml`

