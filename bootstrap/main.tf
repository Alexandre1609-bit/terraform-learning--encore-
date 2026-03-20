data "aws_region" "current" {}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket        = "my-first-bucket-test-1609"
  force_destroy = true //Je conserve cela pour mes lab, plus pratique

  /*lifecycle {
    prevent_destroy = true
  }*/
  tags = {
    Name        = "s3-bucket-terraform-state"
    Environment = "dev"
    Owner       = "alexandre"

  }
}

resource "aws_s3_bucket_versioning" "bucket_version" {
  bucket = aws_s3_bucket.my_first_bucket.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "Lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "dynamo-db-lock"
    Environment = "dev"
    Owner       = "alexandre"

  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
  bucket = aws_s3_bucket.my_first_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
