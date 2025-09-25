package terraform.s3

deny[msg] {
  input.resource.type == "aws_s3_bucket"
  input.resource.values.acl == "public-read"
  msg = "S3 bucket should not be publicly readable"
}

