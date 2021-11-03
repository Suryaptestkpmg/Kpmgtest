# Amazon Linux 2 AMI with id: ami-013a129d325529d4d

variable "amis" {
    
    default = "ami-013a129d325529d4d"
  
}


variable "instance_type" {

    default = "t2.micro"
  
}

variable "instance_type_internal" {

    default = "t2.micro"
  
}

variable "output_web_sg" {} 
variable "external_alb_sg" {} 
variable "output_bastion_ssh" {}   
variable "output_internal_alb_sg" {}