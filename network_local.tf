locals {
  vpc_name       = "${var.gcp_env_type}-network"
  subnet_name    = "${local.vpc_name}-subnet"
  http_rule_name = "${local.subnet_name}-allow-http"
  router_name    = "${local.vpc_name}-router"
  nat_name       = "${local.vpc_name}-nat"
}