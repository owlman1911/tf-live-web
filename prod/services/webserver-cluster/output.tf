output "alb_dns_name" {
    value           = module.webserver_cluster.alb_dns_name
    description     = "The URL for the application load balancer"
}