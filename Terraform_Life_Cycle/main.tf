resource "aws_instance" "dev" {
    ami ="ami-06a8ca19af7f6f3f4"
    instance_type = "t2.micro"
    key_name = "dev2"
    availability_zone = "eu-west-2a" 

tags = {
    Name="dev"
}

# lifecycle {
#   prevent_destroy = true  #terraform will give error when it attempt to destro resource
# }

# lifecycle {
#   create_before_destroy = true  #this attribute will create new resouce before destroy old one
# }

# lifecycle {
#   ignore_changes = [ tags, ]  #this means that terraform will never update the object tag name
# }
  
}