terraform {
  extra_arguments "env_vars" {
    commands = ["apply", "plan"]
    env_vars = {
      AWS_PROFILE = "prod-profile"
    }
  }

  backend "s3" {
    bucket         = "iac-state-prod"
    key            = "retail/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "iac-locks-prod"
  }
}

inputs = {
  environment         = "prod"
  service_name        = "retail-api"
  image_tag           = "stable"
  desired_count       = 3
  deployment_strategy = "blue-green"
}

