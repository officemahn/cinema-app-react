######################
# S3 RESOURCES
######################


resource "aws_s3_bucket" "cinema_app_s3_bucket" {
  bucket = "${local.prefix}-app"
  force_destroy = true
  tags = local.common_tags

}

resource "aws_s3_bucket_acl" "cinema_app_s3_bucket" {
  bucket = "${local.prefix}-app"
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "cinema_app_s3_bucket" {
  bucket = "${local.prefix}-app"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "cinema_app_s3_bucket" {
  bucket = "${local.prefix}-app"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "cinema_app_s3_bucket" {
  bucket = "${local.prefix}-app"
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect = "Allow"
    actions = ["s3:GetObject",]
    resources = ["arn:aws:s3:::${local.prefix}-app/*",]
  }
}