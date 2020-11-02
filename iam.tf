resource "google_service_account" "spinnaker-sa" {
  project       = var.project
  account_id   = "spinnaker"
  display_name = "Spinnaker Service Account"
}

resource "google_storage_bucket_iam_member" "spinnaker-sa-bucket-admin" {
  bucket = google_storage_bucket.spinnaker-bucket.name
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.spinnaker-sa.email}"
}
resource "google_project_iam_member" "spinnaker-sa-container-developer" {
  project  = var.project
  role     = "roles/container.developer"
  member   = "serviceAccount:${google_service_account.spinnaker-sa.email}"
}

resource "google_project_iam_member" "spinnakar-sa-cloud-build-editor" {
  project  = var.project
  role     = "roles/cloudbuild.builds.editor"
  member   = "serviceAccount:${google_service_account.spinnaker-sa.email}"
}

