terraform {
  backend "gcs" {
    bucket = "bank-app-terraform-state" # replace with your GCS bucket name
    prefix = "terraform/gke"
  }
}