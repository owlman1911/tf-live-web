provider "aws" {
    region          = "us-east-1"
}

resource "aws_dynamodb_table" "tf-db-locks" { 
    name            = "tf-db-lock"
    billing_mode    = "PAY_PER_REQUEST"
    hash_key        = "LockID"

    attribute {
        name        = "LockID"
        type        = "S"

    }
}

output "dynamodb_table_nme" {
    value               = aws_dynamodb_table.tf-db-lock.name
    description         = "The ARN of Dynamodb Table"
}