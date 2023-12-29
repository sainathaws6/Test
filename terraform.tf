provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "Test"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.my_bucket.Test
  key    = "index.html"
  acl    = "public-read"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website" "static_website" {
  bucket = aws_s3_bucket.my_bucket.Test
  index_document = "index.html"
}

output "website_url" {
  value = aws_s3_bucket.my_bucket.website_domain
}