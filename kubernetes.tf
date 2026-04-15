resource "kubernetes_service_account" "bank_app_ksa" {
  metadata {
    name      = "bank-app-ksa"
    namespace = "default"
    annotations = {
      "iam.gke.io/gcp-service-account" = google_service_account.bank_app_sa.email
    }
  }
}