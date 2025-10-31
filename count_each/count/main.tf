resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.Ins_type
    key_name = var.key_name
    availability_zone = var.availability_zone
    count = length(var.sandbox)

    tags = {
        #name="web"
        #Name="web-${count.index}"
        Name=var.sandbox[count.index]
    }
  
}
variable "sandbox" {
    type = list(string)
    default = [ "dev","prod" ]
  
}