terraform {
  extra_arguments "env_vars" {
    commands = ["apply", "plan"]
    env_vars = {
      AWS_PROFILE = "dev-profile"
    }
  }

  backend "s3" {
    bucket         = "iac-state-dev"
    key            = "retail/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "iac-locks-dev"
  }
}

inputs = {
  environment         = "dev"
  service_name        = "retail-api"
  image_tag           = "latest"
  desired_count       = 2 
  deployment_strategy = "rolling"
}

