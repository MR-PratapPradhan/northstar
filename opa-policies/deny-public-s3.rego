package terraform.s3

deny[msg] {
  resource := input.resource
  resource.type == "aws_s3_bucket"
  resource.values.acl == "public-read"
  msg = "S3 bucket should not be publicly readable"
}

