# Amazon Linux 2 AMI: ami-0800fc0fa715fdcfe 
resource "aws_launch_configuration" "app-lc" {

    name_prefix                = "App_Launch_Config"
    image_id                   = var.amis
    instance_type              = var.instance_type_internal
    security_groups            = [
                                 var.output_internal_alb_sg,
                                 var.output_bastion_ssh,
                                  ]


    # key name                   = "myec2key"
    
    lifecycle {
      create_before_destroy = true
  }
}

output "app_lc_name" {
  value = aws_launch_configuration.app-lc.name
}