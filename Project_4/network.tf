resource "aws_subnet" "public_eu_west_1a" {
  vpc_id     = aws_vpc.myapp_vpc.id
  cidr_block = "10.10.0.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Public Subnet eu-west-1a"
  }
}

resource "aws_subnet" "public_eu_west_1b" {
  vpc_id     = aws_vpc.myapp_vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Public Subnet eu-west-1b"
  }
}

resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.myapp_vpc.id

  tags = {
    Name = "My VPC - Internet Gateway"
  }
}

resource "aws_route_table" "my_vpc_public" {
    vpc_id = aws_vpc.myapp_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_vpc_igw.id
    }

    tags = {
        Name = "Public Subnets Route Table for My VPC"
    }
}

resource "aws_route_table_association" "my_vpc_eu_west_1a_public" {
    subnet_id = aws_subnet.public_eu_west_1a.id
    route_table_id = aws_route_table.my_vpc_public.id
}

resource "aws_route_table_association" "my_vpc_eu_west_1b_public" {
    subnet_id = aws_subnet.public_eu_west_1b.id
    route_table_id = aws_route_table.my_vpc_public.id
}


resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound connections"
  vpc_id = aws_vpc.myapp_vpc.id

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
  }

  tags = {
    Name = "Allow HTTP Security Group"
  }

}
