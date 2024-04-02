terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.43.0"
    }
  }
}

module "bucket" {
  source      = "../s3"
  bucket_name = var.bucket_name
  source_path = var.source_path
}

resource "aws_cloudfront_distribution" "distribution" {

  origin {
    domain_name              = module.bucket.bucket_domain_name
    origin_id                = module.bucket.bucket_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.Site_Access.id
  }

  enabled             = var.distribution_enabled
  default_root_object = var.distribution_default_root_object

  restrictions {
    geo_restriction {
      restriction_type = var.distribution_restriction_type
      locations        = var.distribution_geo_restriction_locations
    }
  }

  default_cache_behavior {
    allowed_methods        = var.distribution_allowed_methods
    cached_methods         = var.distribution_cached_methods
    target_origin_id       = module.bucket.bucket_origin_id
    viewer_protocol_policy = var.distribution_viewer_protocol_policy

    forwarded_values {
      query_string = var.distribution_forwarded_values_query_string

      cookies {
        forward = var.distribution_forwarded_values_cookies_forward
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.distribution_viewer_certificate_cloudfront_default_certificate
  }

  tags = {
    Name = var.distribution_name
  }

}

resource "aws_cloudfront_origin_access_control" "Site_Access" {
  name                              = "Security_Pillar100_CF_S3_OAC"
  description                       = "OAC setup for security pillar 100"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

## Assign policy to allow CloudFront to reach S3 bucket
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = module.bucket.bucket_origin_id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

## Create policy to allow CloudFront to reach S3 bucket
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "3"
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["cloudfront.amazonaws.com"]
      type        = "Service"
    }
    resources = [
      "arn:aws:s3:::${module.bucket.bucket_name}/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"

      values = [
        aws_cloudfront_distribution.distribution.arn
      ]
    }
  }
}
