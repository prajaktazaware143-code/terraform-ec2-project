# Create S3 Bucket
resource "aws_s3_bucket" "bucket18" {
  bucket = "prajakta-terraform-bucket-2026-00"

  tags = {
    Name = "terra_bucket"
  }
}

# Allow Public Access (Important)
resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.bucket18.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Enable Static Website Hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket18.id

  index_document {
    suffix = "index.html"
  }
}

# Upload index.html to S3
resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.bucket18.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
  etag   = filemd5("index.html")
}

# Bucket Policy (Public Read Access)
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bucket18.id

  depends_on = [aws_s3_bucket_public_access_block.public]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.bucket18.arn}/*"
      }
    ]
  })
}