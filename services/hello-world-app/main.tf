terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.4.0"
}

resource "aws_alb_target_group" "asg" {
  name     = "${var.task_name}-${var.environment}"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id = local.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_alb_listener_rule" "asg" {
  listener_arn = module.alb.alb_http_listener_arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.asg.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")
  vars = {
    server_port = var.server_port
    db_address = local.mysql_config.address
    db_port = local.mysql_config.port
    server_text = var.server_text
  }
}

module "asg" {
  source = "../../cluster/asg-rolling-deploy"
  cluster_name  = "${var.task_name}-${var.environment}"
  ami = var.ami
  user_data = data.template_file.user_data.rendered
  instance_type = var.instance_type
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.desired_capacity
  enable_autoscaling = var.enable_autoscaling
  target_group_arns = [aws_alb_target_group.asg.arn]
  health_check_type = "ELB"
  custom_tags = var.custom_tags
  subnet_ids = local.subnet_ids
}

module "alb" {
  source = "../../networking/alb"
  alb_name = "${var.task_name}-${var.environment}"
  subnet_ids = local.subnet_ids
}
