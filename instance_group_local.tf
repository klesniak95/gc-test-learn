locals {
  health-check-name              = "${var.gcp_env_type}-health-check"
  instance_group_name            = "${var.gcp_env_type}-instance-group"
  instance_group_autoscaler_name = "${var.gcp_env_type}-instance-group-name"
}