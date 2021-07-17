terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.57"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=1.3.2"
    }
  }
  required_version = ">= 0.15.0"
}