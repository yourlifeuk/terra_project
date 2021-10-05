:fire: **TERRAFORM!**

# Terraform 
## Creating new S3 bucket, one with public access

```zsh
terraform init
terraform plan
terraform apply
```

  Commands  |  Description  |
|  --- |  ---  |
|  [bucket = "joechanbucketlog"](/http://askjoechan.com)  |  Input the bucket name you want, also need to universal. |
|  [acl = "log-delivery-write" ](/http://askjoechan.com )  |  Access control list (ACL)  |
|  [tags = {
            Name = "Logs"
            Enviroment = "Dev" ](/http://askjoechan.com)  |  Tags you mark for your projects.  |
