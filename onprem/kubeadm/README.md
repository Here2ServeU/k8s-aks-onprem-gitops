# On-Prem Kubernetes (kubeadm)

This directory contains scripts to create a single-control-plane kubeadm cluster and join workers.

## Files
- `scripts/01-install-prereqs.sh` install containerd + kube packages
- `scripts/02-init-control-plane.sh` kubeadm init + kubeconfig + CNI
- `scripts/03-join-worker.sh` join worker node (uses token printed by init)

## Usage
Run on each node as root (or with sudo).
