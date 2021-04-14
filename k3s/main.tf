terraform {
  backend "local" {
    path = "./states/k3s/terraform.tfstate"
  }
  required_version = ">= 0.14.9"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}
