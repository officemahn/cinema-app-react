######################
# S3 RESOURCES
######################


resource "aws_s3_bucket" "cinema_app_s3_bucket" {
  bucket        = "${local.prefix}-app"
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

# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = "${local.prefix}-app"
#    policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement":  [
#         {
#             "Sid": "PublicReadGetObject",
#             "Action": [
#                 "s3:GetObject"
#             ],
#             "Effect": "Allow",
#             "Resource": "arn:aws:s3:::${local.prefix}-app/*",
#             "Pricipal": "*"
#         }
#     ]
# }

#     EOF
# }