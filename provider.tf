provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = module.kube.host
  client_certificate     = base64decode(module.kube.client_certificate)
  client_key             = base64decode(module.kube.client_key)
  cluster_ca_certificate = base64decode(module.kube.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.kube.host
    client_certificate     = base64decode(module.kube.client_certificate)
    client_key             = base64decode(module.kube.client_key)
    cluster_ca_certificate = base64decode(module.kube.cluster_ca_certificate)
  }
}