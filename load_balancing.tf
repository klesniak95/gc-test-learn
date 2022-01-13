resource "google_compute_target_http_proxy" "load_balancer" {
  name    = local.load_balancer_proxy_name
  url_map = google_compute_url_map.load_balancer_url_map.id
}

resource "google_compute_url_map" "load_balancer_url_map" {
  name            = local.load_balancer_name
  default_service = google_compute_backend_service.load_balancer_backend.id
}

resource "google_compute_backend_service" "load_balancer_backend" {
  name                  = local.load_balancer_backend_name
  health_checks         = [google_compute_health_check.http-health-check.id]
  load_balancing_scheme = "EXTERNAL"
  backend {
    group           = google_compute_region_instance_group_manager.instance_group.instance_group
    balancing_mode  = "UTILIZATION"
    max_utilization = var.load_balancer_backend_max_utilization
    capacity_scaler = 1
  }
}

resource "google_compute_global_forwarding_rule" "load_balancer_frontend" {
  name                  = local.load_balancer_fronted_name
  ip_protocol           = "TCP"
  port_range            = var.load_balancer_frontend_port
  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_http_proxy.load_balancer.id
  ip_address            = google_compute_global_address.load_balancer_public_ip.id
}

resource "google_compute_global_address" "load_balancer_public_ip" {
  name = local.load_balancer_public_ip_name
}