variable "aws_profile" {
  description = "AWS Profile"
  type        = string
  default     = "milanpokhrel"
}

variable "domain_name" {
  description = "The domain name for the Cloudflare zone"
  type        = string
  default     = "letslearnify.me"
}

variable "distribution_name" {
  description = "The name of the CloudFront distribution"
  type        = string
  default     = "milan-cdn-tf-lf"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "milan-s3-tf-lf"
}

variable "source_path" {
  description = "Path to the source files"
  type        = string
  default     = "/home/milan/Documents/Leapfrog/FullStackToDo/frontend/dist"
}