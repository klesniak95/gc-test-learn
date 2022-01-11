variable "gcp_project_id" {
  description = "Project ID to be used with Terraform"
  type        = string
  default     = "gcp-test-337911"
}

variable "gcp_env_type" {
  description = "Set one of DEV, TEST, PROD"
  type        = string
  default     = "dev"
}

variable "gcp_region" {
  description = "Region to be used with Terraform"
  type        = string
  default     = "us-central1"
}