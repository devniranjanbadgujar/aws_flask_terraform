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

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_ids) == 2
    error_message = "Exactly two public subnet IDs must be specified."
  }
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB."
  type        = string
}

variable "app_port" {
  description = "Port on which the application will run."
  type        = number
}

variable "health_check_path" {
  description = "Path for the health check endpoint."
  type        = string

  default = "/health"
}
