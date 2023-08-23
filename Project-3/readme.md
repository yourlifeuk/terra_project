:fire: **TERRAFORM!**

# Terraform 
$ terraform state list
```zsh
aws_vpc.myapp-vpc
module.myapp-server.aws_alb.alb
module.myapp-server.aws_alb_listener.alb_listener
module.myapp-server.aws_alb_target_group.alb_target_group
module.myapp-server.aws_alb_target_group_attachment.svc_physical_external
module.myapp-server.aws_instance.myapp-server
module.myapp-server.aws_security_group.myapp-sg
module.myapp-subnet.aws_internet_gateway.myapp-igw
module.myapp-subnet.aws_route_table.myapp-route-table
module.myapp-subnet.aws_route_table_association.myapp-rtb-association
module.myapp-subnet.aws_subnet.myapp-subnet-1
module.myapp-subnet.aws_subnet.myapp-subnet-2
```

```zsh
terraform init
terraform validate
terraform plan
terraform apply
```

# main.tf
resouce "aws_vpc" "myapp-vpc"
module"myapp-subnet"
module"myapp-server"

# Modules -> 
## Subnet (myapp-subnet)
aws_subnet
aws_internet_gateway
aws_route_table
aws_route_table_association

## Webserver (myapp-server)
aws_alb
aws_alb_listener
aws_alb_target_group
aws_alb_target_group_attachement

aws_security_group
aws_instance

