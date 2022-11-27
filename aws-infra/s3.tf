# Cria o bucket
resource "aws_s3_bucket" "sqs_proxy_rabbitmq_bucket" {
  bucket = "${var.preFixName}-bucket"

  tags = {
    Name = "S3 do rabbitmq notification"
    Type = "S3"
  }
}

# Enable version files in the bucket
resource "aws_s3_bucket_versioning" "sqs_proxy_rabbitmq_bucket_versioning" {
  bucket = aws_s3_bucket.sqs_proxy_rabbitmq_bucket.id

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.sqs_proxy_rabbitmq_bucket
  ]
}

# Enable encryption default in the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "sqs_proxy_rabbitmq_bucket_encryption" {
  bucket = aws_s3_bucket.sqs_proxy_rabbitmq_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  depends_on = [
    aws_s3_bucket.sqs_proxy_rabbitmq_bucket
  ]
}