output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "quarkus_api_url" {
  value = kubernetes_service.quarkus_service.status.load_balancer.ingress[0].ip
}

output "vertx_api_url" {
  value = kubernetes_service.vertx_service.status.load_balancer.ingress[0].ip
}
