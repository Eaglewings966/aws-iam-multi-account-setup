# AWS Multi-Account Architecture
## Author: Emmanuel Ubani - Cloud & DevOps Engineer

---

## Overview

This project provisions a secure multi-account AWS environment using 
Terraform. It implements AWS best practices for account structure, 
identity management, and security controls.

---

## Architecture Diagram
```
                    ┌─────────────────────────┐
                    │   Management Account     │
                    │   (Root/Billing)         │
                    └───────────┬─────────────┘
                                │
                    ┌───────────▼─────────────┐
                    │   AWS Organizations      │
                    │   IAM Identity Center    │
                    └───────────┬─────────────┘
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
┌─────────▼──────┐   ┌─────────▼──────┐   ┌─────────▼──────┐
│  Security OU   │   │  Workloads OU  │   │  Sandbox OU    │
│                │   │                │   │                │
│ - CloudTrail   │   │ - Dev Account  │   │ - Test Account │
│ - Config       │   │ - Prod Account │   │                │
│ - GuardDuty    │   │                │   │                │
└────────────────┘   └────────────────┘   └────────────────┘
```

---

## Components

### 1. AWS Organizations
- Root management account
- Three Organizational Units (OUs):
  - Security OU — for security tooling accounts
  - Workloads OU — for dev and prod accounts
  - Sandbox OU — for testing and experimentation

### 2. IAM Identity Center
- Centralized identity management
- Three permission sets:
  - AdministratorAccess — full access for admins
  - DeveloperAccess — power user access for developers
  - ReadOnlyAccess — read only access for auditors
- MFA enforcement for all users
- Role based access control across all accounts

### 3. Security Controls
- **CloudTrail** — audit logging across all accounts
- **AWS Config** — resource change tracking
- **GuardDuty** — threat detection and monitoring
- **Security Hub** — centralized security findings
- **S3 Encryption** — AES256 encryption for all logs
- **S3 Public Access Block** — no public access to logs

---

## Prerequisites

- AWS Account with Organizations enabled
- Terraform v1.0 or higher installed
- AWS CLI configured with admin credentials
- IAM Identity Center enabled in your AWS account

---

## How to Deploy

### 1. Clone the repository
```bash
git clone https://github.com/Eaglewings966/aws-iam-multi-account-setup.git
cd aws-iam-multi-account-setup
```

### 2. Navigate to environment
```bash
cd environments/dev
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Review the plan
```bash
terraform plan
```

### 5. Apply the configuration
```bash
terraform apply
```

---

## Project Structure
```
aws-iam-multi-account-setup/
├── modules/
│   ├── organizations/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── iam-identity-center/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── security/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── variables.tf
│   └── prod/
│       ├── main.tf
│       └── variables.tf
├── docs/
│   └── architecture.md
└── README.md
```

---

## Security Best Practices Implemented

- MFA enforced for all IAM Identity Center users
- Least privilege access through permission sets
- All S3 buckets encrypted with AES256
- Public access blocked on all S3 buckets
- CloudTrail enabled across all regions
- GuardDuty enabled for threat detection
- Security Hub enabled for centralized findings
- Resource tagging for cost allocation and governance

---

## Author

**Emmanuel Ubani**
Cloud & DevOps Engineer
Lagos, Nigeria

- LinkedIn: [ubaniemmanuel](https://www.linkedin.com/in/ubaniemmanuel)
- GitHub: [Eaglewings966](https://github.com/Eaglewings966)
- Email: eaglewynx@gmail.com