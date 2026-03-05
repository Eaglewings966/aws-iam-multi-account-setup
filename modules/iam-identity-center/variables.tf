# Variables for IAM Identity Center
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

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

variable "dev_account_id" {
  description = "AWS Account ID for development environment"
  type        = string
}

variable "prod_account_id" {
  description = "AWS Account ID for production environment"
  type        = string
}

variable "sso_instance_arn" {
  description = "ARN of the SSO instance"
  type        = string
  default     = ""
}

variable "mfa_enabled" {
  description = "Enable MFA for all users"
  type        = bool
  default     = true
}

variable "session_duration" {
  description = "Session duration for permission sets"
  type        = string
  default     = "PT8H"
}