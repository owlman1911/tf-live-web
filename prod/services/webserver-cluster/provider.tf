provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source          = "github.com/owlman1911/tf-web-module//services/webserver-cluster?ref=v0.0.3"

    cluster_name                        = "webserver-prod"
    db_remote_state_bucket              = "tf-state-bkt-hostme"
    db_remote_state_key                 = "prod/data-stores/mysql/terraform.tfstate"


     enable_autoscaling                  = true
     enable_new_user_data                = false
}
