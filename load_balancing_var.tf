variable "load_balancer_frontend_port" {
  description = "Port used by LB frontend"
  type        = number
  default     = "80"
}

variable "load_balancer_backend_max_utilization" {
  description = "CPU usage for LB purpose from 0.0 to 1.0"
  type        = number
  default     = "0.8"
}