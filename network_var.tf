variable "subnet_cidr" {
  description = "You can customize subnet CIDR here or leave default"
  type        = string
  default     = "10.0.10.0/24"
}

variable "http_range" {
  description = "You can customize range to limit HTTP access"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}