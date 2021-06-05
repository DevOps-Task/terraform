resource "kubernetes_service" "internal" {
  metadata {
    name      = "internal-svc"
    namespace = kubernetes_namespace.ns.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.internal-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8082
      target_port = 8082
    }

    type = "ClusterIP"
  }
}
