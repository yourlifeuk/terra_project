# resource "aws_vpc_peering_connection" "owner" {
   
#   peer_vpc_id   = aws_vpc.terravpc.id
#   vpc_id        = aws_vpc.backendvpc.id



# }

# resource "aws_vpc_peering_connection_accepter" "accepter" {
  
#   aws_vpc_peering_connection = aws_vpc.backendvpc.id
#   auto_accept = true
# }