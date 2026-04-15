resource "google_container_node_pool" "nodes" {
  name     = "bank-node-pool"
  cluster  = google_container_cluster.cluster.name
  location = var.zone

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  depends_on = [google_container_cluster.cluster]
}