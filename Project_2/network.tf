resource "aws_subnet" "terrasubnet" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"



}

resource "aws_internet_gateway" "terragateway" {
  vpc_id = aws_vpc.terravpc.id
}

resource "aws_route_table_association" "terratable" {
  subnet_id = "${aws_subnet.terrasubnet.id}"
  route_table_id = "${aws_route_table.terraroute.id}"
}


resource "aws_route_table" "terraroute" {
  vpc_id = aws_vpc.terravpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terragateway.id
  }

  tags = {
    Name = "FrontEnd"
  }
}

resource "aws_security_group" "terrasg" {
    vpc_id = aws_vpc.terravpc.id

    ingress { 
        protocol = "tcp"
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
         
    } 

    ingress { 
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
         
    } 

    egress { 
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    } 

 tags = {
    Name = "FRONTEND-SG"
  }

}


#resource "aws_route_table_association" "backendtable" {
#  subnet_id = "${aws_subnet.backendsubnet.id}"
#  route_table_id = "${aws_route_table.backendroute.id}"
#}

resource "aws_subnet" "backendsubnet" {
  vpc_id                  = aws_vpc.backendvpc.id
  cidr_block              = "10.10.10.0/24"

}

# resource "aws_route_table_association" "backendtable" {
#   subnet_id = "${aws_subnet.backendsubnet.id}"
#   route_table_id = "${aws_route_table.terraroute.id}"
# }


# resource "aws_internet_gateway" "backendgateway" {
#  vpc_id = aws_vpc.backendvpc.id
# }

# resource "aws_route_table" "backendroute" {
#  vpc_id = aws_vpc.backendvpc.id

# #  route {
# #    cidr_block = "0.0.0.0/0"
# #    gateway_id = aws_internet_gateway.backendgateway.id
# #  }

#   tags = {
#     Name = "BackEnd"
#   }
# }

resource "aws_security_group" "backendsg" {
    vpc_id = aws_vpc.backendvpc.id

    ingress { 
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = [aws_vpc.terravpc.cidr_block]
    } 



    egress { 
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    } 

 tags = {
    Name = "BACKRNF-SG"
  }

}

