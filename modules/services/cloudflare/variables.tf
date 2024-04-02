variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "zone" {
  description = "The domain name for the Cloudflare zone"
  type        = string
}

variable "distribution_name" {
  description = "The name of the CloudFront distribution"
  type        = string
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "source_path" {
  description = "Path to the source files"
  type        = string
}