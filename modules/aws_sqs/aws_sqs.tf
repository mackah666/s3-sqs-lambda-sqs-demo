resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform-mackah-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
#   redrive_policy = jsonencode({
#     deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
#     maxReceiveCount     = 4
#   })

  tags = {
    Environment = "devlopment"
  }
}
output "sqs_queue_arn" {
  value       = "${aws_sqs_queue.terraform_queue.arn}"
  description = "The Id of the security group created."
}
