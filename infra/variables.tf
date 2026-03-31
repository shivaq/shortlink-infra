variable "project_id" {
  description = "GCP project ID (e.g. shortlink-dev or shortlink-prod)"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-northeast1"
}

variable "env" {
  description = "Environment name: dev or prod"
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "env must be 'dev' or 'prod'."
  }
}

variable "app_image" {
  description = "Full Docker image URI for Cloud Run (e.g. asia-northeast1-docker.pkg.dev/...)"
  type        = string
  default     = ""
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for the shortlink domain"
  type        = string
}

variable "slack_webhook_url" {
  description = "Slack webhook URL for monitoring alerts"
  type        = string
  sensitive   = true
}
