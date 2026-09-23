output "launch_template_id" {
  description = "Application launch template ID."
  value       = aws_launch_template.app.id
}

output "autoscaling_group_name" {
  description = "Application Auto Scaling Group name."
  value       = aws_autoscaling_group.app.name
}

output "autoscaling_group_arn" {
  description = "Application Auto Scaling Group ARN."
  value       = aws_autoscaling_group.app.arn
}

output "iam_role_name" {
  description = "EC2 IAM role name."
  value       = aws_iam_role.ec2.name
}