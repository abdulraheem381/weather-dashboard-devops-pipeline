
variable "aws_ami" {

    type = string
    default = "ami-02d26659fd82cf299"
  
}

variable "instance_type" {

    type = string
    default = "t2.micro"
  
}

variable "volume_size" {

    type = number
    default = 20
  
}

variable "volume_type" {

    type = string
    default = "gp2"
  
}

variable "availability_zone" {

    type = string
    default = "ap-south-1"
  
}