# resource "aws_instance" "web1" {
#     ami = "ami-0194c3e07668a7e36"
#     instance_type = "t2.micro"
#     # VPC
#     subnet_id = "${aws_subnet.terrasubnet.id}"
#     # Security Group
#     security_groups = [aws_security_group.terrasg.id]
#     # the Public SSH key
#     key_name = "123"
#     # nginx installation

# }

# output "ec2ip" {
#   value = aws_instance.web1.public_ip
# }
