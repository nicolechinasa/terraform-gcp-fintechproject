# Not used for Autopilot clusters — GCP manages all nodes automatically.
# If you switch to Standard, define a google_container_node_pool here.
#
# resource "google_container_node_pool" "bank_nodes" {
#   name     = "bank-node-pool"
#   cluster  = google_container_cluster.bank_cluster.name
#   location = var.region
#
#   autoscaling {
#     min_node_count = 1
#     max_node_count = 3
#   }
#
#   node_config {
#     machine_type = "e2-medium"
#     disk_size_gb = 50
#     oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
#
#     workload_metadata_config {
#       mode = "GKE_METADATA"
#     }
#   }
# }