terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "development-423908-tfstate"
    prefix = "gke/bank-cluster"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}