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
        "Resource": "arn:aws:sqs:*:*:${aws_sqs_queue.sqs_proxy_rabbitmq_queue.name}",
        "Condition": {
          "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.sqs_proxy_rabbitmq_bucket.arn}" }
        }
      }
    ]
  }
  POLICY

  tags = {
    Name = "SQS para o sqs proxy rabbitmq"
    Type = "SQS"
  }
}