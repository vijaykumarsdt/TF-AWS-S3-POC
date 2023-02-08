
####    RESOURCE NAME     #######

resource "aws_s3_bucket" "live-timer-website" {
  bucket = "my-live-timer-website"

  tags = {
    "Tag-1" = "Tag-1"
    "Tag-2" = "Tag-2"
  }
}

resource "aws_s3_object" "live-timer" {
  bucket       = aws_s3_bucket.live-timer-website.bucket
  key          = "LiveDateandTime.html"
  source       = "D:/DevOps/Live date and time html/LiveDateandTime.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_versioning" "enable-bucket-version" {
  bucket = aws_s3_bucket.live-timer-website.id
  versioning_configuration {
    status = "Suspended" #Suspended  #Enabled
  }
}

resource "aws_s3_bucket_metric" "metric" {
  bucket = aws_s3_bucket.live-timer-website.bucket
  name   = "ImportantBlueDocuments"

  filter {
    prefix = "documents/"

    tags = {
      priority = "high"
      class    = "blue"
    }
  }



}


####     RESOURCE POLICY  ######
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.live-timer-website.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "s3:GetObject",
        Effect    = "Allow",
        Principal = "*",
        Resource  = "${aws_s3_bucket.live-timer-website.arn}/*",
        Sid       = "PublicReadGetObject"
      }
    ]
  })
}