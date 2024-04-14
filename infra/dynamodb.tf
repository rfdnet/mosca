resource "aws_dynamodb_table" "HelloWorldDatabase" {
  name           = "HelloWorldDatabase"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "ID"
  range_key      = "Surname"

  attribute {
    name = "ID"
    type = "S"
  }

  attribute {
    name = "Surname"
    type = "S"
  }

  ttl {
    attribute_name = ""
    enabled        = false
  }

  tags = {
    "env" = "dev"
  }


}