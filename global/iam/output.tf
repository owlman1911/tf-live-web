output "all_arn" {
    value       =  values(aws_iam_user.iam_usr)[*].arn
}

output "all_users" {
    value       = aws_iam_user.iam_usr
}
