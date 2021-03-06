resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy" "lambda_execution_role" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_iam_policy" "lambda_vpc_execution_role" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_policy_attachment" "attach-execution-role" {
  name       = "execution-role-to-lambda"
  roles      = ["${aws_iam_role.iam_for_lambda.name}"]
  policy_arn = "${data.aws_iam_policy.lambda_execution_role.arn}"
}

resource "aws_iam_policy_attachment" "attach-vpc-execution-role" {
  name       = "execution-role-to-lambda"
  roles      = ["${aws_iam_role.iam_for_lambda.name}"]
  policy_arn = "${data.aws_iam_policy.lambda_vpc_execution_role.arn}"
}