// Insert Lambda - zip file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../app/lambda1.js"
  output_path = "../app/lambda1.zip"
}


// Insert Lambda
resource "aws_lambda_function" "HelloWorldFunction" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "../app/lambda1.js"
  function_name = "HelloWorldFunction"
  role          = "arn:aws:iam::784488449591:role/service-role/HelloWorldFunction-role-whmhi9c5"
  handler       = "index.handler"

  source_code_hash = "g5wmtk3jCMfUcrXvhucwGkuHMWzk7htwWX2CJQMmMZw="

  runtime = "nodejs16.x"

  tags = {
    Env = "DEV"
    Managedby = "Terraform"
  }

  
}