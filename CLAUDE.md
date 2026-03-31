# shortlink-infra — Terraform Infrastructure

Design docs: `~/001.LocalRepository/GitHub/study/agent-task-mng-study/service-dev-study/projects/003-url-shortener-cf-gcp/`

## Scope

- Work only within this repository directory
- Never read `~/.config/gcloud`, `~/.ssh`, or any path outside the project
- Design docs under `projects/003-url-shortener-cf-gcp/` are **read-only**

## Terraform execution policy (Option A)

- **May run locally:** `terraform plan -var-file=environments/dev.tfvars` and `terraform apply -var-file=environments/dev.tfvars`
- Always run `plan` and review output before `apply`
- Never use `-auto-approve` in local runs
- Always pass `-var-file=environments/dev.tfvars` explicitly
- **Never run:** `terraform apply -var-file=environments/prod.tfvars` — prod is human-only

## State backend

GCS bucket: `shortlink-tf-state-<project-id>`. Must be initialized before any local apply:

```bash
terraform init
```

## Modules

| Module | Resources |
|--------|-----------|
| `cloud-run` | Cloud Run service, IAM bindings |
| `cloud-sql` | Cloud SQL PostgreSQL instance, databases, users |
| `iam` | Service accounts, WIF pool + provider |
| `secret-manager` | Secret Manager secrets |
| `artifact-registry` | Docker repository |
| `monitoring` | Uptime checks, alert policies, notification channels |
| `cloudflare` | DNS zone, records, page rules (CDN config) |

## Design context pointers

| Question | Read |
|----------|------|
| Infrastructure design | `04-infra-plan.md` |
| Cost targets | `05-finops.md` |
| SLOs + alerting | `06-sre.md` |
| Security / WIF | `10-appsec.md` |
