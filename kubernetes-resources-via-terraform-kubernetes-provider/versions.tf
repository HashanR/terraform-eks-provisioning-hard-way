# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7"
    }
  }

  backend "s3" {
    bucket = "hashanr-terraform-on-aws-eks"
    key    = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-app1k8s"
  }
}
