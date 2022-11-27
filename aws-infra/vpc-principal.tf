module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.preFixName}-VPC"
  cidr = "${var.preCidr}.0.0/16"

  azs = ["${var.awsResourceRegion}a", "${var.awsResourceRegion}b", "${var.awsResourceRegion}c"]
  private_subnets = ["${var.preCidr}.1.0/24", "${var.preCidr}.2.0/24"]

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.preFixName}-VPC"
    Type = "VPC"
  }
}