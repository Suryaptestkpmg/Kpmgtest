# Adding provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider configuration
provider "aws" {
  region  = var.region
  profile = var.aws_profile
}


#Modules configuration
module "vpc_config" {
  source = "./vpc_config"
}

module "elb_config" {
  source = "./elb_config"

  public_subnet1  = module.vpc_config.out_publicsubnet1
  public_subnet2  = module.vpc_config.out_publicsubnet2
  private_subnet3 = module.vpc_config.out_privatesubnet3
  private_subnet4 = module.vpc_config.out_privatesubnet4
  vpc_id          = module.vpc_config.vpc_id
  external_alb_sg = module.vpc_config.out_external_alb_sg
  internal_alb_sg = module.vpc_config.out_internal_alb_sg


}

module "auto_scaling_group" {
  source           = "./auto_scaling_group"
  web_launch_cfg   = module.launch_config.web_lc_name
  app_launch_cfg   = module.launch_config.app_lc_name
  public_subnet1   = module.vpc_config.out_publicsubnet1
  public_subnet2   = module.vpc_config.out_publicsubnet2
  private_subnet3  = module.vpc_config.out_privatesubnet3
  private_subnet4  = module.vpc_config.out_privatesubnet4
  out_tg_instances = module.elb_config.out_tg_instances
  internaltg       = module.elb_config.internaltg
}

module "launch_config" {
  source                 = "./launch_config"
  output_web_sg          = module.vpc_config.output_web_sg
  external_alb_sg        = module.vpc_config.out_external_alb_sg
  output_bastion_ssh     = module.vpc_config.output_bastion_ssh
  output_internal_alb_sg = module.vpc_config.out_internal_alb_sg

}

module "ec2_ins_config" {
  source                     = "./ec2_ins_config"
  public_subnet1             = module.vpc_config.out_publicsubnet1
  private_subnet3            = module.vpc_config.out_privatesubnet3
  private_subnet4            = module.vpc_config.out_privatesubnet4
  output_bastion_ssh         = module.vpc_config.output_bastion_ssh
  web_access_from_nat_prv_sg = module.vpc_config.web_access_from_nat_prv_sg
  web_access_from_nat_pub_sg = module.vpc_config.web_access_from_nat_pub_sg

}


module "rds_config" {
  source             = "./rds_config"
  private_subnet3    = module.vpc_config.out_privatesubnet3
  private_subnet4    = module.vpc_config.out_privatesubnet4
  out_rdssubnetgroup = module.vpc_config.out_rdssubnetgroup
  rdsmysqlsg         = module.vpc_config.rdsmysqlsg

}


