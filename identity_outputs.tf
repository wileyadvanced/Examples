output "identity_role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.identity_role.arn
}

output "identity_policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.identity_policy.arn
}
