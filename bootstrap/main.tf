resource "aws_s3_bucket" "my_first_bucket" {
  bucket        = "my-first-bucket-test-1609"
  force_destroy = "true"
  tags = {
    Name = "My bucket"

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
}
