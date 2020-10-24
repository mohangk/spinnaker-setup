resource "google_storage_bucket" "spinnaker-bucket" {
  project       = var.project
  name          = "${var.project}-spinnaker-sept-2020"
  location      = "ASIA-NORTHEAST3"
  force_destroy = true
  uniform_bucket_level_access = true
}

