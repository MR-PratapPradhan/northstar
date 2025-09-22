terraform {
  source = "../../modules//ecs-service"
}

module "ecs_service" {
  source              = "../../modules/ecs-service"
  environment         = var.environment
  service_name        = var.service_name
  image_tag           = var.image_tag
  desired_count       = var.desired_count
  deployment_strategy = var.deployment_strategy
}

module "alb" {
  source       = "../../modules/alb"
  environment  = var.environment
  service_name = var.service_name
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.environment
}

