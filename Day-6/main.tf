resource "aws_instance" "name" {
    ami = "ami-06a8ca19af7f6f3f4"
    key_name = "dev2"
    instance_type = "t2.micro"
}