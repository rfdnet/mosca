

// Insert Lambda
resource "aws_lambda_function" "insertDB" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "../app/insertDB.js"
  function_name = "insertDB"
  role          = "arn:aws:iam::784488449591:role/service-role/insertDB-role-f24q2iu4"
  handler       = "index.handler"

  #//source_code_hash = base64sha256(file("../app/lambda1.js"))
  source_code_hash = "cXs/p83uKVGC3g8hZBwNylQag7lUAKaN+fgkdlBxHMA="
  runtime          = "nodejs16.x"
  ephemeral_storage {
    size = 512
  }
  architectures = ["x86_64"]

  logging_config {
    log_format       = "JSON"
    log_group        = "/aws/lambda/insertDB"
    system_log_level = "DEBUG"
  }

  memory_size = 128

  package_type = "Zip"



  tags = {
    Env          = "dev"
    "Managed by" = "Terraform"
  }


}