terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_vpc" "terravpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

}

output "vpcname" {
  value = aws_vpc.terravpc.arn
}


# resource "aws_instance" "terrainstance" {
#     ami = 


#     tags {
#         Name = "Ubuntu"
#     }
# }
