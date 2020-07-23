resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "mackah-s3-terraform-bucket"

  queue {
    queue_arn     = "${aws_sqs_queue.queue.arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}