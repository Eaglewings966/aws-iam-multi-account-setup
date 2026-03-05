# AWS IAM Multi-Account Setup
### Author: Emmanuel Ubani — Cloud & DevOps Engineer

![Terraform](https://img.shields.io/badge/Terraform-v1.0+-623CE4?style=flat&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Multi--Account-FF9900?style=flat&logo=amazonaws)
![Security](https://img.shields.io/badge/Security-Hardened-green?style=flat)
![MFA](https://img.shields.io/badge/MFA-Enabled-blue?style=flat)

---

## 📋 Overview

This project provisions a **secure, production-grade multi-account AWS 
environment** using Terraform. It implements AWS best practices for 
account structure, identity management, and security controls across 
multiple AWS accounts.

Built as part of my hands-on Cloud & DevOps engineering practice.

---

## 🏗️ What This Project Builds

- ✅ AWS Organizations with structured Organizational Units
- ✅ IAM Identity Center with role-based access control
- ✅ MFA enforcement for all users
- ✅ Permission sets for Admin, Developer, and ReadOnly access
- ✅ CloudTrail audit logging across all accounts
- ✅ AWS Config for resource change tracking
- ✅ GuardDuty for threat detection
- ✅ Security Hub for centralized security findings
- ✅ Encrypted S3 buckets for all logs
- ✅ Separate Dev and Prod environments

---

## 🛠️ Technologies Used

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| AWS Organizations | Multi-account management |
| IAM Identity Center | Centralized identity & access |
| CloudTrail | Audit logging |
| AWS Config | Resource tracking |
| GuardDuty | Threat detection |
| Security Hub | Security findings |
| S3 | Log storage |

---

## 📁 Project Structure
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

## 🚀 How to Deploy

### Prerequisites
- AWS Account with Organizations enabled
- Terraform v1.0 or higher
- AWS CLI configured with admin credentials
- IAM Identity Center enabled

### Steps

**1. Clone the repository**
```bash
git clone https://github.com/Eaglewings966/aws-iam-multi-account-setup.git
cd aws-iam-multi-account-setup
```

**2. Navigate to environment**
```bash
cd environments/dev
```

**3. Initialize Terraform**
```bash
terraform init
```

**4. Review the plan**
```bash
terraform plan
```

**5. Apply the configuration**
```bash
terraform apply
```

---

## 🔒 Security Best Practices Implemented

- MFA enforced for all IAM Identity Center users
- Least privilege access through permission sets
- All S3 buckets encrypted with AES256
- Public access blocked on all S3 buckets
- CloudTrail enabled across all regions
- GuardDuty enabled for threat detection
- Security Hub enabled for centralized findings
- Resource tagging for cost allocation and governance

---

## 📖 Documentation

Full architecture documentation available in [docs/architecture.md](docs/architecture.md)

---

## 🔗 Connect With Me

**Emmanuel Ubani — Cloud & DevOps Engineer**

- 💼 LinkedIn: [ubaniemmanuel](https://www.linkedin.com/in/ubaniemmanuel)
- 🐙 GitHub: [Eaglewings966](https://github.com/Eaglewings966)
- 📧 Email: eaglewynx@gmail.com
- 🌐 Portfolio: [ops-run.lovable.app](https://ops-run.lovable.app)

---

*"Building secure cloud infrastructure one Terraform module at a time." ☁️*