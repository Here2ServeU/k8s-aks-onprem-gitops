param location string = resourceGroup().location
param clusterName string
param dnsPrefix string
param nodeCount int = 2
param nodeVmSize string = 'Standard_DS2_v2'

resource aks 'Microsoft.ContainerService/managedClusters@2023-11-01' = {
  name: clusterName
  location: location
  identity: { type: 'SystemAssigned' }
  properties: {
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'system'
        count: nodeCount
        vmSize: nodeVmSize
        mode: 'System'
        type: 'VirtualMachineScaleSets'
        osType: 'Linux'
      }
    ]
    enableRBAC: true
    networkProfile: {
      networkPlugin: 'azure'
      loadBalancerSku: 'standard'
    }
  }
}
