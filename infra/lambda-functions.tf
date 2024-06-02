# zip file for InsertDB zip
data "archive_file" "lambdaInsertDB" {
  type        = "zip"
  source_file = "${path.module}/../app/lambda/insertDB/index.js"
  output_path = "insertDB.zip"
}

// lambdaInsertDB lambda
resource "aws_lambda_function" "insertDB" {
  filename      = "insertDB.zip"
  function_name = "insertDB"
  role          = "arn:aws:iam::784488449591:role/service-role/insertDB-role-f24q2iu4"
  handler       = "index.handler"
  source_code_hash = data.archive_file.lambdaInsertDB.output_base64sha256
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

// zip file for helloworld lambda
data "archive_file" "helloworld" {
  type        = "zip"
  source_file = "${path.module}/../app/lambda/helloworld/index.js"
  output_path = "helloworld.zip"
}

// helloworld lambda
resource "aws_lambda_function" "helloworld" {
 filename      = "helloworld.zip"
 function_name = "helloworld"
 role          = "arn:aws:iam::784488449591:role/service-role/insertDB-role-f24q2iu4"
 handler       = "index.handler"
 source_code_hash = data.archive_file.helloworld.output_base64sha256 
 runtime          = "nodejs16.x"
 ephemeral_storage {
   size = 512
 }
 architectures = ["x86_64"]
 logging_config {
   log_format       = "JSON"
   log_group        = "/aws/lambda/helloworld"
   system_log_level = "DEBUG"
 }
 memory_size = 128
 package_type = "Zip"
 tags = {
   Env          = "dev"
   "Managed by" = "Terraform"
 }


}
// zip file for lambda_get
data "archive_file" "lambda_get" {
  type        = "zip"
  source_file = "${path.module}/../app/lambda/get_from_db/index.js"
  output_path = "get_from_db.zip"
}

// lambda get_from_db
resource "aws_lambda_function" "lambda_get" {
 filename      = "get_from_db.zip"
 function_name = "lambda_get"
 role          = "arn:aws:iam::784488449591:role/service-role/insertDB-role-f24q2iu4"
 handler       = "index.handler"
 source_code_hash = data.archive_file.lambda_get.output_base64sha256 
 runtime          = "nodejs16.x"
 ephemeral_storage {
   size = 512
 }
 architectures = ["x86_64"]
 logging_config {
   log_format       = "JSON"
   log_group        = "/aws/lambda/lambda_get"
   system_log_level = "DEBUG"
 }
 memory_size = 128
 package_type = "Zip"
 tags = {
   Env          = "dev"
   "Managed by" = "Terraform"
 }
}