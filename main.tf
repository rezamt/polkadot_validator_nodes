provider "aws" {
  region = "ap-southeast-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc1"

  cidr = "10.0.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic

  azs                 = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  private_subnets     = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  public_subnets      = ["10.0.48.0/20", "10.0.64.0/20","10.0.80.0/20"]
  database_subnets    = ["10.0.96.0/20", "10.0.112.0/20","10.0.128.0/20"]

  create_database_subnet_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC endpoint for S3
  enable_s3_endpoint = true

  # VPC endpoint for DynamoDB
  enable_dynamodb_endpoint = true

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = [{}]
  default_security_group_egress  = [{}]

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  tags = {
    Owner       = "Nucoin"
    Environment = "Development"
  }

  vpc_endpoint_tags = {
    Project  = "Nucoin"
    Endpoint = "true"
  }
}
