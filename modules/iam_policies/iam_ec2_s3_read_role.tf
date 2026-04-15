resource "aws_iam_instance_profile" "iam_instance_profile_ec2_s3" {
  name = "test_profil"
  role = aws_iam_role.ec2_s3_read_role.name
}

resource "aws_iam_role" "ec2_s3_read_role" {
  name = "ec2_role"

  assume_role_policy = data.aws_iam_policy_document.iam_ec2_trust_policy.json
  tags = {
    Name        = "test_iam"
    Environment = "dev"
    Owner       = "alexandre"
  }
}

resource "aws_iam_policy" "iam_policy_s3_readonly" {
  name        = "bucket_policy"
  description = "restrict S3 bucket: read-only"

  policy = data.aws_iam_policy_document.s3_bucket_read_policy_doc.json
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_s3_attach" {
  role       = aws_iam_role.ec2_s3_read_role.name
  policy_arn = aws_iam_policy.iam_policy_s3_readonly.arn
}

data "aws_iam_policy_document" "iam_ec2_trust_policy" {
  statement {
    sid     = "EC2"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "s3_bucket_read_policy_doc" {
  statement {
    sid     = "s3_read_policies"
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:ListBucket"]
    resources = [
      "arn:aws:s3:::my-first-bucket-test-1609",
      "arn:aws:s3:::my-first-bucket-test-1609/*"
    ]

  }
}
