resource "google_container_cluster" "daebak-cluster" {
  provider = google-beta
  name               = "daebak-cluster"
  location           = "asia-northeast3"
  initial_node_count = 1
  network    = google_compute_network.test-network.id
  subnetwork = google_compute_subnetwork.asia-northeast3-gke-primary-subnet.id
  min_master_version = "1.16.13-gke.401"
  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-cluster"
    services_secondary_range_name = "gke-services"
  }
  workload_identity_config {
    identity_namespace = "${var.project}.svc.id.goog"
  }
  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.32/28"
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = google_compute_subnetwork.asia-northeast3-gke-primary-subnet.ip_cidr_range
      display_name = google_compute_subnetwork.asia-northeast3-gke-primary-subnet.name
    }
    cidr_blocks {
      cidr_block = "HOMEIP/32"
      display_name = "another"
    }
  }
  node_config {
    machine_type = "n1-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
