resource "aws_iam_user" "s3_reader" {
  name = var.iam_username

  tags = {
    Project = "project4"
  }
}

resource "aws_iam_policy" "s3_read_managed_policy" {
  name        = "${var.iam_username}-s3-read-policy"
  description = "Customer-managed S3 read-only policy stored in variable"
  policy      = var.s3_read_policy_json
}

resource "aws_iam_user_policy_attachment" "s3_read_attach" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read_managed_policy.arn
}

output "iam_user_name" {
  value = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  value = aws_iam_user.s3_reader.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.s3_read_managed_policy.arn
}
