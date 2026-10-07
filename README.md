# Learn Terraform From Scratch

Hands-on Terraform learning journey — from a single VPC to a production-grade, multi-environment AWS network module.

> Status: work in progress.

---

## What it does

Documents a step-by-step path through Terraform on AWS — starting with a single VPC, then refactoring it into a reusable module with a multi-environment folder structure and remote state, adding real networking (data sources, public/private subnets, IGW, per-environment NAT Gateway, Flow Logs, VPC Endpoints), then production-grade practices (variable validation and deprecation, tagging strategy, lifecycle safeguards, cross-environment state references, `check` blocks, ephemeral resources and write-only arguments), advanced HCL (dynamic blocks, `depends_on`, `import`/`moved`/`removed` blocks, `terraform query`), and finally native testing (`terraform test`) plus a CI/CD pipeline via GitHub Actions with OIDC and `tflint`/`trivy`/`terraform-docs` tooling.

---

## Why I'm building it

6 years of SRE/Cloud Engineering background, but I'm returning to work after a 5-year break — this rebuilds the Terraform mental model from the ground up, stage by stage, instead of relying on rusty muscle memory. The roadmap deliberately mirrors what a real SRE/Cloud Engineer role needs in production: modules, remote state, multi-environment structure, CI/CD with OIDC — not a single `main.tf` that never gets touched again.

---

## Stack

| Layer | Tool |
|---|---|
| IaC | Terraform ~> 1.16 | 
| Provider | hashicorp/aws ~> 6.0 |
| Cloud provider | AWS (VPC, IAM, CloudWatch, S3, SSM Parameter Store) |
| Remote state | S3 backend with native locking (`use_lockfile`) |
| CI/CD | GitHub Actions (OIDC to AWS — no long-lived keys) |
| Linting / scanning | tflint, trivy |
| Docs | terraform-docs |
| Testing | `terraform test` (native), Terratest in Go (bonus) |

---

## Folder Structure

not available yet.

---

## Installation

not available yet.

---

## Roadmap

Detailed execution roadmap is in [ROADMAP.md](ROADMAP.md).
