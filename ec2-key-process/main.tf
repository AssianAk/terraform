
resource "aws_instance" "local" {
    ami="ami-0f7b02bb6a0e14062"
    instance_type = "t2.micro"
    key_name = aws_key_pair.local.key_name
    depends_on = [ aws_key_pair.local ]
}
resource "aws_key_pair" "local" {
  key_name = "devops"
  public_key = file("~/.ssh/id_ed25519.pub")
}

