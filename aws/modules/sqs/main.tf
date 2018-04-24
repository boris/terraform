resource "aws_sqs_queue" "queue" {
    name = "${var.sqs_name}"
}
