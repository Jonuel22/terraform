provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
}

resource "kubernetes_deployment" "quarkus" {
  metadata {
    name = "quarkus-api"
    labels = {
      app = "quarkus"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "quarkus"
      }
    }

    template {
      metadata {
        labels = {
          app = "quarkus"
        }
      }

      spec {
        container {
          image = "your-registry.azurecr.io/apiquarkus:latest"
          name  = "quarkus-api"
          ports {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "vertx" {
  metadata {
    name = "vertx-api"
    labels = {
      app = "vertx"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "vertx"
      }
    }

    template {
      metadata {
        labels = {
          app = "vertx"
        }
      }

      spec {
        container {
          image = "your-registry.azurecr.io/vertx:latest"
          name  = "vertx-api"
          ports {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "quarkus_service" {
  metadata {
    name = "quarkus-service"
  }

  spec {
    selector = {
      app = "quarkus"
    }

    ports {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "vertx_service" {
  metadata {
    name = "vertx-service"
  }

  spec {
    selector = {
      app = "vertx"
    }

    ports {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
