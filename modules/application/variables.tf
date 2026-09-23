variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the application instances."
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) == 2
    error_message = "Exactly two private subnet IDs must be specified."
  }
}

variable "ami_id" {
  description = "AMI ID for the application instances."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the application instances."
  type        = string
}

variable "application_security_group_id" {
  description = "Security group ID for the application instances."
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for the application instances."
  type        = string
}

variable "app_port" {
  description = "Port on which the application will run."
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances in the Auto Scaling group."
  type        = number

  default = 2

  validation {
    condition     = var.desired_capacity >= 2
    error_message = "The desired capacity must be at least 2."
  }
}

variable "min_size" {
  description = "Minimum number of EC2 instances in the Auto Scaling group."
  type        = number

  default = 2

  validation {
    condition     = var.min_size >= 2
    error_message = "The minimum size must be at least 2."
  }
}

variable "max_size" {
  description = "Maximum number of EC2 instances in the Auto Scaling group."
  type        = number

  default = 4

  validation {
    condition     = var.max_size <= 4
    error_message = "The maximum size must be at most 4."
  }
}