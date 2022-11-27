resource "aws_sqs_queue" "sqs_proxy_rabbitmq_queue" {
  name = "${var.preFixName}-queue"
  sqs_managed_sse_enabled = true
  visibility_timeout_seconds = 60

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "sqs:SendMessage",
        "Resource": "arn:aws:sqs:*:*:${var.preFixName}-queue",
        "Condition": {
          "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.sqs_proxy_rabbitmq_bucket.arn}" }
        }
      }
    ]
  }
  POLICY

  depends_on = [
    aws_s3_bucket.sqs_proxy_rabbitmq_bucket,
    aws_s3_bucket_server_side_encryption_configuration.sqs_proxy_rabbitmq_bucket_encryption,
    aws_s3_bucket_versioning.sqs_proxy_rabbitmq_bucket_versioning,
  ]

  tags = {
    Name = "SQS para o sqs proxy rabbitmq"
    Type = "SQS"
  }
}