resource "google_compute_network" "test-network" {
  name                    = "test-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us-central1-gke-primary-subnet" {
  name          = "gke-subnet"
  region        = "us-central1"
  network       = google_compute_network.test-network.id
  ip_cidr_range = "192.168.85.0/24"
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "gke-cluster"
    ip_cidr_range = "192.168.4.0/22"
  }
  secondary_ip_range {
    range_name    = "gke-services"
    ip_cidr_range = "192.168.0.32/27"
  }
}
