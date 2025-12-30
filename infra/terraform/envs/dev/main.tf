module "aks" {
  source              = "../../modules/aks"
  location            = "eastus"
  resource_group_name = "rg-k8s-dev"
  cluster_name        = "aks-dev"
  dns_prefix          = "aksdev"
  node_count          = 2
  tags = {
    env = "dev"
    owner = "dr-emmanuel"
  }
}
