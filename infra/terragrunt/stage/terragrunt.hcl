terraform {
  extra_arguments "env_vars" {
    commands = ["apply", "plan"]
    env_vars = {
      AWS_PROFILE = "stage-profile"
    }
  }

  backend "s3" {
    bucket         = "iac-state-stage"
    key            = "retail/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "iac-locks-stage"
  }
}

inputs = {
  environment         = "stage"
  service_name        = "retail-api"
  image_tag           = "staging"
  desired_count       = 1
  deployment_strategy = "rolling"
}

