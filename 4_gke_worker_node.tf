resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.zone

  # Remove the default node pool immediately — we manage our own below
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  # VPC-native cluster — uses secondary ranges from the subnet above
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  # Allows terraform destroy without GCP console protection blocking it
  deletion_protection = false
}

resource "google_container_node_pool" "primary" {
  name     = "${var.cluster_name}-node-pool"
  location = var.zone
  cluster  = google_container_cluster.cluster.name

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    machine_type    = var.machine_type
    disk_size_gb    = var.node_disk_size_gb
    service_account = google_service_account.gke_nodes.email

    # cloud-platform scope lets the node SA use the IAM bindings in iam.tf
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}