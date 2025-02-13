output "s3_static_website_url" {
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
  description = "The URL of the static website hosted on S3"
}

