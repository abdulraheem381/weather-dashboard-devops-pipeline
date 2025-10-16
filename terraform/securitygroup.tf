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

    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"

  }

  egress {

    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

}
