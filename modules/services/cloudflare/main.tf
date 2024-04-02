terraform {
  required_providers {
    aws= {
      source  = "hashicorp/aws"
      version = "= 5.43.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "= 4.28.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Creator   = "mee.lawn111@gmail.com"
      Project   = "Intern"
      Deletable = "Yes"
    }
  }
}

module "cloudfront" {
  source            = "../../services/cloudfront"
  distribution_name = var.distribution_name
  bucket_name       = var.bucket_name
  source_path       = var.source_path
}

data "cloudflare_zone" "zone" {
  name = var.zone
}

provider "cloudflare" {
  retries = 3
}

resource "cloudflare_record" "cname" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.zone
  type    = "CNAME"
  value   = module.cloudfront.distribution_domain_name
  proxied = true
}
