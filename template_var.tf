variable "template_type" {
  description = "Change to use another machine type"
  type        = string
  default     = "e2-micro"
}

variable "template_image" {
  description = "Change to use another image"
  type        = string
  default     = "debian-cloud/debian-10"
}