provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}

resource "random_password" "password" {
  length  = 32
  special = true
}

resource "cloudflare_tunnel" "home" {
  account_id = var.account_id
  name       = "home-tf"
  secret     = base64encode(random_password.password.result)
}

resource "cloudflare_tunnel_config" "config" {
  account_id = var.account_id
  tunnel_id  = cloudflare_tunnel.home.id

  config {
    origin_request {
      no_tls_verify = false
    }
    ingress_rule {
      hostname = "test.insert-coin.org"
      service  = "https://localhost"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}
