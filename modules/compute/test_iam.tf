resource "aws_iam_role" "my_first_role" {
  name = "testrole"

  assume_role_policy = data.aws_iam_policy_document.example_policy.json

  tags = {
    Name        = "test_iam"
    Environment = "dev"
    Owner       = "alexandre"
  }
}

resource "aws_iam_role_policy_attachment" "test_iam_attachment" {
  role       = aws_iam_role.my_first_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
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
