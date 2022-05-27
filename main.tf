# https://github.com/aws-ia/terraform-aws-eks-blueprints


provider "aws" {
  version                  = ">= 3.72"
  region                   = var.region
  profile                  = var.profile
  shared_credentials_files = [var.shared_credentials_files]

}


data "aws_availability_zones" "available" {}


terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
  }
}


locals {
  environment = var.environment # Environment area eg., preprod or prod
  zone        = var.zone        # Environment with in one sub_tenant or business unit
  region      = var.region
  profile     = var.profile

  vpc_cidr      = var.vpc_cidr
  vpc_name      = var.vpc_name
  azs           = var.azs
  cluster_name  = var.cluster_name
  name          = basename(path.cwd)

  #terraform_version = "Terraform v1.0.1"

  # Add merge statement into the various resources to use this + whats required locally.
  tags = {
    team        = var.team,
    project     = var.project,
    Blueprint   = local.name
    GithubRepo  = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }

}
