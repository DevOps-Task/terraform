output "cluster-name" {
  value = google_container_cluster.democluster.name
}

output "cluster-location" {
  value = google_container_cluster.democluster.location
}

output "internal-op" {
  value = kubernetes_service.internal.status
}

output "external-op" {
  value = kubernetes_service.external.status
}
