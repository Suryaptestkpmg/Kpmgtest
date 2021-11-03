resource "aws_autoscaling_group" "app_sg" {

    name                 = "auto_scaling_group_app"
    max_size             = var.max_asgp
    min_size             = var.min_asgp
    target_group_arns    = [var.internaltg]
    force_delete         = true
    launch_configuration = var.app_launch_cfg
    vpc_zone_identifier  = [var.private_subnet3,var.private_subnet4]
    health_check_type    = "EC2"
    health_check_grace_period = 300

  
}