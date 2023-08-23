resource "aws_alb" "alb" {  
  name            = "alb"  
  subnets      = [aws_subnet.myapp-subnet-2.id, aws_subnet.myapp-subnet-3.id]
  security_groups = [aws_security_group.myapp-sg.id]
  internal        = false
  # enable_deletion_protection = true 
    tags = {
        Name = "${var.env_prefix}-alb"
    }  
}

resource "aws_subnet" "myapp-subnet-2" {
    vpc_id            = var.vpc_id
    cidr_block        = "10.10.20.0/24"
    availability_zone = "eu-west-1b"
    tags = {
        Name = "${var.env_prefix}-subnet-2"
    }
}

resource "aws_subnet" "myapp-subnet-3" {
    vpc_id            = var.vpc_id
    cidr_block        = "10.10.30.0/24"
    availability_zone = "eu-west-1c"
    tags = {
        Name = "${var.env_prefix}-subnet-3"
    }
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = "${aws_alb.alb.arn}"  
  port              = "80"  
  protocol          = "HTTP"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
    type             = "forward"  
  }
}

# resource "aws_alb_listener_rule" "listener_rule" {
#   depends_on   = ["aws_alb_target_group.alb_target_group"]  
#   listener_arn = "${aws_alb_listener.alb_listener.arn}"  
#   priority     = "${var.priority}"   
#   action {    
#     type             = "forward"    
#     target_group_arn = "${aws_alb_target_group.alb_target_group.id}"  
#   }   
#   condition {    
#     field  = "path-pattern"    
#     values = ["${var.alb_path}"]  
#   }
# }

resource "aws_alb_target_group" "alb_target_group" {  
  name     = "Application-front" 
  port     = 80  
  protocol = "HTTP"  
  vpc_id   = var.vpc_id   
    tags = {
        Name = "${var.env_prefix}-alb_target"
    }  
 
 
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
    path                = "/"    
    port                = "traffic-port"  
  }
}


# resource "aws_autoscaling_attachment" "svc_asg_external2" {
#   alb_target_group_arn   = "${aws_alb_target_group.alb_target_group.arn}"
#   autoscaling_group_name = "${aws_autoscaling_group.myapp-server.id}"
# }
resource "aws_alb_target_group_attachment" "svc_physical_external" {
  target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
  target_id        = "${aws_instance.myapp-server.id}"  
  port             = 80
}

# resource "aws_launch_template" "foobar" {
#   name_prefix   = "foobar"
#   image_id      = "ami-1a2b3c"
#   instance_type = "t2.micro"
# }

# resource "aws_autoscaling_group" "bar" {
#   availability_zones = ["eu-west-1b"]
#   desired_capacity   = 1
#   max_size           = 2
#   min_size           = 1

#   launch_template {
#     id      = aws_launch_template.foobar.id
#     version = "$Latest"
#   }
# }