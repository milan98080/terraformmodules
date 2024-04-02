resource "cloudflare_record" "cname" {
  zone_id = data.cloudflare_zone.zone.id
  name    = var.zone
  type    = "CNAME"
  value   = var.distribution_domain_name
  proxied = true
}
