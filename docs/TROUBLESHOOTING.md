# Troubleshooting Runbook

## Workload issues
- Pods Pending: check node resources, taints, affinity
- CrashLoopBackOff: check logs, env vars, probes

## Networking
- Service not reachable: verify endpoints, kube-proxy/CNI, NetworkPolicies

## GitOps
- App OutOfSync: inspect diff, repo path, sync waves

## Policy
- Admission denied: check Kyverno/Gatekeeper constraint messages
