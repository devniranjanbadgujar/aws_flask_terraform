variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "Exactly two availability zones must be specified."
  }
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Exactly two public subnet CIDRs are required."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "Exactly two private subnet CIDRs are required."
  }
}

variable "app_port" {

  description = "port on which the flask application listens"
  type        = number

  default = 5000

  validation {
    condition     = var.app_port > 0 && var.app_port <= 65535
    error_message = "app_port must be between 1 and 65535."
  }
}

variable "health_check_path" {
  description = "HTTP path used by the ALB to check application health."
  type        = string

  default = "/health"
}

variable "instance_type" {
  description = "EC2 instance type for Flask application instances."
  type        = string

  default = "t3.micro"
}

variable "desired_capacity" {
  description = "Desired number of application instances."
  type        = number

  default = 2
}

variable "min_size" {
  description = "Minimum number of application instances."
  type        = number

  default = 2
}

variable "max_size" {
  description = "Maximum number of application instances."
  type        = number

  default = 4
}