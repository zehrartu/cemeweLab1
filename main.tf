#########################################################
# Lab 2 - Create S3 Bucket and Upload Local Image using Terraform
#########################################################

provider "aws" {
  region  = var.aws_region
  #profile = "cemewe"
}

#########################################################
# Create S3 bucket
#########################################################
resource "aws_s3_bucket" "lab1_bucket" {
  bucket = "lab1-${var.student_name}-bucket"

  tags = {
    Name  = "lab1-${var.student_name}"
    Owner = var.student_name
    Lab   = "1"
  }
}

#########################################################
# Allow bucket policy to make it public
#########################################################
resource "aws_s3_bucket_public_access_block" "lab1_bucket_access" {
  bucket = aws_s3_bucket.lab1_bucket.id

  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

#########################################################
# Make bucket publicly readable using a bucket policy
#########################################################
resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.lab1_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.lab1_bucket.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.lab1_bucket_access]
}

#########################################################
# Upload local image to S3 bucket (no ACL)
#########################################################
resource "aws_s3_object" "lab1_image" {
  bucket = aws_s3_bucket.lab1_bucket.id
  key    = "picture111.jpg"
  source = "picture111.jpg"
  etag   = filemd5("picture111.jpg")
}

#########################################################
# Outputs
#########################################################
output "bucket_name" {
  value = aws_s3_bucket.lab1_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.lab1_bucket.arn
}

output "image_url" {
  value = "https://${aws_s3_bucket.lab1_bucket.id}.s3.${var.aws_region}.amazonaws.com/${aws_s3_object.lab1_image.key}"
}
