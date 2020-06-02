provider "aws" {
    region  = "us-east-1"
}

terraform {
    backend "s3" {
        # s3 bucket for storing state file
        bucket      = "tf-state-bkt-hostme"
        key         = "global/iam/terraform.tfstate"
        region      = "us-east-1"

        # DyanomDB for locks 
        dynamodb_table  = "tf-db-lock"
        encrypt         = "true"
    }
}

resource "aws_iam_user" "iam_usr" {
    # count = length(var.user_names)
    for_each    = toset(var.user_names)
    name        =  each.value
}