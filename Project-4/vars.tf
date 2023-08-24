variable vpc_cidr_blocks{
  description = "CIDR block for the VPC"
  default     = "10.16.0.0/16"
}
variable subnet_cidr_block{
  description = "CIDR block for the subnet"
  default     = "10.16.0.0/24"
}
variable instance_type {
  default = "t2.micro"

}
# variable public_key_location {}
# variable private_key_location {}
variable env_prefix {
    default = "Dev"
}
# variable avail_zone {}
variable region {
    default = "eu-west-3"
}
variable image_name {}
