resource "google_container_cluster" "bank_cluster" {
  name     = var.cluster_name
  location = var.region

  enable_autopilot = true

  network    = google_compute_network.bank_vpc.id
  subnetwork = google_compute_subnetwork.bank_subnet.id

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.authorised_ipv4_cidr
      display_name = "Authorised access"
    }
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  release_channel {
    channel = "REGULAR"
  }
}