

resource "aws_s3_bucket" "tf-state" {
  bucket = "tf-state-bkt-hostme"

  #prevent accidental of the bucket
  lifecycle {
    prevent_destroy = true
  }

  #version of state file
  versioning {
    enabled = true
  }

  # Enable server side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

}

terraform {
    backend "s3" {
        # s3 bucket for storing state file
        bucket      = "tf-state-bkt-hostme"
        key         = "global/s3/terraform.tfstate"
        region      = "us-east-1"

        # DyanomDB for locks 
        dynamodb_table  = "tf-db-lock"
        encrypt         = "true"
    }
}

output "s3_bucket_arn"{
    value               = aws_s3_bucket.tf-state.arn
    description         = "The ARN of bucket"
}

