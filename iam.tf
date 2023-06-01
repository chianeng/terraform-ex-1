resource "aws_iam_user" "iam_user" {
  name = "${var.vpc_name}-chinedu"
}

resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name
}

data "aws_iam_policy_document" "s3_fullaccess_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "s3_fullaccess_policy" {
  name   = "s3-fullaccess-policy"
  user   = aws_iam_user.iam_user.name
  policy = data.aws_iam_policy_document.s3_fullaccess_policy.json
}