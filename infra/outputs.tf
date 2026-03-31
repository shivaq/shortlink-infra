output "cloud_run_url" {
  description = "Cloud Run service URL"
  value       = module.cloud_run.url
}

output "cloud_sql_connection_name" {
  description = "Cloud SQL connection name (for Cloud SQL Auth Proxy)"
  value       = module.cloud_sql.connection_name
}

output "artifact_registry_repo" {
  description = "Artifact Registry Docker repo URI"
  value       = module.artifact_registry.repo_uri
}
