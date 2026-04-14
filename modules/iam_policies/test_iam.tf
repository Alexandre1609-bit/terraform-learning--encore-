resource "aws_iam_role" "my_first_role" {
  name = "testrole"

  assume_role_policy = data.aws_iam_policy_document.example_policy.json

  tags = {
    Name        = "test_iam"
    Environment = "dev"
    Owner       = "alexandre"
  }
}

resource "aws_iam_policy" "restrict_bucket" {
  name        = "restrict_bucket"
  description = "restrict S3 bucket: read-only"

  policy = {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:ListBucket"]
    resource = [
      "arn:aws:s3:::my-first-bucket-test-1609",
      "arn:aws:s3:::my-first-bucket-test-1609/*"
    ]
  }
}

resource "aws_iam_role_policy_attachment" "test_iam_attachment" {
  role       = aws_iam_role.my_first_role.name
  policy_arn = aws_iam_policy.restrict_bucket.arn
}

resource "aws_iam_instance_profile" "iam_test_profil" {
  name = "test_profil"
  role = aws_iam_role.my_first_role.name
}


data "aws_iam_policy_document" "example_policy" {

  statement {

    sid = "AllowEC2AssumeRole"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    effect = "Allow"

  }

}

data "aws_iam_policy_document" "restrict_s3_policy_doc" {
  statement {
    sid = "RestrictS3Policy"

    actions = ["sts::Assumerole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}
