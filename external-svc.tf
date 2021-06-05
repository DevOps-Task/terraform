resource "kubernetes_service" "external" {
  metadata {
    name      = "external-svc"
    namespace = kubernetes_namespace.ns.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.external-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
