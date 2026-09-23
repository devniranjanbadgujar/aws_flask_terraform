output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "VPC CIDR block."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "public_subnet_cidrs" {
  description = "Public subnet CIDRs."
  value       = aws_subnet.public[*].cidr_block
}

output "private_subnet_cidrs" {
  description = "Private subnet CIDRs."
  value       = aws_subnet.private[*].cidr_block
}

output "internet_gateway_id" {
  description = "Internet gateway ID."
  value       = aws_internet_gateway.this.id
}

output "public_route_table_id" {
  description = "Public route table ID."
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  value       = aws_route_table.private[*].id
  description = "Private route table IDs."
}

output "nat_gateway_ids" {
  value       = aws_nat_gateway.this[*].id
  description = "NAT Gateway IDs."
}

output "nat_gateway_eip_ids" {
  value       = aws_eip.nat[*].id
  description = "NAT Gateway Elastic IP IDs."
}

output "s3_vpc_endpoint_id" {
  value       = aws_vpc_endpoint.s3.id
  description = "S3 VPC Endpoint ID."
}
