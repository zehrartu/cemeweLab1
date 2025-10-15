#########################################################
# Lab 2 - Create S3 Bucket and Upload Local Image using Terraform
#########################################################

provider "aws" {
  region = var.aws_region
  # profile = "cemewe"  # Uncomment if using named profile
}

#########################################################
# Create S3 bucket
#########################################################
resource "aws_s3_bucket" "lab1_bucket" {
  bucket = "lab1-${var.student_name}-bucket"  # unique bucket name

  tags = {
    Name  = "lab1-${var.student_name}"
    Owner = var.student_name
    Lab   = "1"
  }
}

#########################################################
# Upload local image to S3 bucket
#########################################################
resource "aws_s3_object" "lab1_image" {
  bucket = aws_s3_bucket.lab1_bucket.id   # use .id instead of .bucket
  key    = "picture111.jpg"
  source = "picture111.jpg"
  acl    = "public-read"
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