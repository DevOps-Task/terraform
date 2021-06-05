resource "google_container_cluster" "democluster" {
name               = var.app_name
location           = var.zone
initial_node_count = var.nodecount

node_config {
  preemptible  = true
  machine_type = "n1-standard-1"
  oauth_scopes = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
}
}
