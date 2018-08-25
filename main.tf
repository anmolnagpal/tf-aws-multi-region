module "vpc" {
  source     = "vpc"
  region     = "eu-west-1"
  key        = "test-key"
  cidr_block = "10.0.0.0/16"
  app        = "test"

  tags = {
    Environment = "test"
    ManagedBy   = "tf"
  }
}

module "ec2" {
  source = "ec2"

}
