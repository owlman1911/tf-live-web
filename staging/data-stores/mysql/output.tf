output "address" {
    value           = aws_db_instance.web-mysql-tf.address
    description         = "Mysql Database address"
}

output "port" {
    value               = aws_db_instance.web-mysql-tf.port
    description         = "the port the db instance is listening on"
}