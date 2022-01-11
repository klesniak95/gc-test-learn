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

resource "google_compute_router" "vpc_router" {
  name    = local.router_name
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "nat" {
  name                               = local.nat_name
  nat_ip_allocate_option             = "AUTO_ONLY"
  router                             = google_compute_router.vpc_router.name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}