variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table to access"
  type        = string
}
