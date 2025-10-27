resource "aws_instance" "ec2" {
  ami = "ami-06a8ca19af7f6f3f4"
    instance_type = "t2.micro"
    key_name = "dev2"
}