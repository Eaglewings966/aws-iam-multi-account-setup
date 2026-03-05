# Security Configuration
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

# AWS Config - Track resource changes
resource "aws_config_configuration_recorder" "main" {
  name     = "emmanuel-config-recorder"
  role_arn = aws_iam_role.config.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

# S3 Bucket for Config Logs
resource "aws_s3_bucket" "config_logs" {
  bucket        = "${var.environment}-config-logs-${var.account_id}"
  force_destroy = true

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "config_logs" {
  bucket = aws_s3_bucket.config_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "config_logs" {
  bucket = aws_s3_bucket.config_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block Public Access
resource "aws_s3_bucket_public_access_block" "config_logs" {
  bucket = aws_s3_bucket.config_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# IAM Role for Config
resource "aws_iam_role" "config" {
  name = "emmanuel-config-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    ManagedBy = "Terraform"
    Owner     = "Emmanuel Ubani"
  }
}

# Attach Config Policy to Role
resource "aws_iam_role_policy_attachment" "config" {
  role       = aws_iam_role.config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}

# CloudTrail - Audit Logging
resource "aws_cloudtrail" "main" {
  name                          = "emmanuel-cloudtrail"
  s3_bucket_name                = aws_s3_bucket.config_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# AWS GuardDuty - Threat Detection
resource "aws_guardduty_detector" "main" {
  enable = true

  datasources {
    s3_logs {
      enable = true
    }
    kubernetes {
      audit_logs {
        enable = true
      }
    }
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Emmanuel Ubani"
  }
}

# Security Hub
resource "aws_securityhub_account" "main" {}

resource "aws_securityhub_standards_subscription" "aws_foundational" {
  depends_on    = [aws_securityhub_account.main]
  standards_arn = "arn:aws:securityhub:us-east-1::standards/aws-foundational-security-best-practices/v/1.0.0"
}