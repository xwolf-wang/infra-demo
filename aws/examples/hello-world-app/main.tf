provider "aws" {
  region = var.aws_region
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SERVERLESS "HELLO, WORLD" APP
# ---------------------------------------------------------------------------------------------------------------------

module "hello_world_app" {
  source = "../../modules/serverless-app"

  name = var.name

  source_dir = "${path.module}/javascript"
  runtime    = "nodejs10.x"
  handler    = "index.handler"

  environment_variables = {
    NODE_ENV = "production"
  }
}