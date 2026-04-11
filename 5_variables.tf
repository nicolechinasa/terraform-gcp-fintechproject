variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region to deploy resources into"
  type        = string
  default     = "us-east1"
}

variable "cluster_name" {
  description = "Name of the GKE Autopilot cluster"
  type        = string
  default     = "bank-cluster"
}

variable "authorised_ipv4_cidr" {
  description = "Your IP address allowed to access the GKE control plane"
  type        = string
  default     = "0.0.0.0/0" # replace with your actual IP for security
}