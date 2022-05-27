
# https://github.com/aws-ia/terraform-aws-eks-blueprints


#---------------------------------------------------------------
# Example to consume eks_blueprints module
#---------------------------------------------------------------
module "eks_blueprints" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints"
  #source = "../.."  # pointing to a local copy

#  tenant      = local.profile     # aws/credentials profile
#  environment = local.environment # Environment area, e.g. prod or preprod
#  zone        = local.zone        # zone, e.g. dev or qa or load or ops etc.
  vpc_id      = aws_vpc.main.id
  #terraform_version = local.terraform_version

  # EKS CONTROL PLANE VARIABLES
  cluster_name    = local.cluster_name
  cluster_version = "1.21"

  public_subnet_ids = [
    # Web
    aws_subnet.public_1.id, # 10.7.11.0/24
    aws_subnet.public_2.id, # 10.7.12.0/24
    aws_subnet.public_3.id, # 10.7.13.0/24
  ]

  private_subnet_ids = [
    # APP EKS
    aws_subnet.private_4.id, # 10.7.24.0/24
    aws_subnet.private_5.id, # 10.7.25.0/24
    aws_subnet.private_6.id, # 10.7.26.0/24
    # DB EKS
    aws_subnet.private_10.id, # 10.7.34.0/24
    aws_subnet.private_11.id, # 10.7.35.0/24
    aws_subnet.private_12.id, # 10.7.36.0/24
    # Management EKS
    aws_subnet.private_16.id, # 10.7.44.0/24
    aws_subnet.private_17.id, # 10.7.45.0/24
    aws_subnet.private_18.id, # 10.7.46.0/24
  ]

  # A map of tags to assign to the resource.
  tags = merge(
    local.tags,

  )

  ############################
  # EKS MANAGED NODE GROUPS
  ############################

  managed_node_groups = {

    # app_ng
    app_ng = {
      node_group_name = "app_ng"
      instance_types  = ["t3.medium"]
      ami_type        = "AL2_x86_64" # Available options -> AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM

      desired_size = 3 # Node Group scaling configuration
      max_size     = 9
      min_size     = 3

      capacity_type = "ON_DEMAND" # ON_DEMAND or SPOT
      disk_size     = 20          # Disk size in GiB for worker nodes

      # Node Group network configuration
      subnet_ids = [
        # APP EKS
        aws_subnet.private_4.id, # 10.7.24.0/24
        aws_subnet.private_5.id, # 10.7.25.0/24
        aws_subnet.private_6.id, # 10.7.26.0/24
      ]

      # Node Labels can be applied through EKS API or through Bootstrap script using kubelet_extra_args
      k8s_labels = {
        tier = "app"
      }

      # SSH ACCESS Optional - Recommended to use SSM Session manager
      #      remote_access         = true
      #      ec2_ssh_key           = aws_key_pair.my-pub-key.id
      #      ssh_security_group_id = [aws_security_group.sg_management_ssh.id]

      # A map of tags to assign to the resource.
      additional_tags = merge(
        local.tags,
        {
          subnet_type = "private"

        },
      )
    },


    db_ng = {
      node_group_name = "db_ng"
      instance_types  = ["t3.large"]
      ami_type        = "AL2_x86_64" # Available options -> AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM

      desired_size = 6 # Node Group scaling configuration
      max_size     = 12
      min_size     = 6

      capacity_type = "ON_DEMAND" # ON_DEMAND or SPOT
      disk_size     = 20          # Disk size in GiB for worker nodes

      # Node Group network configuration
      subnet_ids = [
        # APP EKS
        aws_subnet.private_10.id, # 10.7.34.0/24
        aws_subnet.private_11.id, # 10.7.35.0/24
        aws_subnet.private_12.id, # 10.7.36.0/24
      ]

      # Node Labels can be applied through EKS API or through Bootstrap script using kubelet_extra_args
      k8s_labels = {
        tier = "db"
      }

      # SSH ACCESS Optional - Recommended to use SSM Session manager
      #      remote_access         = true
      #      ec2_ssh_key           = aws_key_pair.my-pub-key.id
      #      ssh_security_group_id = [aws_security_group.sg_management_ssh.id]

      # A map of tags to assign to the resource.
      additional_tags = merge(
        local.tags,
        {
          subnet_type = "private"

        },
      )
    }
    # man_ng

  }
}

module "eks_blueprints_kubernetes_addons" {
  #source = "../.."   # pointing to local copy
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons"

  eks_cluster_id               = module.eks_blueprints.eks_cluster_id
  eks_worker_security_group_id = module.eks_blueprints.worker_node_security_group_id
  auto_scaling_group_names     = module.eks_blueprints.self_managed_node_group_autoscaling_groups
  depends_on                   = [module.eks_blueprints.managed_node_groups]

  # EKS Managed Add-ons
  enable_amazon_eks_vpc_cni            = true
  enable_amazon_eks_coredns            = true
  enable_amazon_eks_kube_proxy         = true
  enable_amazon_eks_aws_ebs_csi_driver = true

  enable_aws_load_balancer_controller = true
  enable_ingress_nginx                = true
  enable_cluster_autoscaler           = true

  enable_metrics_server         = false
  enable_prometheus             = false
  enable_aws_cloudwatch_metrics = false

}


output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = module.eks_blueprints.configure_kubectl
}


output "eks_managed_nodegroups" {
  description = "EKS managed node groups"
  value       = module.eks_blueprints.managed_node_groups
}