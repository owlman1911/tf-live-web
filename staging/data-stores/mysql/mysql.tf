provider "aws" {
    region  = "us-east-1"
}

terraform {
    backend "s3" {
        # s3 bucket for storing state file
        bucket      = "tf-state-bkt-hostme"
        key         = "staging/data-stores/mysql/terraform.tfstate"
        region      = "us-east-1"

        # DyanomDB for locks 
        dynamodb_table  = "tf-db-lock"
        encrypt         = "true"
    }
}

resource "aws_db_instance" "web-mysql-tf" {
    identifier_prefix           = "tf-webserver-db-mysql" 
    engine                      = "mysql"
    allocated_storage           = 10
    instance_class              = "db.t2.micro"
    name                        = "hostme_dbinst"
    username                    = "admin"

    password                    = "p1ssw0rd"
    skip_final_snapshot         = true
    final_snapshot_identifier   = "hostme_dbinst_finalbkup"
  
}