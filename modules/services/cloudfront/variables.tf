variable "distribution_name" {
  description = "CloudFront Distribution Name"
  type        = string
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "bucket_domain_name" {
  description = "S3 Bucket Domain Name"
  type        = string
}

variable "bucket_origin_id" {
  description = "S3 Bucket Origin ID"
  type        = string
}

variable "distribution_enabled" {
  description = "Enable the distribution"
  type        = bool
}

variable "distribution_default_root_object" {
  description = "The default root object"
  type        = string
}

variable "distribution_restriction_type" {
  description = "The restriction type"
  type        = string
}

variable "distribution_geo_restriction_locations" {
  description = "The restriction locations"
  type        = list(string)
}

variable "distribution_allowed_methods" {
  description = "The allowed methods"
  type        = list(string)
}

variable "distribution_cached_methods" {
  description = "The cached methods"
  type        = list(string)
}

variable "distribution_viewer_protocol_policy" {
  description = "The viewer protocol policy"
  type        = string
}

variable "distribution_forwarded_values_query_string" {
  description = "The forwarded values query string"
  type        = bool
}

variable "distribution_forwarded_values_cookies_forward" {
  description = "The forwarded values cookies forward"
  type        = string
}

variable "distribution_viewer_certificate_cloudfront_default_certificate" {
  description = "The viewer certificate cloudfront default certificate"
  type        = bool
}