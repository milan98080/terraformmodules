terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "webhost" {
  source = var.data_source
  bucket_name = var.bucket_name
  source_path = var.source_path
  distribution_name = var.distribution_name
  distribution_enabled = var.distribution_enabled
  distribution_default_root_object = var.distribution_default_root_object
  distribution_restriction_type = var.distribution_restriction_type
  distribution_geo_restriction_locations = var.distribution_geo_restriction_locations
  distribution_allowed_methods = var.distribution_allowed_methods
  distribution_cached_methods = var.distribution_cached_methods
  distribution_viewer_protocol_policy = var.distribution_viewer_protocol_policy
  distribution_forwarded_values_query_string = var.distribution_forwarded_values_query_string
  distribution_forwarded_values_cookies_forward = var.distribution_forwarded_values_cookies_forward
  cloudflare_zone = var.cloudflare_zone
  distribution_viewer_certificate_cloudfront_default_certificate = var.distribution_viewer_certificate_cloudfront_default_certificate
}