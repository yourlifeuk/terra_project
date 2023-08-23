# resource "aws_launch_configuration" "web" {
#   name_prefix = "web-"

#   image_id = "ami-0fe0b2cf0e1f25c8a" # Amazon Linux 2 AMI (HVM), SSD Volume Type
#   instance_type = "t2.micro"

#   security_groups = [ aws_security_group.allow_http.id ]
#   associate_public_ip_address = true

#   user_data = file("script.sh")
  

# }

# resource "aws_security_group" "elb_http" {
#   name        = "elb_http"
#   description = "Allow HTTP traffic to instances through Elastic Load Balancer"
#   vpc_id = aws_vpc.myapp_vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port       = 0
#     to_port         = 0
#     protocol        = "-1"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "Allow HTTP through ELB Security Group"
#   }
# }

# resource "aws_elb" "web_elb" {
#   name = "web-elb"
#   security_groups = [
#     aws_security_group.elb_http.id
#   ]
#   subnets = [
#     aws_subnet.public_eu_west_1a.id,
#     aws_subnet.public_eu_west_1b.id
#   ]

#   cross_zone_load_balancing   = true

#   health_check {
#     healthy_threshold = 2
#     unhealthy_threshold = 2
#     timeout = 3
#     interval = 30
#     target = "HTTP:80/"
#   }

#   listener {
#     lb_port = 80
#     lb_protocol = "http"
#     instance_port = "80"
#     instance_protocol = "http"
#   }

# }

# resource "aws_autoscaling_group" "web" {
#   name = "${aws_launch_configuration.web.name}-asg"

#   min_size             = 1
#   desired_capacity     = 2
#   max_size             = 4
  
#   health_check_type    = "ELB"
#   load_balancers = [
#     aws_elb.web_elb.id
#   ]

#   launch_configuration = aws_launch_configuration.web.name

#   enabled_metrics = [
#     "GroupMinSize",
#     "GroupMaxSize",
#     "GroupDesiredCapacity",
#     "GroupInServiceInstances",
#     "GroupTotalInstances"
#   ]

#   metrics_granularity = "1Minute"

#   vpc_zone_identifier  = [
#     aws_subnet.public_eu_west_1a.id,
#     aws_subnet.public_eu_west_1b.id
#   ]

#   # Required to redeploy without an outage.
#   lifecycle {
#     create_before_destroy = true
#   }

#   tag {
#     key                 = "Name"
#     value               = "web"
#     propagate_at_launch = true
#   }

# }
