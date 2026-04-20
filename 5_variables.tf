variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone for cluster and nodes"
  type        = string
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "bank-cluster"
}

variable "machine_type" {
  description = "Worker node machine type"
  type        = string
  default     = "e2-medium"
}

variable "node_disk_size_gb" {
  description = "Worker node boot disk size in GB"
  type        = number
  default     = 50
}

variable "min_node_count" {
  description = "Minimum nodes per zone (autoscaler lower bound)"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum nodes per zone (autoscaler upper bound)"
  type        = number
  default     = 3
}