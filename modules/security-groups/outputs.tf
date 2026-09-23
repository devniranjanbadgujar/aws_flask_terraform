output "alb_security_group_id" {
  description = "Security group ID attached to the ALB."
  value       = aws_security_group.alb.id
}

output "application_security_group_id" {
  description = "Security group ID attached to application instances."
  value       = aws_security_group.app.id
}