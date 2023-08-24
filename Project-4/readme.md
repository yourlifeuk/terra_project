:fire: **TERRAFORM!**

# Terraform 
$ terraform state list
```zsh
aws_vpc.myapp-vpc
module.myapp-server.aws_alb.alb
module.myapp-server.aws_alb_listener.alb_listener
module.myapp-server.aws_alb_target_group.alb_target_group
module.myapp-server.aws_autoscaling_attachment.svc_asg_external2
module.myapp-server.aws_autoscaling_group.bar
module.myapp-server.aws_launch_template.foobar
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

aws_autoscaling_group
aws_autoscaling_group_attachement

aws_launch_template

