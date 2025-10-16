####################################
############ EC2 Instance ##########
####################################

resource "aws_instance" "main" {

  ami                         = var.aws_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.vpc-sg.id]
  availability_zone           = "ap-south-1a"


  root_block_device {

    volume_size = var.volume_size
    volume_type = var.volume_type
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