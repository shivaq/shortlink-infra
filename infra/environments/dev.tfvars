# Dev environment — GCP project: shortlink-dev
# Apply: terraform apply -var-file=environments/dev.tfvars
# NEVER use this file as a template for prod — use prod.tfvars

project_id         = "shortlink-dev"
region             = "asia-northeast1"
env                = "dev"
cloudflare_zone_id = ""  # fill in after Cloudflare zone is created
slack_webhook_url  = ""  # fill in from Slack app settings
