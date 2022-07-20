terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "hashanr-terraform-on-aws-eks"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-ekscluster"
  }

}

# Provider Block
provider "aws" {
  region = var.aws_region
}
