# Variables for AWS Organizations
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

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

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "management"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "Emmanuel Ubani"
}