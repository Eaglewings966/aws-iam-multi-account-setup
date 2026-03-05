# Development Environment
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "emmanuel-terraform-state-dev"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
      Owner       = "Emmanuel Ubani"
      Project     = "AWS Multi Account Setup"
    }
  }
}

# Call Organizations Module
module "organizations" {
  source = "../../modules/organizations"

  dev_account_name  = var.dev_account_name
  dev_account_email = var.dev_account_email
  prod_account_name = var.prod_account_name
  prod_account_email = var.prod_account_email
  region            = var.region
  environment       = "development"
  owner             = "Emmanuel Ubani"
}

# Call IAM Identity Center Module
module "iam_identity_center" {
  source = "../../modules/iam-identity-center"

  admin_display_name = var.admin_display_name
  admin_username     = var.admin_username
  admin_given_name   = var.admin_given_name
  admin_family_name  = var.admin_family_name
  admin_email        = var.admin_email
  dev_account_id     = module.organizations.dev_account_id
  prod_account_id    = module.organizations.prod_account_id
  mfa_enabled        = true
  session_duration   = "PT8H"
}

# Call Security Module
module "security" {
  source = "../../modules/security"

  environment         = "development"
  account_id          = var.account_id
  region              = var.region
  cloudtrail_enabled  = true
  guardduty_enabled   = true
  securityhub_enabled = true
  config_enabled      = true
  log_retention_days  = 90
  owner               = "Emmanuel Ubani"
}