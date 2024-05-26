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
  #for_each     = fileset(path.module, "../app/static-content/**/*.{html,css,js}")
  for_each        = fileset("../app/static-content/", "*.html")
  bucket       = aws_s3_bucket.bucket.id
  key          = each.value
  #key          = "index.html"
  #source       = "../app/static-content/index.html"
  source          = "../app/static-content/${each.value}"
  content_type = "text/html"
  etag            = filemd5("../app/static-content/${each.value}")
  

}

# remote state
resource "aws_s3_bucket" "mosca-tf-state" {
  bucket = "mosca-tf-state"

}