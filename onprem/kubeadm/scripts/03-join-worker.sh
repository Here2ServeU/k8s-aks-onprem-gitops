#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 '<kubeadm join ... --token ... --discovery-token-ca-cert-hash ...>'"
  exit 1
fi

sudo bash -lc "$1"
