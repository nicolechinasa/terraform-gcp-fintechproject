resource "google_compute_network" "bank_vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "bank_subnet" {
  name          = "${var.project_id}-subnet"
  ip_cidr_range = "10.0.0.0/18"
  region        = var.region
  network       = google_compute_network.bank_vpc.id

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }

  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

resource "google_compute_router" "bank_router" {
  name    = "${var.project_id}-router"
  region  = var.region
  network = google_compute_network.bank_vpc.id
}

resource "google_compute_router_nat" "bank_nat" {
  name                               = "${var.project_id}-nat"
  router                             = google_compute_router.bank_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}