terraform {
  backend "local" {
    path = "./states/k3s/terraform.tfstate"
  }
  required_version = ">= 0.14.9"
}
