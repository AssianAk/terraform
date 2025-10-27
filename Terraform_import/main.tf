resource "aws_instance" "manualvm" {
    ami = "ami-06a8ca19af7f6f3f4"
    instance_type = "t2.nano"
    key_name = "dev2"
    availability_zone = "eu-west-2b"
    tags = {
      Name="my-ec2"
    }
  
}