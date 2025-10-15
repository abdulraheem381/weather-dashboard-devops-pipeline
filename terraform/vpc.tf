resource "aws_vpc" "main" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "weatherapp-vpc"
    ENV  = "PROD"
  }

}

# Creating 2 subnets 1 private and 1 public 

resource "aws_subnet" "public-subnet" {

  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-subnet"
    ENV  = "PROD"
  }

}

resource "aws_subnet" "private-subnet" {

  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
    ENV  = "PROD"
  }

}

# Internet Gateway

resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "weatherapp-igw"
    ENV  = "PROD"
  }

}

# Route table

resource "aws_route_table" "weatherapp-rt" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id

  }

  tags = {
    Name = "weatherapp-rt"
    ENV  = "PROD"
  }

}

# Associate public-subnet with route table 

resource "aws_route_table_association" "public-sub" {

  route_table_id = aws_route_table.weatherapp-rt.id
  subnet_id      = aws_subnet.public-subnet.id

}