terraform {
    backend "s3" {
        bucket  = "comeonjames-2022"
        key     = "network/terraform-demo.tfstate"
        region  = "eu-west-2"
        dynamodb_table = "lockingmate"
    }

}