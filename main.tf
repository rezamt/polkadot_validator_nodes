provider "aws" {
  region = var.region

  # we are using role based method to perform the actions.
  assume_role {
    role_arn = var.role_arn
    session_name = "default"
  }
}