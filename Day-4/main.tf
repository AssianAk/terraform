resource "aws_instance" "name" {
    ami = "ami-0f7b02bb6a0e14062"
    instance_type = "t2.micro"
    key_name = "dev2"
}