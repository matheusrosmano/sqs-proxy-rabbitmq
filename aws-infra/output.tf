output "private_subnets" {
  description = "VPC private subnets"
  value = module.vpc.private_subnets
  sensitive = true
}

output "private_subnets_cidr" {
  description = "CIDR private subnets"
  value = module.vpc.private_subnets_cidr_blocks
}

output "vpc_id" {
  description = "VPC id"
  value = module.vpc.vpc_id
  sensitive = true
}

output "sqs-arn" {
  value = aws_sqs_queue.sqs_proxy_rabbitmq_queue.arn
  sensitive = true
  description = "SQS arn"
}