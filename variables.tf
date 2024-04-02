variable "data_source" {
  description = "The source of the data"
  type = string
  default = "terraform-aws-modules/s3-bucket/aws"
}

variable "bucket_name" {
  description = "The name of the bucket"
  type = string
  default = "my-bucket"
}

variable "source_path" {
  description = "The path to the source"
  type = string
  default = "webhost"
}

variable "distribution_name" {
  description = "The name of the distribution"
  type = string
  default = "my-distribution"
}

variable "distribution_enabled" {
  description = "Whether the distribution is enabled"
  type = bool
  default = true
}

variable "distribution_default_root_object" {
  description = "The default root object"
  type = string
  default = "index.html"
}

variable "distribution_restriction_type" {
  description = "The type of restriction"
  type = string
  default = "none"
}

variable "distribution_geo_restriction_locations" {
  description = "The locations for geo restriction"
  type = list(string)
  default = []
}

variable "distribution_allowed_methods" {
  description = "The allowed methods"
  type = list(string)
  default = ["GET", "HEAD"]
}

variable "distribution_cached_methods" {
  description = "The cached methods"
  type = list(string)
  default = ["GET", "HEAD"]
}

variable "distribution_viewer_protocol_policy" {
  description = "The viewer protocol policy"
  type = string
  default = "redirect-to-https"
}

variable "distribution_forwarded_values_query_string" {
  description = "Whether to forward query strings"
  type = bool
  default = false
}

variable "distribution_forwarded_values_cookies_forward" {
  description = "Whether to forward cookies"
  type = bool
  default = false
}

variable "cloudflare_zone" {
  description = "The Cloudflare zone"
  type = string
  default = "example.com"
}

variable "distribution_viewer_certificate_cloudfront_default_certificate" {
  description = "Whether to use the CloudFront default certificate"
  type = bool
  default = true
}