# Outputs for Security Module
# Author: Emmanuel Ubani - Cloud & DevOps Engineer

output "config_recorder_id" {
  description = "ID of the AWS Config recorder"
  value       = aws_config_configuration_recorder.main.id
}

output "config_bucket_arn" {
  description = "ARN of the S3 bucket for Config logs"
  value       = aws_s3_bucket.config_logs.arn
}

output "config_bucket_name" {
  description = "Name of the S3 bucket for Config logs"
  value       = aws_s3_bucket.config_logs.bucket
}

output "config_role_arn" {
  description = "ARN of the IAM role for Config"
  value       = aws_iam_role.config.arn
}

output "cloudtrail_arn" {
  description = "ARN of the CloudTrail"
  value       = aws_cloudtrail.main.arn
}

output "cloudtrail_home_region" {
  description = "Home region of the CloudTrail"
  value       = aws_cloudtrail.main.home_region
}

output "guardduty_detector_id" {
  description = "ID of the GuardDuty detector"
  value       = aws_guardduty_detector.main.id
}

output "securityhub_id" {
  description = "ID of the Security Hub account"
  value       = aws_securityhub_account.main.id
}