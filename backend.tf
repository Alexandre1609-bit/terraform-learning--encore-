terraform {
  backend "s3" {
    bucket = "my-first-bucket-test-1609"
    key    = "solo-tf/dev/terraform.tfstate"
    region = "eu-west-3"
  }
}
