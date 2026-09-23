output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer."
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer."
  value       = module.alb.alb_arn
}

output "target_group_arn" {
  description = "ARN of the application target group."
  value       = module.alb.target_group_arn
}

output "autoscaling_group_name" {
  description = "Application Auto Scaling Group name."
  value       = module.application.autoscaling_group_name
}

output "launch_template_id" {
  description = "Application launch template ID."
  value       = module.application.launch_template_id
}