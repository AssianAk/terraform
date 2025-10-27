#create Vpc
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
        name="Dev_vpc"
    }
  
}

#create subnet
resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    tags = {
      name="publc_subnet"
    }

  
}
#create internet Gateway attach to vpc
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      name="custom_ig"
    }
  
}
#create route table and edit route
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      name="public_route_table"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
  
}
#subnet association
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.dev.id
}
# create security group
resource "aws_security_group" "dev" {
  name = "allow ssh"
  vpc_id = aws_vpc.dev.id
  tags = {
    name="custom_sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "dev" {
    description = "ssh for vpc"
    cidr_ipv4 = "0.0.0.0/0"
    security_group_id = aws_security_group.dev.id
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
  
}
resource "aws_vpc_security_group_egress_rule" "dev" {
    security_group_id = aws_security_group.dev.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  
}
#create ec2