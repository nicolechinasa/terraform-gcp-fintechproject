resource "google_service_account" "bank_app_sa" {
  account_id   = "bank-app-sa"
  project      = var.project_id
  display_name = "Bank App Service Account"
}

resource "google_artifact_registry_repository_iam_member" "ar_reader" {
  project    = var.project_id
  location   = "us-central1"   # your AR region
  repository = "bank-repo"
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${google_service_account.bank_app_sa.email}"
}

resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.bank_app_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[default/bank-app-ksa]"
}