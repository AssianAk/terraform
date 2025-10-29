module "local_name" {
  source = "github.com/AssianAk/modules"
  ami = "ami-06a8ca19af7f6f3f4"
  instance_type = "t2.nano"
  key_name = "dev2" 
}