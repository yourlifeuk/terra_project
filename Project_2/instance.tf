# resource "aws_instance" "node" {
#   instance_type          = "t2.micro" # free instance
#   ami                    = "ami-09e2d756e7d78558d"

#   vpc_security_group_ids = [aws_security_group.terrasg.id]
#   subnet_id              = aws_subnet.terrasubnet.id

#   tags = {
#     Name = "TF Generated EC2"
#   }

 
#   root_block_device {
#     volume_size = 10
#   }
# }

# # Create and assosiate an Elastic IP
# resource "aws_eip" "eip" {
#   instance = aws_instance.node.id
#   vpc = true
# }


