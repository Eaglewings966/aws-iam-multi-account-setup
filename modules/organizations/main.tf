# AWS Organizations - Multi Account Setup
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_organizations_organization" "main" {
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "sso.amazonaws.com"
  ]

  feature_set = "ALL"
}

# Management Account OUs
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security"
  parent_id = aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = aws_organizations_organization.main.roots[0].id
}

# Dev Account
resource "aws_organizations_account" "dev" {
  name      = var.dev_account_name
  email     = var.dev_account_email
  parent_id = aws_organizations_organizational_unit.workloads.id

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# Prod Account
resource "aws_organizations_account" "prod" {
  name      = var.prod_account_name
  email     = var.prod_account_email
  parent_id = aws_organizations_organizational_unit.workloads.id

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
} 