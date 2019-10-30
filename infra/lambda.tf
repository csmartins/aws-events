data "archive_file" "function_zip" {
    type          = "zip"
    source_file   = "../event_target/function.py"
    output_path   = "event_target.zip"
}

resource "aws_lambda_function" "event_target_handler" {
  filename         = "event_target.zip"
  function_name    = "event_target_handler"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "function.event_handler"
  source_code_hash = "${data.archive_file.function_zip.output_base64sha256}"
  runtime          = "python3.7"
}