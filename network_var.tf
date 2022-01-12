variable "subnet_cidr" {
  description = "You can customize subnet CIDR here or leave default"
  type        = string
  default     = "10.0.10.0/24"
}

variable "http_range" {
  description = "Required for Load Balancer working correctly"
  type        = list(any)
  default     = ["130.211.0.0/22" , "35.191.0.0/16"]
}