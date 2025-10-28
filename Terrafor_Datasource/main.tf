data "aws_subnet" "sub" {
  filter {
    name="tag:Name"
    values = ["dec-subnet"]  #insert value here
  }
}


resource "aws_instance" "dev" {
    ami ="ami-06a8ca19af7f6f3f4"
    instance_type = "t2.micro"
    key_name = "dev2"
    subnet_id = data.aws_subnet.sub.id
 

tags = {
    Name="dev"
}
}