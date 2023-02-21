output "password" {
  value     = random_password.password.result
  sensitive = true
}

output "tunnel-token" {
  value     = cloudflare_argo_tunnel.home.tunnel_token
  sensitive = true
}

output "tunnel-secret" {
  value     = cloudflare_argo_tunnel.home.secret
  sensitive = true
}
