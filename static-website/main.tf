provider "aws" {
  region = "us-east-1" 
}

terraform {
  backend "s3" {
    bucket         = "devopb4"   # Ensure this bucket exists
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "static_website" {
  bucket = "my-static-website-bucket-chandrika" 
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_website.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-static-website-bucket-chandrika/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.static_website.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.static_website.id
  key    = "index.html"
  source = "index.html" # Ensure this file exists in your working directory
  content_type = "text/html"
  acl    = "public-read"
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}
