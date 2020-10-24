resource "google_service_account" "spinnaker-sa" {
  project       = var.project
  account_id   = "spinnaker"
  display_name = "Spinnaker Service Account"
}
