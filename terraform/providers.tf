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

  region = var.availability_zone

}







