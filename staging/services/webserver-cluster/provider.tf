provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source          = "github.com/owlman1911/tf-web-module//services/webserver-cluster?ref=v0.1.5"

    cluster_name                        = "webserver-stage"
    db_remote_state_bucket              = "tf-state-bkt-hostme"
    db_remote_state_key                 = "staging/data-stores/mysql/terraform.tfstate"

    instance_type                       = "t2.micro"
    min_size                            = 2
    max_size                            = 3
    enable_autoscaling                  = false
    enable_new_user_data                = true

    ami                                 = "ami-01d025118d8e760db"
    server_text                         = "Staging_env with Zero Downtime"

    custom_tags   = {
        owner = "Owlman-1911"
        DeployedBy = "Terraform-Git"
    }
}