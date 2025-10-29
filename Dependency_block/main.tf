resource "aws_s3_bucket" "local" {
  bucket = "mynewawsbuckt4440"
  depends_on = [ aws_instance.local ]
}

resource "aws_instance" "local" {
  ami="ami-0f7b02bb6a0e14062"
  instance_type="t2.micro"
  key_name= "dev2"
}