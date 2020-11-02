resource "google_storage_bucket" "spinnaker-bucket" {
  project       = var.project
  name          = "${var.project}-spinnaker2-sept-2020"
  location      = "US-CENTRAL1"
  force_destroy = true
  uniform_bucket_level_access = true
}

