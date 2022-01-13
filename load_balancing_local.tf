locals {
  load_balancer_name           = "${var.gcp_env_type}-load-balancer"
  load_balancer_backend_name   = "${var.gcp_env_type}-load-balancer-backend"
  load_balancer_fronted_name   = "${var.gcp_env_type}-load-balancer-frontend"
  load_balancer_proxy_name     = "${var.gcp_env_type}-load-balancer-proxy"
  load_balancer_public_ip_name = "${var.gcp_env_type}-load-balancer-public-ip"
}