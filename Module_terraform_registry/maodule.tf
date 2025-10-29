module "local" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_type = "t2.micro"
  key_name      = "dev2"
  monitoring    = true
  subnet_id     = "subnet-0d307982426a8060c"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}