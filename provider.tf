terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    hostname     = "tharani.scalr.io"
    organization = "tharani"

    workspaces {
      name = "newworkspace"
    }
  }
}

provider "aws" {
  region = var.aws_region_out
}
