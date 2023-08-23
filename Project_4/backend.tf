terraform {
    backend "s3" {
        bucket  = "mamawonderland"
        key     = "terraform-project5.tfstate"
        region = "eu-west-2"
    }

}