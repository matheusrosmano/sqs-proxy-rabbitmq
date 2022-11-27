resource "aws_sqs_queue" "sqs_proxy_rabbitmq_queue" {
  name = "${var.preFixName}-queue"
  sqs_managed_sse_enabled = true
  visibility_timeout_seconds = 60

  tags = {
    Name = "SQS para o sqs proxy rabbitmq"
    Type = "SQS"
  }
}