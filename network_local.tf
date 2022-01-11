locals {
  vpc_name    = "${var.gcp_env_type}-network"
  subnet_name = "${local.vpc_name}-subnet"
}