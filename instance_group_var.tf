variable "instance_group_initial_delay_sec" {
  description = "Initial delay for health check in seconds"
  type        = number
  default     = 300
}

variable "http-health-check_timeout_sec" {
  description = "Time out in seconds"
  type        = number
  default     = 10
}

variable "http-health-check_check_interval_sec" {
  description = "Time interval beetween checks in seconds"
  type        = number
  default     = 10
}

variable "http-health-check_healthy_threshold" {
  description = "Healthy treshold in HTTP check tries"
  type        = number
  default     = 3
}

variable "http-health-check_unhealthy_threshold" {
  description = "Unhealthy treshold in HTTP check tries"
  type        = number
  default     = 3
}

variable "http-health-check_port" {
  description = "Port used in HTTP check"
  type        = number
  default     = 80
}

variable "instance_group_autoscaler_max_replicas" {
  description = "Maximum ammount of VM's inside Instance Group"
  type        = number
  default     = 4
}

variable "instance_group_autoscaler_min_replicas" {
  description = "Minimum ammount of VM's inside Instance Group"
  type        = number
  default     = 2
}

variable "instance_group_autoscaler_cooldown_period" {
  description = "Cooldown period for autoscaling"
  type        = number
  default     = 120
}

variable "instance_group_autoscaler_cpu_utilization_target" {
  description = "Percent of CPU target utilization"
  type        = number
  default     = 0.75
}