output "bucket-name" {
  value = aws_s3_bucket.live-timer-website.id
}

output "bucket-contenttype" {
  value = aws_s3_object.live-timer.content_type
}

output "language" {
  value = aws_s3_object.live-timer.content_language
}

output "tags" {
  value = aws_s3_object.live-timer.tags_all

}

output "website-redirect" {
  value = aws_s3_object.live-timer.website_redirect
}

output "base64" {
  value = aws_s3_object.live-timer.content_base64

}

output "web" {
  value = aws_s3_bucket.live-timer-website.bucket_domain_name
}

output "region" {
  value = aws_s3_bucket.live-timer-website.region
}

output "accesspoint" {
  value = aws_s3_object.live-timer.bucket_key_enabled
}