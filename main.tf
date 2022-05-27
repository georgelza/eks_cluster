# https://github.com/aws-ia/terraform-aws-eks-blueprints

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

provider "aws" {
  version                  = ">= 3.72"
  region                   = var.region
  profile                  = var.profile
  shared_credentials_files = [var.shared_credentials_files]

}


provider "kubernetes" {
  host                   = module.eks_blueprints.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks_blueprints.eks_cluster_id]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_blueprints.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", module.eks_blueprints.eks_cluster_id]
    }
  }
}

data "aws_availability_zones" "available" {}

locals {
  environment = var.environment # Environment area eg., preprod or prod
  zone        = var.zone        # Environment with in one sub_tenant or business unit
  region      = var.region
  profile     = var.profile

  vpc_cidr     = var.vpc_cidr
  vpc_name     = var.vpc_name
  azs          = var.azs
  cluster_name = var.cluster_name

  #terraform_version = "Terraform v1.0.1"

  # Add merge statement into the various resources to use this + whats required locally.
  tags = {
    team    = var.team,
    project = var.project,
  }

}

