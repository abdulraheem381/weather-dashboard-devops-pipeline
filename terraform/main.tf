terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {

    bucket  = "terraform-statefile-234324234"
    key     = "terraform.tfstate"
    encrypt = true
    region  = "ap-south-1"


  }
}

provider "aws" {

  region = "ap-south-1"

}

#######################################
################ VPC ##################

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

####################################
############ EC2 Instance ##########
####################################

resource "aws_instance" "main" {

  ami                         = "ami-02d26659fd82cf299"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  availability_zone           = "ap-south-1c"
  vpc_security_group_ids      = [aws_security_group.vpc-sg.id]


  root_block_device {

    volume_size = "20"
    volume_type = "gp2"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y docker.io
    systemctl start docker
    docker pull abdulraheem381/weather-app-cicd:latest
    docker run -d -p 80:80 abdulraheem381/weather-app-cicd:latest
  EOF


}

#############################
####### Security Group ######
#############################

resource "aws_security_group" "vpc-sg" {

  name   = "vpc-sg"
  vpc_id = aws_vpc.main.id

  ingress {

    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {

    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {

    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
  }

  ingress {

    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"

  }

  egress {

    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

}
