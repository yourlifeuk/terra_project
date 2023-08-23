variable instance_type {}
# variable avail_zone {}
variable env_prefix {}
variable vpc_id {}
variable image_name {
    default = "Dev"
}
# variable subnet_id {
# description = "ID of the subnet to use for the resources"
# }

variable "subnet_id_1" {
  description = "myapp-subnet-1"
}

variable "subnet_id_2" {
  description = "myapp-subnet-2"
}




  