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

# # Create S3 Bucket 
# resource "aws_s3_bucket" "log_mybucket"{    
#         bucket = "joechanbucketlog"
#         acl = "log-delivery-write"
#         tags = {
#             Name = "Logs"
#             Enviroment = "Dev"
#         }


# }

# resource "aws_s3_bucket" "mybucket"{    
#         bucket = "joechanbucket"
#         acl = "private"
#         tags = {
#             Name = "Sales"
#             Enviroment = "Dev"
#         }
        
#         logging {
#             target_bucket = "${aws_s3_bucket.log_mybucket.id}"
#             target_prefix = "logs/"
        

#         }
# }

# resource "aws_s3_bucket_public_access_block" "Publicblcok" {
#         bucket = "${aws_s3_bucket.mybucket.id}"

#         block_public_acls = true 
#         block_public_policy = true
#         ignore_public_acls = true
#         restrict_public_buckets = true
# }

# output "arn1" {
#   value       = aws_s3_bucket.mybucket.arn
#   description = "The domain name of the load balancer"
# }

# output "arn2" {
#   value       = aws_s3_bucket.log_mybucket.arn
#   description = "The domain name of the load balancer"
# }
