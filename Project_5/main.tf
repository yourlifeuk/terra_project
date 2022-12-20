terraform {
    required_providers {
        aws = {
         source = "hashicorp/aws"
         version = "~> 3.63"
        }

    }
    required_version = ">= 0.14.9"

}

provider "aws"{
    profile = "default"
    region = "eu-west-1"

}

resource "aws_vpc" "myapp_vpc"{
    cidr_block = var.vpc_cidr_blocks
    tags = {
        Name = "${var.env_prefix}-vpc"
    }
}

