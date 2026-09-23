variable "aws_region" {
  type        = string
  description = "AWS region for the Terraform backend."
}

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name for Terraform state."

  validation {
    condition     = length(var.bucket_name) >= 3
    error_message = "The S3 bucket name must contain at least 3 characters."
  }
}