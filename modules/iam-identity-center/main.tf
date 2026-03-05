# IAM Identity Center Configuration
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

data "aws_ssoadmin_instances" "main" {}

locals {
  sso_instance_arn      = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  identity_store_id     = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
}

# Permission Set - Admin Access
resource "aws_ssoadmin_permission_set" "admin" {
  name             = "AdministratorAccess"
  description      = "Full administrator access permission set"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT8H"

  tags = {
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# Permission Set - Developer Access
resource "aws_ssoadmin_permission_set" "developer" {
  name             = "DeveloperAccess"
  description      = "Developer access with limited permissions"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT8H"

  tags = {
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# Permission Set - Read Only Access
resource "aws_ssoadmin_permission_set" "readonly" {
  name             = "ReadOnlyAccess"
  description      = "Read only access permission set"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT4H"

  tags = {
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# Attach AWS Managed Policy - Admin
resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
}

# Attach AWS Managed Policy - Developer
resource "aws_ssoadmin_managed_policy_attachment" "developer" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn
}

# Attach AWS Managed Policy - Read Only
resource "aws_ssoadmin_managed_policy_attachment" "readonly" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.readonly.arn
}

# IAM Identity Center User - Admin
resource "aws_identitystore_user" "admin" {
  identity_store_id = local.identity_store_id

  display_name = var.admin_display_name
  user_name    = var.admin_username

  name {
    given_name  = var.admin_given_name
    family_name = var.admin_family_name
  }

  emails {
    value   = var.admin_email
    type    = "work"
    primary = true
  }
}

# IAM Identity Center Group - Admins
resource "aws_identitystore_group" "admins" {
  identity_store_id = local.identity_store_id
  display_name      = "Administrators"
  description       = "Group for administrator users"
}

# IAM Identity Center Group - Developers
resource "aws_identitystore_group" "developers" {
  identity_store_id = local.identity_store_id
  display_name      = "Developers"
  description       = "Group for developer users"
}

# Add Admin User to Admins Group
resource "aws_identitystore_group_membership" "admin" {
  identity_store_id = local.identity_store_id
  group_id          = aws_identitystore_group.admins.group_id
  member_id         = aws_identitystore_user.admin.user_id
}