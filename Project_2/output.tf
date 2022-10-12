output "vpc1name" {
  value = aws_vpc.terravpc.id
}

output "backendvpc1name" {
  value = aws_vpc.backendvpc.id
  
}

output "backendsubnetname" {
  value = aws_subnet.backendsubnet.cidr_block
}
 
output "subnetname" {
  value = aws_subnet.terrasubnet.cidr_block
}

# output "eip" {
#   value = aws_eip.eip.public_ip
# }

# output "node" {
#   value = aws_instance.node.private_ip

# }