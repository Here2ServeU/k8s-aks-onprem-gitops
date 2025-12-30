module "aks" {
  source              = "../../modules/aks"
  location            = "eastus"
  resource_group_name = "rg-k8s-prod"
  cluster_name        = "aks-prod"
  dns_prefix          = "aksprod"
  node_count          = 3
  tags = {
    env = "prod"
    owner = "dr-emmanuel"
  }
}
