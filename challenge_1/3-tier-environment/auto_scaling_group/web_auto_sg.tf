resource "aws_autoscaling_group" "web_asg" {

    name                 = "auto_scaling_group_web"
    max_size             = var.max_asgp
    min_size             = var.min_asgp
    launch_configuration = var.web_launch_cfg
    target_group_arns    = [var.out_tg_instances]
    force_delete         = true
    vpc_zone_identifier  = [var.public_subnet1,var.public_subnet2]
    health_check_type    = "EC2"
    health_check_grace_period = 300


  
}