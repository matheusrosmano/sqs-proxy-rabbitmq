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
  description = "SQS arn"
}

output "bucket-lambda-name" {
  value = aws_s3_bucket.sqs_lambda_state_bucket.id
  description = "Bucket name"
}