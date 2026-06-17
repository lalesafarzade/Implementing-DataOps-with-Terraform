
# AWS DataOps Infrastructure: Bastion Host & RDS Proxy with Terraform

An automated Infrastructure as Code (IaC) configuration to deploy an isolated PostgreSQL database within a private subnet, securely accessible only via an EC2-based Bastion Host (Jump Server).
```
[ Your Laptop ] 
       │
       ▼  (Secure SSH / TLS Connection)
┌────────────────────────────────────────────────────────┐
│ AWS VPC (Virtual Private Cloud)                        │
│                                                        │
│   ┌──────────────────┐                                 │
│   │ Public Subnet    │                                 │
│   │  Bastion Host    │                                 │
│   └──────────┬───────┘                                 │
│              │ (Internal Traffic Only)                 │
│              ▼                                         │
│   ┌────────────────────────────────────────────────┐   │
│   │ Private Subnet (Isolated)                      │   │
│   │                                                │   │
│   │ 🔄 RDS Proxy  ──►  🗄️ RDS PostgreSQL Databas   │   │
│   └────────────────────────────────────────────────┘   │
└────────────────────────────────────────────────────────┘
```

##  Architecture Overview

The project is structured modularly to isolate the infrastructure logic (`modules/bastion_host/`) from the root execution variables, ensuring clean maintainability.

```text
terraform/
├── backend.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    └── bastion_host/
        ├── providers.tf
        ├── variables.tf
        ├── outputs.tf
        ├── network.tf
        ├── ec2.tf
        └── rds.tf

```

- **Public Subnet:** Hosts the EC2 Bastion Server, serving as a gateway from the public internet.
- **Private Subnet:** Hosts the RDS PostgreSQL Instance, fully isolated from outside incoming connections.
- **Security Group Chaining:** The database firewall explicitly allows traffic exclusively from the Bastion Host's security group on port `5432`.
- **Dynamic Secret Handshake:** Automatically provisions an ephemeral TLS private key locally, applies strict file system access controls (`0400`), and provisions a random strong master password for the database.

##  How to Run

### 1. Requirements
Ensure you have the [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) and [AWS CLI](https://aws.amazon.com/cli/) configured with proper credentials.

### 2. Configuration
Create a file named `terraform.tfvars` in the root directory and populate it with your pre-existing network setup information:

```hcl
aws_region         = "us-east-1"
project_name       = "dataops-secure"
vpc_id             = "vpc-xxxxxxxxxxxxxxxxx"
public_subnet_id   = "subnet-xxxxxxxxxxxxxxxxx"
private_subnet_ids = ["subnet-yyyyyyyyyyyyyyyyy", "subnet-zzzzzzzzzzzzzzzzz"]
db_username        = "db_admin"