resource "kubernetes_deployment" "internal-deployment" {
  metadata {
    name = "internal-deploy"
    namespace = kubernetes_namespace.ns.metadata[0].name
  }

  spec {
    replicas                  = var.replicas
    selector {
      match_labels = {
        App = "internal"
      }
    }
    template {
      metadata {
        labels = {
          App = "internal"
        }
      }
      spec {
        container {
          image = "jsarvabhowma/internalapp:v1"
          name  = "internal-container"

          port {
            container_port = 8082
          }

        }
      }
    }
  }
}
