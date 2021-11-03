# Amazon RHEL EC2 Instances

variable "amis" {
    
    default = "ami-013a129d325529d4d"
  
}


variable "instance_type" {

    default = "t2.micro"
  
}

variable "public_subnet1" {}
variable "output_bastion_ssh" {}
variable "private_subnet3" {}
variable "private_subnet4" {}
variable "web_access_from_nat_prv_sg" {}
variable "web_access_from_nat_pub_sg" {}

