#!/usr/bin/env bash
set -euo pipefail

POD_CIDR=${POD_CIDR:-"192.168.0.0/16"}

sudo kubeadm init --pod-network-cidr="$POD_CIDR"

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Calico CNI
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml

echo
echo "Run this on workers to join:" 
kubeadm token create --print-join-command
