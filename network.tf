resource "google_compute_network" "vpc_network" {
  name                    = local.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = local.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow_http_rule" {
  name          = local.http_rule_name
  network       = google_compute_network.vpc_network.id
  direction     = "INGRESS"
  source_ranges = var.http_range
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}