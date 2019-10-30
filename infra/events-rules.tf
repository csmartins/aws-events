resource "aws_cloudwatch_event_rule" "ec2" {
  name        = "capture-aws-ec2-events"
  description = "Capture any AWS EC2 events"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule      = "${aws_cloudwatch_event_rule.ec2.name}"
  target_id = "SendToLambda"
  arn       = "${aws_lambda_function.event_target.arn}"
}