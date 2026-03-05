# Variables for Production Environment
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS Account ID for production environment"
  type        = string
}

variable "dev_account_name" {
  description = "Name of the development AWS account"
  type        = string
  default     = "emmanuel-dev"
}

variable "dev_account_email" {
  description = "Email address for the development AWS account"
  type        = string
}

variable "prod_account_name" {
  description = "Name of the production AWS account"
  type        = string
  default     = "emmanuel-prod"
}

variable "prod_account_email" {
  description = "Email address for the production AWS account"
  type        = string
}

variable "admin_display_name" {
  description = "Display name for the admin user"
  type        = string
  default     = "Emmanuel Ubani"
}

variable "admin_username" {
  description = "Username for the admin user"
  type        = string
  default     = "emmanuel.ubani"
}

variable "admin_given_name" {
  description = "Given name for the admin user"
  type        = string
  default     = "Emmanuel"
}

variable "admin_family_name" {
  description = "Family name for the admin user"
  type        = string
  default     = "Ubani"
}

variable "admin_email" {
  description = "Email address for the admin user"
  type        = string
  default     = "eaglewynx@gmail.com"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "Emmanuel Ubani"
}

variable "log_retention_days" {
  description = "Number of days to retain logs in production"
  type        = number
  default     = 365
}

variable "mfa_enabled" {
  description = "Enable MFA for all users"
  type        = bool
  default     = true
}

variable "session_duration" {
  description = "Session duration for permission sets in production"
  type        = string
  default     = "PT4H"
}