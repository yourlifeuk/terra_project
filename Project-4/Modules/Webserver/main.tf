resource "aws_security_group" "myapp-sg" {
    name   = "myapp-sg"
    vpc_id = var.vpc_id

    ingress {
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"

        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
        prefix_list_ids = []
    }

    tags = {
        Name = "${var.env_prefix}-security-group"
    }
}

# data "aws_ami" "latest-amazon-linux-image" {
#     most_recent = true
#     owners      = ["amazon"]
#     filter{  
#         name   = "name"
#         values = [var.image_name]
#     }
#     filter{ 
#         name   = "virtualization-type"
#         values = ["hvm"] 
#     }
#     filter {
#         name   = "description"
#         values = ["Ubuntu*"]
#     }
# }

# data "aws_ami" "latest-amazon-linux-image" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]  # Filter for Amazon Linux 2 AMIs
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }


# resource "aws_key_pair" "ssh-key" {
#     key_name   = "server-key"
#     # public_key = file(var.public_key_location)
# }

# resource "aws_instance" "myapp-server" {

#     ami           = "ami-05b5a865c3579bbc4"
#     instance_type = var.instance_type

#     subnet_id               = var.subnet_id_1
#     vpc_security_group_ids = [aws_security_group.myapp-sg.id]
#     # availability_zone       = var.avail_zone

#     associate_public_ip_address = true
#     key_name  = "rancher"

#     user_data = file("script.sh")

#     tags = {
#         Name = "${var.env_prefix}-server"
#     }
  
#     provisioner "local-exec" {
#         command = "echo ${self.public_ip} > output.txt"
#     }
# }

resource "aws_launch_template" "foobar" {
  name_prefix = "myapp-launch-template-"
  
  image_id        = "ami-05b5a865c3579bbc4"
  instance_type   = var.instance_type
  key_name        = "rancher"
  user_data = base64encode(file("script.sh"))
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.env_prefix}-server"
    }
   }
    network_interfaces {
     associate_public_ip_address = true  # Enable public IP assignment
     security_groups      = [aws_security_group.myapp-sg.id]  # Add the security group here
  }
    
}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = [var.subnet_id_1]
  name               = "myapp-asg"

  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "svc_asg_external2" {
  alb_target_group_arn   = "${aws_alb_target_group.alb_target_group.arn}"
  autoscaling_group_name = "${aws_autoscaling_group.bar.id}"
}


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




# resource "aws_alb_target_group_attachment" "svc_physical_external" {
#   target_group_arn = "${aws_alb_target_group.alb_target_group.arn}"
#   target_id        = "${aws_instance.myapp-server.id}"  
#   port             = 80
# }



