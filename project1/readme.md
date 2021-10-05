:fire: **TERRAFORM!**

# Terraform 
## Creating list of resources which allow VM can reach public network
### aws_internet_gateway.terragateway
### aws_route_table.terraroute
### aws_route_table_association.terratable
### aws_security_group.terrasg
### aws_subnet.terrasubnet
### aws_vpc.terravpc

```zsh
terraform init
terraform validate
terraform plan
terraform apply
```

  Commands  |  Description  |
|  --- |  ---  |
|  [bucket = "joechanbucketlog"](/http://askjoechan.com)  |  Input the bucket name you want, also need to universal. |
|  [acl = "log-delivery-write" ](/http://askjoechan.com )  |  Access control list (ACL)  |
|  [tags = (Name = "Logs" Enviroment = "Dev") ](/http://askjoechan.com)  |  Tags you mark for your projects.  |
