resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_object" "content" {
  bucket                 = aws_s3_bucket.bucket.bucket
  for_each               = fileset("${var.source_path}", "**/*")
  key                    = each.value
  source                 = "${var.source_path}/${each.value}"
  server_side_encryption = "AES256"
  content_type           = each.value
}