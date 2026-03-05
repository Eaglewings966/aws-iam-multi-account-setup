# Variables for Security Module
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "management"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cloudtrail_enabled" {
  description = "Enable CloudTrail logging"
  type        = bool
  default     = true
}

variable "guardduty_enabled" {
  description = "Enable GuardDuty threat detection"
  type        = bool
  default     = true
}

variable "securityhub_enabled" {
  description = "Enable Security Hub"
  type        = bool
  default     = true
}

variable "config_enabled" {
  description = "Enable AWS Config"
  type        = bool
  default     = true
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 90
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "Emmanuel Ubani"
}