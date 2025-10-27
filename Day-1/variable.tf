variable "ami" {
    description = "calling ami"
    type = string
    default = ""
}
variable "Ins_type" {
  description = "type of instance"
  type = string
  default = ""
}
variable "key_name" {
    description = "key for server"
    type=string
    default = ""
}
variable "availability_zone" {
    description = "zone in which server created"
    type = string
    default = ""
}