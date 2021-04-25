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

resource "kubernetes_namespace" "gocd" {
  metadata {
    labels = {
      "name" = "gocd"
    }
    name = "gocd"
  }
}
