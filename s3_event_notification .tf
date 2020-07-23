resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "mackah-s3-terraform-bucket"

  queue {
    queue_arn     = "${sqs_queue.arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".*"
  }
}