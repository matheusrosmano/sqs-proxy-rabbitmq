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

output "bucket-lambda-name" {
  value = aws_s3_bucket.sqs_lambda_state_bucket.id
  sensitive = true
  description = "Bucket name"
}