
variable "aws_ami" {

  type    = string
  default = "ami-02d26659fd82cf299"

}

variable "instance_type" {

  type    = string
  default = "t2.micro"

}


variable "root_volume" {

  type = object({
    v_size = number
    v_type = string
  })

  default = {
    v_size = 30
    v_type = "gp2"
  }

}

variable "availability_zone" {

  type    = string
  default = "ap-south-1"

}

variable "additional_tags" {

  type = map(string)
  default = {
    "ENV"     = "PROD"
    "Project" = "Weatherapp"
  }

}