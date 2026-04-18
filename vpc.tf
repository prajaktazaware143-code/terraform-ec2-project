resource "aws_vpc" "net" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "terra_vpc"
  }
}
resource "aws_subnet" "sub" {
  vpc_id                  = aws_vpc.net.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terra_subnet"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.net.id

  tags = {
    Name = "terra_igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.net.id

  tags = {
    Name = "terra_rttable"
  }
}

resource "aws_route_table_association" "sub_add" {
  subnet_id      = aws_subnet.sub.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route" "terra_route"{
    route_table_id = aws_route_table.rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

}