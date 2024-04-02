module "bucket" {
    source = "../../services/s3"
    bucket_name = var.bucket_name
    source_path = var.source_path
}

module "cloudfront" {
    source = "../../services/cloudfront"
    bucket_domain_name = module.bucket.bucket_domain_name
    bucket_name = module.bucket.bucket_name
    bucket_origin_id = module.bucket.bucket_origin_id
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
    distribution_viewer_certificate_cloudfront_default_certificate = var.distribution_viewer_certificate_cloudfront_default_certificate
}

module "cloudflare" {
    source = "../../services/cloudflare"
    zone = var.cloudflare_zone
    distribution_domain_name = module.cloudfront.distribution_domain_name
}