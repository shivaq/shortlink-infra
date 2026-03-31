# Prod environment — GCP project: shortlink-prod
# !! HUMAN-ONLY apply — never run terraform apply with this file from CI or agent !!
# Apply: terraform apply -var-file=environments/prod.tfvars  (human, manually)

project_id         = "shortlink-prod"
region             = "asia-northeast1"
env                = "prod"
cloudflare_zone_id = ""  # fill in after Cloudflare zone is created
slack_webhook_url  = ""  # fill in from Slack app settings
