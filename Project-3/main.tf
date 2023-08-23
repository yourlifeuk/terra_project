terraform {
    required_providers {
        aws = {
         source = "hashicorp/aws"
         version = "~> 3.63"
        }

    }
    required_version = ">= 0.14.9"

}

resource "aws_vpc" "myapp-vpc"{
    cidr_block = var.vpc_cidr_blocks
    tags = {
        Name = "${var.env_prefix}-vpc"
    }
}

module "myapp-subnet" {
    source = "./Modules/Subnet"
    env_prefix        = var.env_prefix
    subnet_cidr_block = var.subnet_cidr_block
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
    
    subnet_id_1 = module.myapp-subnet.subnet_id_1
    subnet_id_2 = module.myapp-subnet.subnet_id_2
    vpc_id               = aws_vpc.myapp-vpc.id
}
