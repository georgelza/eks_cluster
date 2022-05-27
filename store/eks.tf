
# https://github.com/aws-ia/terraform-aws-eks-blueprints


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


#---------------------------------------------------------------
# EKS Blueprints - Example to consume eks_blueprints module
#---------------------------------------------------------------
module "eks_blueprints" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.0.2"

  # EKS CLUSTER
  cluster_name    = local.cluster_name
  cluster_version = "1.21"
  vpc_id          = aws_vpc.main.id


  private_subnet_ids = [
    # APP EKS
    aws_subnet.private_4.id, # 10.7.24.0/24
    aws_subnet.private_5.id, # 10.7.25.0/24
    aws_subnet.private_6.id, # 10.7.26.0/24
  ]

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,

  )

  # EKS MANAGED NODE GROUPS
  managed_node_groups = {
    mg_m5 = {
      node_group_name = "managed-ondemand"
      instance_types  = ["t3.small"]
      subnet_ids      = [aws_subnet.private_4.id, aws_subnet.private_5.id, aws_subnet.private_6.id]
    }
  }
}


module "eks_blueprints_kubernetes_addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.0.2"

  eks_cluster_id = module.eks_blueprints.eks_cluster_id

  # EKS Addons
  enable_amazon_eks_vpc_cni            = true
  enable_amazon_eks_coredns            = true
  enable_amazon_eks_kube_proxy         = true
  enable_amazon_eks_aws_ebs_csi_driver = true

  #K8s Add-ons
  enable_aws_load_balancer_controller = true
  enable_cluster_autoscaler           = false
  enable_metrics_server               = false
  enable_prometheus                   = false
  enable_argocd                       = false
  enable_aws_for_fluentbit            = false

  tags = local.tags
  depends_on = [module.eks_blueprints.managed_node_groups]

}