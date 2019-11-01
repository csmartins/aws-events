data "archive_file" "function_zip" {
    type          = "zip"
    source_dir   = "../event_target/"
    output_path   = "event_target.zip"
}

resource "aws_lambda_function" "event_target" {
  filename         = "event_target.zip"
  function_name    = "event_target"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "function.event_handler"
  source_code_hash = "${data.archive_file.function_zip.output_base64sha256}"
  runtime          = "python3.7"
  timeout          = 60

  environment = {
    variables = {
      MONGO_USER = "${var.mongouser}"
      MONGO_PASSWORD = "${var.mongopassword}"
      MONGO_ENDPOINT = "${var.mongoendpoint}"
      MONGO_PORT = "${var.mongoport}"
    }
  }

  vpc_config {
    subnet_ids         = ["subnet-f9d6cc80", "subnet-1846b345", "subnet-7c690557", "subnet-9e0d0ad5"]
    security_group_ids = ["sg-651c4227"]
  }
}