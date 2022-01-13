resource "google_compute_region_instance_group_manager" "instance_group" {
  name               = local.instance_group_name
  base_instance_name = local.instance_group_name
  region             = var.gcp_region
  version {
    instance_template = google_compute_instance_template.app_template.id
  }
  auto_healing_policies {
    health_check      = google_compute_health_check.http-health-check.id
    initial_delay_sec = var.instance_group_initial_delay_sec
  }
}

resource "google_compute_health_check" "http-health-check" {
  name                = local.health-check-name
  timeout_sec         = var.http-health-check_timeout_sec
  check_interval_sec  = var.http-health-check_check_interval_sec
  healthy_threshold   = var.http-health-check_healthy_threshold
  unhealthy_threshold = var.http-health-check_unhealthy_threshold
  http_health_check {
    port = var.http-health-check_port
  }
}

resource "google_compute_region_autoscaler" "instance_group_autoscaler" {
  name   = local.instance_group_autoscaler_name
  target = google_compute_region_instance_group_manager.instance_group.id
  region = var.gcp_region
  autoscaling_policy {
    max_replicas    = var.instance_group_autoscaler_max_replicas
    min_replicas    = var.instance_group_autoscaler_min_replicas
    cooldown_period = var.instance_group_autoscaler_cooldown_period
    cpu_utilization {
      target = var.instance_group_autoscaler_cpu_utilization_target
    }
  }
}

