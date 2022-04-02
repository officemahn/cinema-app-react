provider "aws" {
  region     = "us-east-1"

}

terraform {
  backend "s3" {
    bucket     = "cinema-app-terraform-state-do"
    key        = "app-cinema.tfstate"
    region     = "us-east-1"
    encrypt    = true

  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "David Oladipo"
  }
}
