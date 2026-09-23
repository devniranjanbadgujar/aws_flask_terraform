output "alb_id" {
  description = "Application Load Balancer ID."
  value       = aws_lb.this.id
}

output "alb_arn" {
  description = "Application Load Balancer ARN."
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer."
  value       = aws_lb.this.dns_name
}

output "target_group_id" {
  description = "Application target group ID."
  value       = aws_lb_target_group.app.id
}

output "target_group_arn" {
  description = "Application target group ARN."
  value       = aws_lb_target_group.app.arn
}

output "listener_arn" {
  description = "HTTP listener ARN."
  value       = aws_lb_listener.http.arn
}