

###### Authentification 

variable "profile" {
  default     = "devlab"
  description = "AWS profile to be used used, configured using aws configure --porfile <profile name>"
}

variable "shared_credentials_files" {
  default     = "~/.aws/credentials"
  description = "AWS credential file, populated by above"
}

###### VPC
variable "region" {
  default     = "af-south-1"
  description = "AWS region"
}

variable "azs" {
  default     = ["af-south-1a", "af-south-1b", "af-south-1c", ]
  description = "AWS region"
}

variable "vpc_name" {
  default     = "george-iamza-lab-VPC"
  description = "VPC Name"
}

variable "vpc_cidr" {
  default     = "10.7.0.0/16"
  description = "My VPC CIDR lock"
}

###### Project

variable "environment" {
  type        = string
  default     = "preprod"
  description = "Environment area, e.g. prod or preprod "
}

variable "zone" {
  type        = string
  description = "zone, e.g. dev or qa or load or ops etc..."
  default     = "lab"
}

variable "cluster_name" {
  default     = "george-lab"
  description = "EKS Cluster Name"
}

variable "create_eks" {
  default     = "true"
  description = "Toggle cluster create true/false"
}

variable "create_web_ng" {
  default     = "true"
  description = "Toggle Web Nodegroup create true/false"
}

variable "create_app_ng" {
  default     = "true"
  description = "Toggle App Nodegroup create true/false"
}

variable "create_db_ng" {
  default     = "true"
  description = "Toggle DB Nodegroup create true/false"
}

variable "create_man_ng" {
  default     = "true"
  description = "Toggle Management Nodegroup create true/false"
}

variable "project" {
  default     = "iamzanet"
  description = "Project that owns the environment"
}

variable "team" {
  default     = "devlab"
  description = "BSA Team Name"
}



