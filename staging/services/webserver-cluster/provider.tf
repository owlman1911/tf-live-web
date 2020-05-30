provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source          = "github.com/owlman1911/tf-web-module//services/webserver-cluster?ref=v0.0.4"

    cluster_name                        = "webserver-stage"
    db_remote_state_bucket              = "tf-state-bkt-hostme"
    db_remote_state_key                 = "staging/data-stores/mysql/terraform.tfstate"

    instance_type                       = "t2.micro"
    min_size                            = 1
    max_size                            = 3
}