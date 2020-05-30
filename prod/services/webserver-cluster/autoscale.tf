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