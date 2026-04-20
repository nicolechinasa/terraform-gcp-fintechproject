output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.cluster.name
}

output "cluster_endpoint" {
  description = "GKE control plane endpoint"
  value       = google_container_cluster.cluster.endpoint
  sensitive   = true
}

output "node_service_account" {
  description = "Email of the GKE node service account"
  value       = google_service_account.gke_nodes.email
}

output "kubeconfig_command" {
  description = "Run this after apply to configure kubectl"
  value       = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.zone} --project ${var.project_id}"
}