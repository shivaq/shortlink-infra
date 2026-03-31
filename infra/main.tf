terraform {
  required_version = ">= 1.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  backend "gcs" {
    # bucket set via -backend-config or terraform init -backend-config
    prefix = "shortlink/state"
  }
}

module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
  env        = var.env
}

module "artifact_registry" {
  source     = "./modules/artifact-registry"
  project_id = var.project_id
  region     = var.region
  env        = var.env
}

module "secret_manager" {
  source     = "./modules/secret-manager"
  project_id = var.project_id
  env        = var.env
}

module "cloud_sql" {
  source     = "./modules/cloud-sql"
  project_id = var.project_id
  region     = var.region
  env        = var.env
}

module "cloud_run" {
  source              = "./modules/cloud-run"
  project_id          = var.project_id
  region              = var.region
  env                 = var.env
  image               = var.app_image
  service_account     = module.iam.cloud_run_sa_email
  db_connection_name  = module.cloud_sql.connection_name
  secret_ids          = module.secret_manager.secret_ids
}

module "cloudflare" {
  source      = "./modules/cloudflare"
  zone_id     = var.cloudflare_zone_id
  env         = var.env
  cloud_run_url = module.cloud_run.url
}

module "monitoring" {
  source     = "./modules/monitoring"
  project_id = var.project_id
  env        = var.env
  slack_webhook_url = var.slack_webhook_url
}
