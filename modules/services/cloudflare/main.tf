terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "= 4.28.0"
    }
  }
}

provider "cloudflare" {
  retries = 2
}

data "cloudflare_zone" "zone" {
  name = var.zone
}

resource "cloudflare_record" "cname" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.zone
  type    = "CNAME"
  value   = var.distribution_domain_name
  proxied = true
}
