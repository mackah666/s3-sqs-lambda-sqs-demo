variable "sqs_queue_arn" {}

module "aws_sqs" {
  sqs_queue_arn = "${module.sqs_queue_arn}"
  source = "./aws_sqs"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "mackah-s3-terraform-bucket"

  queue {
    queue_arn     = var.sqs_queue_arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".*"
  }
}
