
##### static contentt #####
resource "aws_s3_bucket" "bucket" {
  bucket        = "mosca-static-content"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "webapp" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "object" {
  bucket       = aws_s3_bucket.bucket.id
  key          = "index.html"
  source       = "../app/index.html"
  content_type = "text/html"


}

# remote state
resource "aws_s3_bucket" "mosca-tf-state" {
  bucket = "mosca-tf-state"

}