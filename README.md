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

One reusable module (`modules/vpc`), and one folder per environment. Each environment folder is its own root module with its own state, so an `apply` in `dev` can never touch `prod`.

```
learn-terraform-from-scratch/
├── modules/
│   └── vpc/
│       ├── main.tf           # aws_vpc resource
│       ├── variables.tf      # module inputs (no defaults)
│       └── outputs.tf        # vpc_id, vpc_cidr_block
└── environments/
    ├── dev/
    │   ├── versions.tf       # Terraform CLI & provider version constraints
    │   ├── providers.tf      # AWS provider config (region, default_tags)
    │   ├── main.tf           # calls ../../modules/vpc
    │   ├── variables.tf      # inputs (no default for environment / vpc_cidr)
    │   ├── terraform.tfvars  # dev values (non-secret, committed)
    │   ├── outputs.tf
    │   └── .terraform.lock.hcl
    └── prod/                 # same layout, different values (10.1.0.0/16)
```

`environment` and `vpc_cidr` deliberately have **no default** — a forgotten value fails loudly instead of silently deploying with another environment's value. `terraform.tfvars` is allow-listed in `.gitignore`; any other `*.tfvars` (e.g. a future `secrets.auto.tfvars`) stays ignored.

---

## Installation

**Prerequisites**

- Terraform `~> 1.16.0` (64-bit build — `terraform version` should show `windows_amd64` / `linux_amd64`)
- AWS CLI configured with credentials (`aws sts get-caller-identity` should succeed)

**Run** (per environment — pick `dev` or `prod`)

```bash
cd environments/dev
terraform init      # download the AWS provider & register the module
terraform validate  # check syntax
terraform plan      # preview changes
terraform apply     # create the VPC
terraform output    # show VPC ID and CIDR
terraform destroy   # clean up when done
```

Values come from `terraform.tfvars` in each folder. Override with `-var`, e.g. `terraform plan -var="vpc_cidr=10.2.0.0/16"`.

> State is stored locally per environment (`environments/*/terraform.tfstate`, git-ignored) until Stage 4 moves it to S3.

---

## Roadmap

Detailed execution roadmap is in [ROADMAP.md](ROADMAP.md).
