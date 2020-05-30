provider "aws" {
    region = "us-east-1"
}

module "webserver_cluster" {
    source          = "github.com/owlman1911/tf-web-module//services/webserver-cluster?ref=v0.0.3"

    cluster_name                        = "webserver-prod"
    db_remote_state_bucket              = "tf-state-bkt-hostme"
    db_remote_state_key                 = "prod/data-stores/mysql/terraform.tfstate"
}

resource "aws_autoscaling_schedule" "scale_outof_bus" {
    scheduled_action_name           = "scale-out-bus-hrs"
    min_size                        = 2
    max_size        = 4
    desired_capacity   = 4
    recurrence          = "0 9 * * *" 

    autoscaling_group_name = module.webserver_cluster.asg_name
}

resource "aws_autoscaling_schedule" "scale_in_night" {
    scheduled_action_name           = "scale-in-at-ngt"
    min_size                        = 1
    max_size        = 4
    desired_capacity   = 1
    recurrence          = "0 17 * * *" 

    autoscaling_group_name = module.webserver_cluster.asg_name
}