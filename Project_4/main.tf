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

resource "aws_vpc" "myapp-vpc"{
    cidr_block = var.vpc_cidr_blocks
    tags = {
        Name = "${var.env_prefix}-vpc"
    }
}


module "myapp-subnet" {
    source = "./Modules/Subnet"
    subnet_cidr_block = var.subnet_cidr_block
    env_prefix        = var.env_prefix
    vpc_id            = aws_vpc.myapp-vpc.id
}


module "myapp-server" {
    source = "./Modules/Webserver"
    # public_key_location  = var.public_key_location
    # private_key_location = var.private_key_location
    instance_type        = var.instance_type
    image_name           = var.image_name
    # avail_zone           = var.avail_zone
    env_prefix           = var.env_prefix
    vpc_id               = aws_vpc.myapp-vpc.id
    subnet_id            = module.myapp-subnet.subnet.id
}

