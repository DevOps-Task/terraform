resource "kubernetes_deployment" "external-deployment" {
  metadata {
    name = "external-deploy"
    namespace = kubernetes_namespace.ns.metadata[0].name
  }

  spec {
    replicas                  = var.replicas
    selector {
      match_labels = {
        App = "external"
      }
    }
    template {
      metadata {
        labels = {
          App = "external"
        }
      }
      spec {
        container {
          image = "jsarvabhowma/externalapp:v2"
          name  = "external-container"

          port {
            container_port = 8080
          }
        env {
          name = "SERVER"
          value = var.serverurl
        }
        }
      }
    }
  }
}
