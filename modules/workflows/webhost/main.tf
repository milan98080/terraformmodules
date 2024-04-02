module "bucket" {
    source = "../../services/s3"
    bucket_name = var.domain
    source_path = var.source_path
}

module "cloudfront" {
    source = "../../services/cloudfront"
    bucket_domain_name = module.bucket.bucket_domain_name
    bucket_name = module.bucket.bucket_name
    bucket_origin_id = module.bucket.bucket_origin_id
    distribution_name = var.domain
}

module "cloudflare" {
    source = "../../services/cloudflare"
    zone = var.domain
    distribution_domain_name = module.cloudfront.distribution_domain_name
}