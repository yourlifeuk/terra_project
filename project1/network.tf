resource "aws_route_table_association" "terratable" {
  subnet_id = "${aws_subnet.terrasubnet.id}"
  route_table_id = "${aws_route_table.terraroute.id}"
}

resource "aws_subnet" "terrasubnet" {
  vpc_id                  = aws_vpc.terravpc.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-2a"


}

output "subnetname" {
  value = aws_subnet.terrasubnet.cidr_block
}

resource "aws_internet_gateway" "terragateway" {
  vpc_id = aws_vpc.terravpc.id
}

resource "aws_route_table" "terraroute" {
  vpc_id = aws_vpc.terravpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terragateway.id
  }


}

resource "aws_security_group" "terrasg" {
    vpc_id = aws_vpc.terravpc.id

    ingress { 
        protocol = "tcp"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    } 


    egress { 
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    } 



}