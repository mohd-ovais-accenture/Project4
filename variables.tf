variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region for provider configuration"
}

variable "iam_username" {
  type        = string
  default     = "project4-s3-reader-user"
  description = "Name of the IAM user to create"
}

variable "s3_read_policy_json" {
  type        = string
  description = "IAM policy JSON granting read-only access to S3"
  default     = <<-POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "S3ReadOnlyAccess",
          "Effect": "Allow",
          "Action": [
            "s3:Get*",
            "s3:List*"
          ],
          "Resource": "*"
        }
      ]
    }
  POLICY
}
