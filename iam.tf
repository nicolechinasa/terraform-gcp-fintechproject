resource "google_service_account" "sa" {
  account_id   = "bank-app-sa"
  display_name = "Bank App SA"
}