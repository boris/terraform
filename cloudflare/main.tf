provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}

resource "random_password" "password" {
  length  = 32
  special = true
}

resource "cloudflare_argo_tunnel" "home" {
  account_id = var.account_id
  name       = "home-tf"
  secret     = base64encode(random_password.password.result)
}
