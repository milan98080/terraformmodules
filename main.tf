terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "cloudflare" {
  source            = "./modules/services/cloudflare"
  zone              = var.domain_name
  distribution_name = var.distribution_name
  bucket_name       = var.bucket_name
  source_path       = var.source_path
}