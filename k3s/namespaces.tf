resource "kubernetes_namespace" "monitoring" {
  metadata {
    labels = {
      "name" = "monitoring"
    }
    name = "monitoring"
  }
}

resource "kubernetes_namespace" "networking" {
  metadata {
    labels = {
      "name" = "networking"
    }
    name = "networking"
  }
}
